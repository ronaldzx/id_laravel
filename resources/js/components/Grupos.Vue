<template>
  <div>
    <headerContent-component
      v-bind:padre="this.$route.params.padre"
      v-bind:hijo="this.$route.params.hijo"
      v-bind:icono="this.$route.params.icono"
    ></headerContent-component>
    <v-container>
      <v-col v-for="(item,i) in grupos" :key="i" cols="12">
        <grupo-component
          v-bind:titulo="item.titulo"
          v-bind:descripcion="item.descripcion"
          v-bind:id="item.id"
          v-bind:color="item.color"
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
      grupos: {},
      estado: 0,
      loading: true,
      overlay: false
    };
  },
  methods: {
    overlayOn() {
      this.overlay = true;
    },
    obtenerGrupos() {
      this.overlay=true;
      axios
        .get("/obtener-grupos")
        .then(response => {
          this.grupos = response.data;
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