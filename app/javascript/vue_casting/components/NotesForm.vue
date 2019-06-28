<template>
  <div>
    <v-card id='modal-note'>
      <v-card-title>
        <span class="headline">{{item.new_note ? 'Nouvelle Note' : 'Modifier Note'}}</span>
      </v-card-title>

      <v-card-text>
        <v-form ref="form" v-model="valid" lazy-validation>
          <v-container grid-list-md>
            <v-layout wrap>
              <div class="flex-column">
                <h5 class='text-bold'>Personne à Noter</h5>
                <p>{{item.inscription.nom}} {{item.inscription.prenom}}</p>
              </div>
              <v-flex xs12>
                  <h5 class='text-gray'>Note Cuisine</h5>
                  <div id='rating-note-cuisine'></div>
                  <h5 class='text-gray'>Note Personalité</h5>
                  <div id='rating-note-personalite'></div>
                  <v-text-field
                    id="note_note_cuisine"
                    v-model='note_cuisine'
                    class='d-none'
                  ></v-text-field>
                  <v-text-field
                    id="note_note_personalite"
                    v-model='note_personalite'
                    class='d-none'
                  ></v-text-field>
              </v-flex>
              </v-flex>
            </v-layout>
          </v-container>
        </v-form>
      </v-card-text>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="error darken-1" flat @click="$emit('close')">Annuler</v-btn>
        <v-btn color="error darken-1" flat @click="validateNote()">Valider</v-btn>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
  import 'rateyo'
  import axios from 'axios'

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
    name: 'NotesForm',
    props: ['item'],
    data: () => ({
      valid: true,
      note_cuisine: 0,
      note_personalite: 0,
    }),
    methods: {
      rateNoteCuisine(noteId) {
          $(noteId).rateYo({numStars: 10, fullStar: true});
          $(noteId).rateYo("option", "onSet", (rating) => {
              this.note_cuisine = rating*2;
          });
          $(noteId).rateYo('rating', parseFloat(this.note_cuisine)/2);
        },
      rateNotePersonalite(noteId) {
          $(noteId).rateYo({numStars: 10, fullStar: true});
          $(noteId).rateYo("option", "onSet", (rating) => {
              this.note_personalite = rating*2;
          });
          $(noteId).rateYo('rating', parseFloat(this.note_personalite)/2);
        },
      validateNote() {
        const formData = {
          note: {
            note_cuisine: this.note_cuisine,
            note_personalite: this.note_personalite
          }
        }
        if (this.item.new_note) {
          axios.post(`/convocations/${this.item.id}/notes`,formData, config)
          .then((res) => {
            if(res.data.success) {
              this.$emit('close')
              this.$emit('updateConvocations', res.data.convocations)
              document.sweetAlert(`La note a été crée`)
            } else {
              document.sweetError('Erreur')
            }
          })
          .catch(err => document.sweetError(err))
        } else {
          axios.patch(`/convocations/${this.item.id}/notes/${this.item.note_id}`,formData, config)
          .then((res) => {
            if(res.data.success) {
              this.$emit('close')
              this.$emit('updateConvocations', res.data.convocations)
              document.sweetAlert(`La note a été modifié`)
            } else {
              document.sweetError('Erreur')
            }
          })
          .catch(err => document.sweetError(err))
        }
      }
    },
    watch: {
      item: function(val) {
        this.note_cuisine = val.ma_note_cuisine  || 0
        this.note_personalite = val.ma_note_personalite || 0
        this.rateNoteCuisine('#rating-note-cuisine')
        this.rateNotePersonalite('#rating-note-personalite')
      }
    },
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
