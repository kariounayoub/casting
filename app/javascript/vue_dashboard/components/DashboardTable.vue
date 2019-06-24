<template>
  <div>
    Dashboard Table
    {{inscriptions}}
  </div>
</template>

<script>
  const root = document.getElementById('dashboard')

  export default {
    name: 'DashboardTable',
    data: () => ({
      inscriptions: JSON.parse(root.dataset.inscriptions)
    })
  }
</script>


<template>
  <div>
    <!-- Main Table -->
      <v-card >
        <v-layout row wrap class='inside-card'>
          <v-flex xs12 sm4 >
            <v-text-field
              class="with-margin"
              append-icon="search"
              label="Nom"
              single-line
              hide-details
              @input="filterNoms"
            ></v-text-field>
          </v-flex>
          <v-flex xs12>
            <v-data-table :headers="headers":items="items" item-key="title" :rows-per-page-items="[10,25,50,100]" rows-per-page-text="Résultats par page" must-sort :search="filters" :custom-filter="customFilter"           :no-data-text="'Aucune donnée disponible'" id='my-datatable'>
              <template v-slot:items="props">
                <tr >
                  <td class="text-xs-left" >{{ props.item.reponses.nom }}</td>
                  <td class="text-xs-left">{{ props.item.reponses.prenom }}</td>
                  <td class="text-xs-left">{{ props.item.reponses.date_naissance }}</td>
                  <td class="text-xs-left">{{ props.item.reponses.sexe }}</td>
                  <td class="text-xs-left"><v-icon>visibility</v-icon></td>
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
    },
    inscriptions: JSON.parse(root.dataset.inscriptions),
    headers: [
      { text: 'Nom', align: 'left', value: 'nom'},
      { text: 'Prénom', value: 'prenom', align: 'left'},
      { text: 'Date Naissance', value: 'date_naissance', align: 'left'},
      { text: 'Sexe', value: 'sexe', align: 'left'},
      { text: 'Actions', value: 'actions', align: 'left'},
    ],
  }),
  computed: {
    items() {
      return this.inscriptions.data.map(e => e.attributes)
    },
  },
  methods: {
    customFilter(items, filters, filter, headers) {
      const cf = new this.$MultiFilters(items, filters, filter, headers);

      cf.registerFilter('nom', function(searchWord, items) {
        if (searchWord.trim() === "") return items;

        return items.filter(item => {
          if (item.reponses.nom === null) return ''
          return item.reponses.nom.toLowerCase().includes(searchWord.toLowerCase());
        }, searchWord)
      });
      return cf.runFilters();
    },
    filterNoms(val) {
      this.filters = this.$MultiFilters.updateFilters(this.filters, {nom: val});
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

</style>
