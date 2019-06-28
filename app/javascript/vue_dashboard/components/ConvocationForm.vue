<template>
  <div>
    <v-card>
      <v-card-title>
        <span class="headline">Nouvelle Convocation</span>
      </v-card-title>

      <v-card-text>
        <v-form ref="form" v-model="valid" lazy-validation>
          <v-container grid-list-md>
            <v-layout wrap>
              <div class="flex-column">
                <h5 class='text-bold'>Personnes a Convoquées :</h5>
                <p>Numéros {{participants}}</p>
              </div>
              <v-flex xs12>
                <v-select :items='lieux' v-model="lieu" label="Lieu" :rules='[required]'></v-select>
              </v-flex>
              <v-flex xs12>
                <v-dialog
                  ref="dialog"
                  v-model="modal"
                  :return-value.sync="date"
                  persistent
                  lazy
                  full-width
                  width="290px"

                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                      label='Date'
                      append-icon="event"
                      readonly
                      v-on="on"
                      :value="formatedDate(date)"
                      :rules='[required]'
                    ></v-text-field>
                  </template>
                  <v-date-picker v-model="date" scrollable  color='error'  :min='minDate()' locale="fr">
                    <v-spacer></v-spacer>
                    <v-btn flat color="error" @click="modal = false">Annuler</v-btn>
                    <v-btn flat color="error" @click="$refs.dialog.save(date)">OK</v-btn>
                  </v-date-picker>
                </v-dialog>
              </v-flex>
              <v-flex xs12>
                <v-dialog
                  ref="dialog2"
                  v-model="modal2"
                  :return-value.sync="heure"
                  persistent
                  lazy
                  full-width
                  width="290px"

                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                      label='Heure'
                      append-icon="watch"
                      readonly
                      v-on="on"
                      :value="heure"
                      :rules='[required]'
                    ></v-text-field>
                  </template>
                  <v-time-picker v-model="heure" scrollable format="24hr"  color='error'>
                    <v-spacer></v-spacer>
                    <v-btn flat color="error" @click="modal2 = false">Annuler</v-btn>
                    <v-btn flat color="error" @click="$refs.dialog2.save(heure)">OK</v-btn>
                  </v-time-picker>
                </v-dialog>
              </v-flex>
            </v-layout>
          </v-container>
        </v-form>
      </v-card-text>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="error darken-1" flat @click="$emit('close')">Annuler</v-btn>
        <v-btn color="error darken-1" flat @click="dialog2 = true">Valider</v-btn>
      </v-card-actions>
    </v-card>

    <!-- Second Dialog With Form -->
    <v-dialog v-model="dialog2" max-width="500px">
        <v-card class='padded-card'>
            <v-card-text class='text-center'>
              <i class="fa fa-exclamation-circle icon-danger"></i>
              <br><br>
              <h3 class='heading-danger'>Vous ne pourrez pas revenir en arrière</h3>
              <br>
              <h4 class='heading-danger'>Etes-vous sur de vouloir continuer?</h4>
              <br>
            </v-card-text>
              <v-spacer></v-spacer>
            <v-card-actions class='flex-center'>
              <v-btn  @click="dialog2 = false">Annuler</v-btn>
              <v-btn color="error"  @click="createConvocation()">Valider</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>

  </div>
</template>

<script>
  import moment from 'moment'
  import axios from 'axios'
  import {required} from '../../vue_inscription/validate'

  const ROOT_URL = `${window.location.origin}`;
  const csrfToken = document.querySelector('meta[name="csrf-token"]').attributes.content.value;
  const config = {
     headers: {
          Accept: 'application/json',
        'Content-Type': 'application/json',
         'X-CSRF-Token': csrfToken
        },
      credentials: "same-origin"
  }

  export default {
    name: 'ConvocationForm',
    props: ['selected'],
    data: () => ({
      required: required,
      dialog2: false,
      valid: true,
      modal: false,
      modal2: false,
      lieu: '',
      date: '',
      heure: '',
      lieux: ['Four Seasons Hotel, Casablanca'],
    }),
    computed: {
      participants() {
        return this.selected.map( s => s.id)
      }
    },
    methods: {
      formatedDate(date) {
        return  moment(date).format('DD-MM-YYYY')
      },
      minDate() {
        const date = new Date()
        return date.toISOString().substr(0, 10);
      },
      createConvocation() {
        const formData = {
          convocation: {
            inscription_list: this.participants,
            date: this.date,
            heure: this.heure,
            lieu: this.lieu
          }
        }
        if (this.$refs.form.validate()) {
          console.log(formData)
          axios.post(`/convocations`, formData, config)
          .then((res) => {
            if(res.data.success) {
              this.dialog2 = false
              this.$emit('close')
              this.$emit('updateItems', res.data.inscriptions)
              this.lieu = ''
              this.date = ''
              this.heure = ''
              this.$emit('resetSelected')
              document.sweetAlert('Les convocations ont été envoyés')
            } else {
              document.sweetError(res.data.errors)
            }
          })
          .catch(err => document.sweetError(err))
        }
      }
    }
  }
</script>

<style scoped lang="scss">
  .v-card__title {
    color: white;
    background: var(--v-error-base);
  }
  .flex-column {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }
  .text-bold {
    font-weight: bold;
  }
    .icon-danger {
    font-size: 70px;
    color: var(--v-error-base);
  }

  .heading-danger {
    font-weight: bold;
    color: rgba(0,0,0,0.8)
  }

  h3.heading-danger {
    font-size: 20px;
  }
  h4.heading-danger {
    font-size: 16px;
  }

  .padded-card {
    padding: 20px 0px;
  }
  .flex-center {
    display: flex;
    justify-content: center;
    align-items: center;
  }
</style>
