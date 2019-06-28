<template>
  <div>
    <v-card>
      <v-layout row wrap class='inside-card'>
        <v-flex xs12 sm6 >
          <v-select
            class="with-margin"
            label="Date Convocation"
            :items='dateList'
            @input="filterDates"
          ></v-select>
        </v-flex>
        <v-flex xs12 sm6 >
          <v-select
            class="with-margin"
            label="Presence"
            :items='presenceList'
            @input="filterPresences"
          ></v-select>
        </v-flex>
        <v-flex xs12>
          <v-data-table
            :headers="headers"
            :items="items"
            item-key="id" :rows-per-page-items="[10,25,50,100]" rows-per-page-text="Résultats par page" must-sort :search="filters" :custom-filter="customFilter"           :no-data-text="'Aucune donnée disponible'"
            >
            <template v-slot:items="props">
              <td class="text-xs-left">{{ props.item.inscription.id }}</td>
              <td class="text-xs-left">{{ props.item.inscription.nom }}</td>
              <td class="text-xs-left">{{ props.item.inscription.prenom }}</td>
              <td class="text-xs-center">{{ props.item.date }}</td>
              <td class="text-xs-center">{{ props.item.heure }}</td>
              <td class="text-xs-center">{{ presenceToString(props.item.venu) }}</td>
              <td class="text-xs-center"><div v-if='props.item.venu'>-</div><v-btn v-if='!props.item.venu' color="success" small @click='openDialog(props.item)'>Présent</v-btn></td>
              <td class="text-xs-center">{{ props.item.note_cuisine }}<br/>({{props.item.ma_note_cuisine}})</td>
              <td class="text-xs-center">{{ props.item.note_personalite }}<br/>({{props.item.ma_note_personalite}})</td>
              <td class="text-xs-center"><div v-if='!props.item.venu'>-</div><v-btn v-if='props.item.venu' color="error" small @click='openDialog2(props.item)'>Noter</v-btn></td>
            </template>
          </v-data-table>
        </v-flex>
      </v-layout>
    </v-card>

    <!-- Dialog Presence -->
    <v-dialog v-model="dialog" max-width="500px">
        <v-card class='padded-card'>
            <v-card-text class='text-center'>
              <i class="fa fa-exclamation-circle icon-danger"></i>
              <br>
              <br>
              <h4 class='heading-danger'>Etes-vous sur de vouloir marquer {{activeItem.inscription.nom}} {{activeItem.inscription.prenom}} comme présent?</h4>
              <br>
            </v-card-text>
              <v-spacer></v-spacer>
            <v-card-actions class='flex-center'>
              <v-btn  @click="dialog = false">Annuler</v-btn>
              <v-btn color="success"  @click="marquerPresent(activeItem.id)">Valider</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>

    <!-- Dialog Notes -->
    <v-dialog v-model="dialog2" max-width="500px" transition="dialog-transition" >
      <NotesForm v-bind:item='activeItem' v-on:close='dialog2 = false' v-on:updateConvocations='updateConvocations'/>
    </v-dialog>
  </div>
</template>

<script>
  import Vue from 'vue'
  import axios from 'axios'
  import NotesForm from './NotesForm'
  const root = document.getElementById('casting')
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
    name: 'CastingTable',
    components: {NotesForm},
    data: () => ({
      filters: {
          date: '',
          presence: '',
        },
      presenceList: ['Tout', 'Oui', 'Non'],
      dialog: false,
      dialog2: false,
      activeItem: {inscription:{}},
      convocations: JSON.parse(root.dataset.convocations),
      admin: JSON.parse(root.dataset.admin),
      headers: [
        { text: 'ID', align: 'left', value: 'inscription.id'},
        { text: 'Nom', align: 'left', value: 'inscription.nom'},
        { text: 'Prenom', align: 'left', value: 'inscription.prenom'},
        { text: 'Date', value: 'date', align: 'center'},
        { text: 'Heure', value: 'heure', align: 'center'},
        { text: 'Présent?', align: 'center', value: 'venu'},
        { text: 'Marquer présence', align: 'center', value: 'tt'},
        { text: 'Note Cuisine', align: 'center', value: 'note_cuisine'},
        { text: 'Note Personalité', align: 'center', value: 'note_personalite'},
        { text: 'Noter', align: 'center', value: 'tt'},
      ],
    }),
    computed: {
      items() {
        return this.convocations.data.map(e => e.attributes)
      },
      dateList() {
        const dates = this.items.map(i => i.date)
        return ['Tout', ...dates]
      }
    },
    methods: {
      presenceToString(value) {
        return value ? 'Oui' : 'Non'
      },
      openDialog(item) {
        this.activeItem = item
        this.dialog = true
      },
      openDialog2(item) {
        this.activeItem = item
        this.dialog2 = true
      },
      updateConvocations(convocation) {
        const updatedConvocation = JSON.parse(convocation)
        const indexConvocations= this.convocations.data.map(i=> i.attributes.id).indexOf(updatedConvocation.data.attributes.id)
        this.$set(this.convocations.data,indexConvocations, updatedConvocation.data)
        this.activeItem = {inscription:{}}
      },
      marquerPresent(id) {
        axios.patch(`/convocations/${id}/present`,{}, config)
          .then((res) => {
            console.log(res)
            if(res.data.success) {
              this.dialog = false
              document.sweetAlert(`${this.activeItem.inscription.nom} ${this.activeItem.inscription.prenom} a été marqué comme présent`)
              const updatedConvocation = JSON.parse(res.data.convocations)
              const indexConvocations= this.convocations.data.map(i=> i.attributes.id).indexOf(updatedConvocation.data.attributes.id)
              this.$set(this.convocations.data,indexConvocations, updatedConvocation.data)
              this.activeItem = {inscription:{}}
            } else {
              document.sweetError('Erreur')
            }
          })
          .catch(err => document.sweetError('something went wrong'))
      },
      customFilter(items, filters, filter, headers) {
        const cf = new this.$MultiFilters(items, filters, filter, headers);
        cf.registerFilter('presence', function(presence, items) {
          if(presence === '') return items;
          if (presence === "Tout") return items;
          const valueP = () => { return presence === 'Oui' ? true : null}
          return items.filter(item => {
            return item.venu === valueP();
          }, presence)
        });

        cf.registerFilter('date', function(date, items) {
          if(date === '') return items;
          if(date === 'Tout') return items;
          return items.filter(item => {
            return item.date === date;
          }, date)
        });

        return cf.runFilters();
      },
      filterPresences(val) {
        this.filters = this.$MultiFilters.updateFilters(this.filters, {presence: val});
      },
      filterDates(val) {
        this.filters = this.$MultiFilters.updateFilters(this.filters, {date: val});
      },
    }
  }
</script>

<style scoped lang='scss'>
  .inside-card {
    padding: 20px;
  }
  .with-margin {
    margin: 0 15px;
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
