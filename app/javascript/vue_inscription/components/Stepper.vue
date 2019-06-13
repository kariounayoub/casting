<template>
  <div>
        <div v-if="flash.show && flash.variant === 'success'" role="alert" aria-live="polite" aria-atomic="true" class="show-alert alert alert-success offset" >
      <button type="button" data-dismiss="alert" aria-label="alertClose" class="close" @click="closeFlash()"><span aria-hidden="true">x</span></button>
      {{flash.message}}
    </div>
    <div v-if="flash.show && flash.variant === 'warning'" role="alert" aria-live="polite" aria-atomic="true" class="show-alert alert alert-warning offset" >
      <button type="button" data-dismiss="alert" aria-label="alertClose" class="close" @click="closeFlash()"><span aria-hidden="true">x</span></button>
      {{flash.message}}
    </div>
    <div v-if="flash.show && flash.variant === 'error'" role="alert" aria-live="polite" aria-atomic="true" class="show-alert alert alert-danger offset" >
      <button type="button" data-dismiss="alert" aria-label="alertClose" class="close" @click="closeFlash()"><span aria-hidden="true">x</span></button>
      {{flash.message}}
    </div>
    <v-container>
      <v-stepper v-model="e1" alt-labels non-linear>
        <!-- HEADER -->
          <v-stepper-header >
              <v-stepper-step color='error' class='text-center pointer' :complete="completed.includes(1)" step="1" @click='e1 = 1' >{{translations.stepper_title1}}</v-stepper-step>
              <v-divider></v-divider>
              <v-stepper-step color='error' class='text-center pointer' :complete="completed.includes(2)" step="2" @click='e1 = 2' >{{translations.stepper_title2}}</v-stepper-step>
              <v-divider></v-divider>
              <v-stepper-step color='error' class='text-center pointer' :complete="completed.includes(3)" step="3" @click='e1 = 3' >{{translations.stepper_title3}}</v-stepper-step>
              <v-divider></v-divider>
              <v-stepper-step color='error' class='text-center pointer' :complete="completed.includes(4)" step="4"  @click='e1 = 4' >{{translations.stepper_title4}}</v-stepper-step>
              <v-divider></v-divider>
              <v-stepper-step color='error' class='text-center pointer' :complete="completed.includes(5)" step="5" @click='e1 = 5' >{{translations.stepper_title5}}</v-stepper-step>
          </v-stepper-header>

      <!-- CONTENT -->
        <v-stepper-items>
          <!-- STEP 1 -->
            <v-stepper-content step="1">
              <v-form ref="form1" v-model="valid" lazy-validation>
                <h4 class='question-title'>{{translations.stepper_profile}}</h4>
                <v-container>
                  <v-layout row wrap>
                    <v-flex xs12 sm4 offset-sm-4>
                      <vue-dropzone v-if='activeDropzone' ref="dropzone0" id="drop0" :options='dropOptions' class="dropzone-message"></vue-dropzone>
                      <div class='thumb-wrapper'>
                        <img :src="photo_candidat" alt="" class='thumb'>
                      </div>
                    </v-flex>
                  </v-layout>
                </v-container>
                <h4 class='question-title'>{{evenement.questions.find(q => q.categorie === 'personnel').categorie_text}}</h4>
                <div v-for="question in evenement.questions">
                  <FormFields v-bind:question='question' v-if='question.categorie === "personnel" ' v-bind:reponses='reponses'/>
                </div>
                <v-btn id="suivant1" color="success" class="right rounded" :disabled="!valid" @click="validate(1,2)">{{translations.stepper_next}}</v-btn>
              </v-form>
            </v-stepper-content>

          <!-- STEP 2 -->
            <v-stepper-content step="2">
              <v-form ref="form2" v-model="valid" lazy-validation>
                <h4 class='question-title'>{{evenement.questions.find(q => q.categorie === 'tuteur').categorie_text}}</h4>
                <div v-for="question in evenement.questions">
                  <FormFields v-bind:question='question' v-if='question.categorie === "tuteur" ' v-bind:reponses='reponses'/>
                </div>
                <v-btn color="success" class="left rounded" :disabled="!valid"  @click="back()">{{translations.stepper_previous}}</v-btn>
                <v-btn id="suivant2" color="success" class="right rounded" :disabled="!valid" @click="validate(2,3)">{{translations.stepper_next}}</v-btn>
              </v-form>
            </v-stepper-content>

          <!-- STEP 3 -->
            <v-stepper-content step="3">
              <v-form ref="form3" v-model="valid" lazy-validation>
                <h4 class='question-title'>{{evenement.questions.find(q => q.categorie === 'ecole').categorie_text}}</h4>
                <div v-for="question in evenement.questions">
                  <FormFields v-bind:question='question' v-if='question.categorie === "ecole" ' v-bind:reponses='reponses' />
                </div>
                <v-btn color="success" class="left rounded" :disabled="!valid"  @click="back()">{{translations.stepper_previous}}</v-btn>
                <v-btn id="suivant2" color="success" class="right rounded" :disabled="!valid" @click="validate(3,4)">{{translations.stepper_next}}</v-btn>
              </v-form>
            </v-stepper-content>

          <!-- STEP 4 -->
            <v-stepper-content step="4">
              <v-form ref="form4" v-model="valid" lazy-validation>
                <h4 class='question-title'>{{evenement.questions.find(q => q.categorie === 'motivation').categorie_text}}</h4>
                <div v-for="question in evenement.questions">
                  <FormFields v-bind:question='question' v-if='question.categorie === "motivation"' v-bind:reponses='reponses'/>
                </div>
                <h4 class='question-title'>{{evenement.questions.find(q => q.categorie === 'cuisine').categorie_text}}</h4>
                <div v-for="question in evenement.questions">
                  <FormFields v-bind:question='question' v-if='question.categorie === "cuisine"' v-bind:reponses='reponses'/>
                </div>
                <h4 class='question-title'>{{evenement.questions.find(q => q.categorie === 'competence').categorie_text}}</h4>
                <div v-for="question in evenement.questions">
                  <FormFields v-bind:question='question' v-if='question.categorie === "competence"' v-bind:reponses='reponses'/>
                </div>
                <v-btn color="success" class="left rounded" :disabled="!valid"  @click="back()">{{translations.stepper_previous}}</v-btn>
                <v-btn id="suivant2" color="success" class="right rounded" :disabled="!valid" @click="validate(4,5)">{{translations.stepper_next}}</v-btn>
              </v-form>
            </v-stepper-content>

          <!-- STEP 5 -->
            <v-stepper-content step="5">
              <v-form ref="form5" v-model="valid" lazy-validation>
                <h4 class='question-title'>{{evenement.questions.find(q => q.categorie === 'competence').categorie_text}}</h4>
                <div v-for="question in evenement.questions">
                  <FormFields v-bind:question='question' v-if=' question.categorie === "perso"' v-bind:reponses='reponses'/>
                </div>
                <h4 class='question-title'>{{translations.stepper_photos}}</h4>
                <v-container>
                  <v-layout row wrap>
                    <v-flex xs12 sm4>
                      <h5 class='text-center'>{{translations.photo_sucre}}</h5>
                      <vue-dropzone v-if='activeDropzone' ref="dropzone1" id="drop1" :options='dropOptions' class="dropzone-message"></vue-dropzone>
                      <div class='thumb-wrapper'>
                        <img :src="photo1" alt="" class='thumb'>
                      </div>
                    </v-flex>
                    <v-flex xs12 sm4>
                      <h5 class='text-center'>{{translations.photo_sale}}</h5>
                      <vue-dropzone v-if='activeDropzone' ref="dropzone2" id="drop2" :options='dropOptions' class="dropzone-message"></vue-dropzone>
                      <div class='thumb-wrapper'>
                        <img :src="photo2" alt="" class='thumb'>
                      </div>
                    </v-flex>
                    <v-flex xs12 sm4>
                      <h5 class='text-center'>{{translations.photo_autre}}</h5>
                     <vue-dropzone v-if='activeDropzone' ref="dropzone3" id="drop3" :options='dropOptions' class="dropzone-message"></vue-dropzone>
                      <div class='thumb-wrapper'>
                        <img :src="photo3" alt="" class='thumb'>
                      </div>
                    </v-flex>
                  </v-layout>
                </v-container>

                <v-btn color="success" class="left rounded"  :disabled="!valid" @click="back()">{{translations.stepper_previous}}</v-btn>
                <v-btn id="suivant3" color="success" class="right rounded" :disabled="!valid" @click="validate(5,5)">{{translations.stepper_inscription}}</v-btn>
              </v-form>
            </v-stepper-content>

        </v-stepper-items>
      </v-stepper>
    </v-container>
  </div>
</template>

<script>
import axios from 'axios' // axios is an http library to make http requrests (can use default fetch api instead)
import FormFields from './FormFields'
  import vue2Dropzone from 'vue2-dropzone'

const root = document.getElementById('app')
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
    name: 'Stepper',
    components: {
      FormFields,
      vueDropzone: vue2Dropzone
    },
    data () {
      return {
        completed: [],
        e1: 0,
        valid: true,
        evenement: JSON.parse(root.dataset.evenement).data.attributes,
        inscription: JSON.parse(root.dataset.inscription),
        photo1: root.dataset.photo1,
        photo2: root.dataset.photo2,
        photo3: root.dataset.photo3,
        photo_candidat: root.dataset.photo_candidat,
        translations: JSON.parse(root.dataset.translations),
        activeDropzone: false,
        flash: {
          message: null,
          show: false,
          variant: null,
        },
        dropOptions: {
          url: 'localhost:3000/encaissement/fichiers',
          thumbnailWidth: 150,
          thumbnailHeight: 70,
          maxFilesize: 5,
          dictDefaultMessage: 'Glissez une photo ici',
          autoProcessQueue: false,
          acceptedFiles: "image/*",
          uploadMultiple: false,
          addRemoveLinks: true,
          maxFiles: 1,
          init: function() {
            this.on("maxfilesexceeded", function(file) {
            this.removeAllFiles();
            this.addFile(file);
            });
            this.on('addedfile', function(file) {
              var fileReader = new FileReader();
              fileReader.onload = (fileLoadedEvent) => {
                  file.dataURL = fileLoadedEvent.target.result;
              };
              fileReader.readAsDataURL(file);
            });
          }
        }
      }
    },
    computed: {
      reponses() {
        return this.evenement.questions.map(q => ({question_id: q.id, id: q.r_id, contenu: q.contenu}))
      }
    },
    methods: {
      closeFlash() {
        flash.show = false
        flash.message = null
        flash.variant = null
      },
      validate (step,page) {
        const forms = [this.$refs.form1,this.$refs.form2,this.$refs.form3,this.$refs.form4,this.$refs.form5]
        let form = null
        if (step === 1) {
          form = forms[0]
          if (form.validate()) this.completed.push(1)
        } else if (step === 2) {
          form = forms[1]
          if (form.validate()) this.completed.push(2)
        } else if (step === 3) {
          form = forms[2]
          if (form.validate()) this.completed.push(3)
        } else if (step === 4) {
          form = forms[3]
          if (form.validate()) this.completed.push(4)
        } else if (step === 5) {
          form = forms[4]
        }
        if (form.validate()) {
          this.e1 = page
          if (step === 5) { // This is where all the form data is cleaned and sent to post requests
            if (forms.every(f => f.validate())) {
              const formFields = {
                inscription: {
                  photo_candidat: document.querySelector('#drop0').dropzone.getAcceptedFiles()[0] === undefined ? null : document.querySelector('#drop0').dropzone.getAcceptedFiles()[0].dataURL,
                  photo_1: document.querySelector('#drop1').dropzone.getAcceptedFiles()[0] === undefined ? null : document.querySelector('#drop1').dropzone.getAcceptedFiles()[0].dataURL,
                  photo_2: document.querySelector('#drop2').dropzone.getAcceptedFiles()[0] === undefined ? null : document.querySelector('#drop2').dropzone.getAcceptedFiles()[0].dataURL,
                  photo_3: document.querySelector('#drop3').dropzone.getAcceptedFiles()[0] === undefined ? null : document.querySelector('#drop3').dropzone.getAcceptedFiles()[0].dataURL,

                  id: this.inscription === false ? null : this.inscription,
                  reponses_attributes: this.reponses
                },
              }
              if (this.inscription === false) {
                axios.post(`/inscriptions`, formFields, config)
                .then((res) => {
                  if(res.data.success) {
                    this.flash = {message: this.translations.insc_new, variant: 'success', show: 'true'}
                    window.location = `${ROOT_URL}/inscriptions`
                  } else {
                    this.flash = {message: this.translations.insc_new_err, variant: 'error', show: 'true'}
                  }
                })
                .catch(err => this.flash = {message: err, variant: 'error', show: 'true'})
              }

              if (this.inscription !== false) {
                axios.patch(`/inscriptions/${this.inscription}`, formFields, config)
                .then((res) => {
                  if(res.data.success) {
                    this.flash = {message: this.translations.insc_edit, variant: 'success', show: 'true'}
                     window.location = `${ROOT_URL}/inscriptions`
                  } else {
                    this.flash = {message: this.translations.insc_edit_err, variant: 'error', show: 'true'}
                  }
                })
                .catch(err => this.flash = {message: err, variant: 'error', show: 'true'})
              }
            } else (
              this.flash = {message: this.translations.insc_incomplete, variant: 'error', show: 'true'}
            )
          }
        }
      },
      back () {
        this.e1--
      }
    },
    mounted() {
      this.dropOptions.dictDefaultMessage = this.translations.stepper_add_photo
      this.activeDropzone = true
    }
  }
</script>


<style scoped>
/*CUSTOM STYLING OF STEPPER TITLE*/

/*END OF STYLING OF STEPPER TITLE*/

</style>

<style lang='scss'>
  .vue-dropzone {
    min-height: 120px;
    cursor: pointer;
    text-align: center;
     border: 1px solid #e9ecef;
    border-radius: 5px;
    padding: 50px;
    background: #eee;
    box-shadow: 1px 3px 1px #ccc;
  }

  .dropzone-message  {
    font-size: 15px;
  }
  .form-title {
    text-align: center;
    color: rgba(0,0,0,0.8);
    h4 {
      font-weight: 700,
    }
  }
  .thumb {
    width: 100px;
    height: 100px;
  }
  .thumb-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .question-title {
    font-weight: bold;
    text-align: center;
    margin: 20px;
  }
  .pointer {
    cursor: pointer;
  }
</style>
