<template>
  <v-app id="app" v-cloak>
    <Stepper />
  </v-app>
</template>

<script>
import Stepper from './components/Stepper'

export default {
  name: 'App',
  components: {
    Stepper
  },
}
</script>
