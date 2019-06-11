<template>
  <div>
    <p>{{question.text}}</p>
    <v-textarea v-model="question.reponse" solo box :rules="[]" v-if='question.type === "text"'></v-textarea>
    <v-text-field v-model="question.reponse" solo box :rules="[isPhone, number]" v-if='question.type === "tel"'></v-text-field>
    <v-switch  v-model="question.reponse" :label='booleanToString(question.reponse)' color='error' v-if='question.type === "boolean"'></v-switch>
  </div>
</template>

<script>
    import {required, number, isPhone} from '../validate'

  export default {
    name: 'FormFields',
    props: ['question', 'responses'],
    data: () => ({
      required: required, number: number, isPhone: isPhone,
   }),
    computed: {
      response() {
        const id = this.question.id
       this.responses.id = this.question.reponse
      }
    },
    methods: {
      booleanToString(param) {
        if(param) return 'Oui'
        if(!param) return 'Non'
      },
    }
  }
</script>

<style scoped>
  p {
    font-size: 16px;
    color: #777;
  }

</style>
