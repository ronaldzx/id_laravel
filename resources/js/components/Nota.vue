<template>
  <v-card class="mx-auto" >
    <v-img v-if="this.imagen" :src="this.imagen" height="200px"></v-img>
    <v-card-title>{{this.titulo}}</v-card-title>
    <v-card-subtitle>{{this.descripcion}}</v-card-subtitle>
    <v-card-actions>
      <v-btn text>Ver Detalles</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  props: ["id", "titulo", "descripcion", "imagen"],
  data: () => ({
    show: false
  })
};
</script>