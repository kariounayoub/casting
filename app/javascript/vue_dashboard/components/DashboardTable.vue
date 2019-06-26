<template>
  <div>
    <!-- Main Table -->
      <v-card >
        <v-layout row wrap class='inside-card'>
          <v-flex xs12 sm3 >
            <v-text-field
              class="with-margin"
              append-icon="search"
              label="Nom"
              single-line
              hide-details
              @input="filterNoms"
            ></v-text-field>
          </v-flex>
          <v-flex xs12 sm3 >
            <v-text-field
              class="with-margin"
              append-icon="search"
              label="Ville"
              single-line
              hide-details
              @input="filterVilles"
            ></v-text-field>
          </v-flex>
          <v-flex xs12 sm3 >
            <v-select
              class="with-margin"
              :items="ages"
              label="Age"
              @change="filterAges"
            ></v-select>
          </v-flex>
          <v-flex xs12 sm3 >
            <v-text-field
              class="with-margin"
              append-icon="search"
              label="Sexe"
              single-line
              hide-details
              @input="filterSexes"
            ></v-text-field>
          </v-flex>
          <v-flex xs12>
            <v-data-table :headers="headers":items="items" item-key="title" :rows-per-page-items="[10,25,50,100]" rows-per-page-text="Résultats par page" must-sort :search="filters" :custom-filter="customFilter"           :no-data-text="'Aucune donnée disponible'" id='my-datatable'>
              <template v-slot:items="props">
                <tr >
                  <td class="text-xs-left" >{{ props.item.id }}</td>
                  <td class="text-xs-left" >{{ props.item.reponses.nom }}</td>
                  <td class="text-xs-left">{{ props.item.reponses.prenom }}</td>
                  <td class="text-xs-left">{{ props.item.reponses.age }} ans</td>
                  <td class="text-xs-left">{{ props.item.reponses.sexe }}</td>
                  <td class="text-xs-left">{{ props.item.reponses.ville }}</td>
                  <td class="text-xs-left">{{ props.item.note_cuisine }}</td>
                  <td class="text-xs-left">{{ props.item.note_personalite }}</td>
                  <td class="text-xs-left"> <div class='with-border'><div :class="{'progress-bar': true, 'left-border': true, 'right-border': completionRate(props.item.percent_complete)}" role="progressbar" v-bind:style="{ width: props.item.percent_complete + '%' }" aria-valuenow='props.item.percent_complete' aria-valuemin="0" aria-valuemax="100">{{ props.item.percent_complete }} %</div></div></td>
                  <td class="text-xs-left"><a :href="originURL + '/inscriptions/' + props.item.id" class='link'><v-icon>visibility</v-icon></a></td>
                </tr>
              </template>
            </v-data-table>
          </v-flex>
        </v-layout>
      </v-card>
  </div>
</template>

<script>
  const root = document.getElementById('dashboard')


export default {
  name: 'DashboardTable',
  data: () => ({
    filters: {
      nom: '',
      ville: '',
      sexe: '',
      age: '',
    },
    ages: ['Tout', 8,9,10,11,12],
    originURL: window.location.origin,
    inscriptions: JSON.parse(root.dataset.inscriptions),
    headers: [
      { text: 'ID', align: 'left', value: 'id'},
      { text: 'Nom', align: 'left', value: 'reponses.nom'},
      { text: 'Prénom', value: 'reponses.prenom', align: 'left'},
      { text: 'Age', value: 'reponses.age', align: 'left'},
      { text: 'Sexe', value: 'reponses.sexe', align: 'left'},
      { text: 'Ville', value: 'reponses.ville', align: 'left'},
      { text: 'Note Cuisine', value: 'note_cuisine', align: 'left'},
      { text: 'Note Personalité', value: 'note_personalite', align: 'left'},
      { text: 'Formulaire', value: 'percent_complete', align: 'left'},
      { text: 'Voir Réponses', value: 'actions', align: 'left'},
    ],
  }),
  computed: {
    items() {
      return this.inscriptions.data.map(e => e.attributes)
    },
  },
  methods: {
    completionRate(item) {
      return item > 95
    },
    customFilter(items, filters, filter, headers) {
      const cf = new this.$MultiFilters(items, filters, filter, headers);

      cf.registerFilter('nom', function(searchWord, items) {
        if (searchWord.trim() === "") return items;

        return items.filter(item => {
          if (item.reponses.nom === null) return ''
          return item.reponses.nom.toLowerCase().includes(searchWord.toLowerCase());
        }, searchWord)
      });

      cf.registerFilter('ville', function(searchWord, items) {
        if (searchWord.trim() === "") return items;

        return items.filter(item => {
          if (item.reponses.ville === null) return ''
          return item.reponses.ville.toLowerCase().includes(searchWord.toLowerCase());
        }, searchWord)
      });

      cf.registerFilter('age', function(age, items) {
        if(age === '') return items;
        if (age === "Tout") return items;

        return items.filter(item => {
          return item.reponses.age === age;
        }, age)
      });

      cf.registerFilter('sexe', function(searchWord, items) {
        if (searchWord.trim() === "") return items;

        return items.filter(item => {
          if (item.reponses.sexe === null) return ''
          return item.reponses.sexe.toLowerCase().includes(searchWord.toLowerCase());
        }, searchWord)
      });


      return cf.runFilters();
    },
    filterNoms(val) {
      this.filters = this.$MultiFilters.updateFilters(this.filters, {nom: val});
    },
    filterVilles(val) {
      this.filters = this.$MultiFilters.updateFilters(this.filters, {ville: val});
    },
    filterSexes(val) {
      this.filters = this.$MultiFilters.updateFilters(this.filters, {sexe: val});
    },
    filterAges(val) {
      this.filters = this.$MultiFilters.updateFilters(this.filters, {age: val});
    },
  },

};
</script>

<style scoped lang="scss">
  .inside-card {
    padding: 20px;
  }
  .with-margin {
    margin: 0 15px;
  }
  .link:hover {
    text-decoration: none;
    i {
          color: var(--v-error-base);
    }
  }

  .with-border {
    border: 1px solid #ccc;
    border-radius: 20px;
  }
  .left-border {
    border-radius: 20px 0 0 20px;
  }

  .right-border {
    border-radius: 20px;
  }

</style>
