<template>
  <v-container>
    <v-row dense>
      <v-col cols="12">
        <v-card color="#385F73" dark>
          <v-card-title class="headline">{{this.titulo}}</v-card-title>
          <v-card-subtitle>{{this.descripcion}}</v-card-subtitle>
          <v-card-actions>
            <v-btn color="#fff" v-if="this.estado==1" text @click="show = !show">Ver notas</v-btn>
            <v-btn @click="registrarse(id)" color="#fff" v-else text>
              Registrarse
              <v-icon right dark>fa-plus</v-icon>
            </v-btn>

            <v-dialog v-model="dialog" width="500" v-if="this.estado==1">
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  @click="crearPostIt(id)"
                  text
                  color="#fff"
                  v-bind="attrs"
                  v-on="on"
                >Crear Post It</v-btn>
              </template>

              <v-card>
                <v-card-title class="headline grey lighten-2" primary-title>Crear Nuevo Post It</v-card-title>
                <v-container>
                  <v-form ref="form" v-model="valid" lazy-validation>
                    <v-text-field v-model="tituloPostIt" label="Título" required></v-text-field>
                    <v-textarea
                      v-model="descripcionPostIt"
                      name="input-7-1"
                      label="Contenido del Post It"
                      hint="Máx 300 caracteres"
                    ></v-textarea>
                    <v-file-input
                      v-model="imagenPostIt"
                      @change="obtenerImagen"
                      name="imagenPostIt"
                      accept="image/*"
                      label="Seleccionar una imagen"
                    ></v-file-input>
                  </v-form>
                </v-container>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="primary" text @click="guardarPostIt(id)">Guardar</v-btn>
                  <v-btn color="primary" text @click="cancelar()">Cancelar</v-btn>
                </v-card-actions>
              </v-card>
              <v-overlay :absolute="true" :value="overlayDialog">
                <v-progress-circular indeterminate size="64"></v-progress-circular>
              </v-overlay>
            </v-dialog>
            <v-btn
              color="#fff"
              v-if="this.estado==1"
              text
              @click="prepararSalir(id)"
            >Salir del grupo</v-btn>
          </v-card-actions>
          <v-expand-transition>
            <div v-show="show">
              <v-container>
                <v-row>
                  <v-col
                    cols="12"
                    xs="12"
                    sm="6"
                    md="4"
                    lg="3"
                    xl="3"
                    v-for="(item,i) in this.notas"
                    :key="i"
                  >
                    <nota-component
                      v-bind:titulo="item.titulo"
                      v-bind:descripcion="item.descripcion"
                      v-bind:imagen="item.imagen"
                      v-bind:id="item.id"
                    ></nota-component>
                  </v-col>
                </v-row>
              </v-container>
            </div>
          </v-expand-transition>
        </v-card>
      </v-col>
    </v-row>
    <v-dialog v-model="dialogSalir" max-width="290">
      <v-card>
        <v-card-title class="headline">¿Realmente desea salir del grupo?</v-card-title>
        <!-- <v-card-text>Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running.</v-card-text> -->
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green darken-1" text @click="dialogCancelar()">Cancelar</v-btn>
          <v-btn color="green darken-1" text @click="SalirGrupo()">Aceptar</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
export default {
  mounted() {},
  props: ["id", "titulo", "descripcion", "color", "estado", "notas"],
  data: () => ({
    show: false,
    dialog: false,
    tituloPostIt: "",
    imagenPostIt: null,
    descripcionPostIt: "",
    grupoId: null,
    valid: true,
    overlayDialog: false,
    dialogSalir: false
  }),
  methods: {
    registrarse(id) {
      this.$emit("overlayOn");
      axios
        .post("/registrarse-grupo", {
          id: id
        })
        .then(response => {
          this.refrescar();
        })
        .catch(error => {
          console.log(error);
          this.loading = false;
        });
    },
    obtenerImagen(e) {
      this.imagenPostIt = e;
    },
    prepararSalir(id) {
      this.dialogSalir=true;
      this.grupoId = id;
    },
    SalirGrupo() {
      this.dialogSalir = false;
      this.$emit("overlayOn");
      axios
        .post("salir-grupo", { grupo_id: this.grupoId })
        .then(response => {
          this.refrescar();
          this.dialogCancelar();
        })
        .catch(error => {
          console.log(error);
        });
    },
    dialogCancelar() {      
      this.grupoId = null;
    },
    crearPostIt(id) {
      this.grupoId = id;
    },
    guardarPostIt() {
      this.overlayDialog = true;
      var data = new FormData();
      data.append("imagen", this.imagenPostIt);
      data.append("titulo", this.tituloPostIt);
      data.append("descripcion", this.descripcionPostIt);
      data.append("grupo_id", this.grupoId);
      axios
        .post("guardar-nota", data)
        .then(response => {
          this.overlayDialog = false;
          this.refrescar();
          this.dialog = false;
          this.limpiarCampos();
        })
        .catch(error => {
          console.log(error);
        });
    },
    cancelar() {
      this.limpiarCampos();
      this.dialog = false;
    },
    refrescar() {
      this.$emit("registrado");
    },
    limpiarCampos() {
      this.tituloPostIt = "";
      this.imagenPostIt = null;
      this.descripcionPostIt = "";
      this.grupoId = null;
    }
  }
};
</script>

<style>
</style>