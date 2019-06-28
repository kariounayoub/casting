<template>
  <v-app id="app" v-cloak>
    <CastingTable />
  </v-app>
</template>

<script>
import CastingTable from './components/CastingTable'

export default {
  name: 'App',
  components: {
    CastingTable
  },
}
</script>
