<template>
  <div>
    <p v-bind:class="{arabic: locale === 'ar' }">{{question.text}}</p>
    <v-textarea v-bind:class="{arabic: locale === 'ar' }" v-model="question.contenu" solo box  :rules='[setRequired(question.required)]'v-if='question.type === "text"'  @change='reponse'></v-textarea>
    <v-text-field v-bind:class="{arabic: locale === 'ar' }" v-model="question.contenu" solo box :rules='[setRequired(question.required)]' v-if='question.type === "string"'  @change='reponse'></v-text-field>
    <v-text-field v-bind:class="{arabic: locale === 'ar' }" v-model="question.contenu" solo box :rules="[setRequired(question.required), number, minLength(10)]" v-if='question.type === "tel"' @change='reponse'></v-text-field>
    <v-text-field v-bind:class="{arabic: locale === 'ar' }" v-model="question.contenu" solo box :rules="[setRequired(question.required), isEmail]" v-if='question.type === "email"' @change='reponse'></v-text-field>
    <v-switch  v-bind:class="{arabic: locale === 'ar' }" v-model="question.contenu" :label='booleanToString(question.contenu)' color='error' v-if='question.type === "boolean"' @change='reponse'></v-switch>
  </div>
</template>

<script>
    import {required, number, isPhone, isEmail, minLength} from '../validate'
    const root = document.getElementById('app')

  export default {

    name: 'FormFields',
    props: ['question', 'reponses'],
    data: () => ({
      required: required, number: number, isPhone: isPhone, isEmail: isEmail, minLength: minLength,
      locale: JSON.parse(root.dataset.translations).locale
   }),
    methods: {
      reponse() {
        const id = this.question.id
        const question = this.reponses.find(r => r.question_id === id)
        question.contenu = this.question.contenu
      },
      booleanToString(param) {
        if(param) return 'Oui'
        if(!param) return 'Non'
      },
      setRequired(val) {
         if (val) return required
      }
    }
  }
</script>

<style scoped>
  p {
    font-size: 16px;
    color: #777;
  }
  .arabic{
    text-align: right;
  }
  .arabic.v-input{
    justify-content: flex-end;
  }
</style>

<style>
  .arabic input {
    text-align: right;
  }
  .arabic textarea {
    text-align: right;
  }
</style>
