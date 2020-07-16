<template>
  <v-app id="inspire">
    <v-content>
      <v-container class="fill-height" fluid>
        <v-row align="center" justify="center">
          <v-col cols="12" sm="8" md="4">
            <v-card class="elevation-12">
              <v-toolbar color="primary" dark flat>
                <v-toolbar-title>Autenticación</v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-form>
                  <v-text-field
                    label="Login"
                    name="login"
                    prepend-icon="person"
                    type="text"
                    v-model="usuario"
                  ></v-text-field>

                  <v-text-field
                    id="password"
                    label="Password"
                    name="password"
                    prepend-icon="lock"
                    type="password"
                    v-model="password"
                  ></v-text-field>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="primary" @click="iniciarSesion()">Login</v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
      <notifications group="foo" animation-type="velocity" />
    </v-content>
  </v-app>
</template>

<script>
export default {
  data: () => {
    return {
      usuario: "",
      password: ""
    };
  },
  props: {
    source: String
  },
  methods: {
    iniciarSesion() {
      axios
        .post("/iniciar-sesion", {
          usuario: this.usuario,
          password: this.password
        })
        .then(response => {
          this.$notify({
            type: "success",
            group: "foo",
            title: "Exito",
            text: "Usuario identificado"
          });
          location.reload();
        })
        .catch(error => {
            let er = error.response.data.errors;
            let mensaje = 'error no identificado'
            if(er.hasOwnProperty('usuario')){
                mensaje = er.usuario[0];
            }else if(er.hasOwnProperty('password')){
              mensaje = er.password[0]
            }else if(er.hasOwnProperty('login')) {
                mensaje = er.login[0];
            }
          this.$notify({
            type: "warn",
            group: "foo",
            title: "Error",
            text: mensaje
          });
        });
    }
  }
};
</script>