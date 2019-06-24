<template>
  <v-app id="app" v-cloak>
    <DashboardTable />
  </v-app>
</template>

<script>
import DashboardTable from './components/DashboardTable'

export default {
  name: 'App',
  components: {
    DashboardTable
  },
}
</script>
