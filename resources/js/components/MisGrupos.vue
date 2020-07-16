<template>
  <div>
    <headerContent-component
      v-bind:padre="this.$route.params.padre"
      v-bind:hijo="this.$route.params.hijo"
      v-bind:icono="this.$route.params.icono"
    ></headerContent-component>
    <v-container>
      <v-col v-for="(item,i) in misGrupos" :key="i" cols="12">
        <grupo-component
          v-bind:titulo="item.grupo[0]['titulo']"
          v-bind:descripcion="item.grupo[0]['descripcion']"
          v-bind:id="item.grupo[0]['id']"
          v-bind:color="item.grupo[0]['color']"
          v-bind:notas="item.nota"
          v-bind:estado="estado"
          v-on:registrado="obtenerGrupos()"
          v-on:overlayOn="overlayOn()"
        ></grupo-component>
      </v-col>
      <v-overlay :absolute="true" :value="overlay">
        <v-progress-circular indeterminate size="64"></v-progress-circular>
      </v-overlay>
    </v-container>
  </div>
</template>

<script>
export default {
  mounted() {
    this.obtenerGrupos();
  },
  data() {
    return {
      misGrupos: {},
      estado: 1,
      overlay: false
    };
  },
  methods: {
    overlayOn() {
      this.overlay = true;
    },
    obtenerGrupos() {
      this.overlay = true;
      axios
        .get("/obtener-mis-grupos")
        .then(response => {
          this.misGrupos = response.data;
          this.overlay = false;
        })
        .catch(error => {
          console.log(error);
          this.overlay = false;
        });
    }
  }
};
</script>