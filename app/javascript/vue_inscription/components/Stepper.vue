<template>
  <div>
    <v-container>
      <v-stepper v-model="e1" alt-labels>
        <!-- HEADER -->
          <v-stepper-header >
              <v-stepper-step color='error' :complete="e1 > 1" step="1">Personnel</v-stepper-step>
              <v-divider></v-divider>
              <v-stepper-step color='error' :complete="e1 > 2" step="2">Tuteur</v-stepper-step>
              <v-divider></v-divider>
              <v-stepper-step color='error' :complete="e1 > 3" step="3">Ecole</v-stepper-step>
              <v-divider></v-divider>
              <v-stepper-step color='error' :complete="e1 > 4" step="4" class='text-center' >Cuisine & Motivation</v-stepper-step>
              <v-divider></v-divider>
              <v-stepper-step color='error' :complete="e1 > 5" step="5">Plus sur toi</v-stepper-step>
          </v-stepper-header>

      <!-- CONTENT -->
        <v-stepper-items>
          <!-- STEP 1 -->
            <v-stepper-content step="1">
              <v-form ref="form1" v-model="valid" lazy-validation>
                <br><br><br> Step 1 <br><br><br>
                <v-btn id="suivant1" color="success" class="right rounded" :disabled="!valid" @click="validate(1,2)">Suivant</v-btn>
              </v-form>
            </v-stepper-content>

          <!-- STEP 2 -->
            <v-stepper-content step="2">
              <v-form ref="form2" v-model="valid" lazy-validation>
                <br><br><br> Step 2 <br><br><br>
                <v-btn color="success" class="left rounded" :disabled="!valid"  @click="back()">Précédent</v-btn>
                <v-btn id="suivant2" color="success" class="right rounded" :disabled="!valid" @click="validate(2,3)">Suivant</v-btn>
              </v-form>
            </v-stepper-content>

          <!-- STEP 3 -->
            <v-stepper-content step="3">
              <v-form ref="form3" v-model="valid" lazy-validation>
                <br><br><br> Step 3 <br><br><br>
                <v-btn color="success" class="left rounded" :disabled="!valid"  @click="back()">Précédent</v-btn>
                <v-btn id="suivant2" color="success" class="right rounded" :disabled="!valid" @click="validate(3,4)">Suivant</v-btn>
              </v-form>
            </v-stepper-content>

          <!-- STEP 4 -->
            <v-stepper-content step="4">
              <v-form ref="form4" v-model="valid" lazy-validation>
                <br><br><br> Step 4 <br><br><br>
                <v-btn color="success" class="left rounded" :disabled="!valid"  @click="back()">Précédent</v-btn>
                <v-btn id="suivant2" color="success" class="right rounded" :disabled="!valid" @click="validate(4,5)">Suivant</v-btn>
              </v-form>
            </v-stepper-content>

          <!-- STEP 5 -->
            <v-stepper-content step="5">
              <v-form ref="form3" v-model="valid" lazy-validation>
                <br><br><br>Step 3 <br><br><br>
                <v-btn color="success" class="left rounded"  :disabled="!valid" @click="back()">Précédent</v-btn>
                <v-btn id="suivant3" color="success" class="right rounded" :disabled="!valid" @click="validate(5,5)">Inscription</v-btn>
              </v-form>
            </v-stepper-content>

        </v-stepper-items>
      </v-stepper>
    </v-container>
  </div>
</template>

<script>

  export default {
    name: 'Stepper',
    components: {

    },
    data () {
      return {
        e1: 0,
        valid: true,
      }
    },
    methods: {
      validate (step,page) {
        let form = null // This if loop is for partial validation of each form individually
        if (step === 1) {
          form = this.$refs.form1
        } else if (step === 2) {
          form = this.$refs.form2
        } else if (step === 3) {
          form = this.$refs.form3
        } else if (step === 4) {
          form = this.$refs.form4
        } else if (step === 5) {
          form = this.$refs.form5
        }
        if (form.validate()) {
          this.e1 = page
          if (step === 5) { // This is where all the form data is cleaned and sent to post requests
            console.log('validate')
          }
        }
      },
      back () {
        this.e1--
      }

    }
  }
</script>


<style scoped>
/*CUSTOM STYLING OF STEPPER TITLE*/

/*END OF STYLING OF STEPPER TITLE*/

</style>

<style lang='scss'>

  .form-title {
    text-align: center;
    color: rgba(0,0,0,0.8);
    h4 {
      font-weight: 700,
    }
  }
</style>
