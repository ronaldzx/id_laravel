<template>
  <v-card class="mx-auto" max-width="100%" outlined>
    <v-card-title>
      <v-icon>{{this.icono}}</v-icon>
      &nbsp;&nbsp;{{this.hijo}}
    </v-card-title>

    <v-card-text>
      <v-row align="center" class="mx-0">
        <div>{{this.padre}} > {{this.hijo}}</div>
      </v-row>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  mounted() {
  },
  props: ["padre", "hijo", "icono"]
};
</script>