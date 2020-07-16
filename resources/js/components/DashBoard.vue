<template>
  <v-app id="inspire">
    <v-navigation-drawer
      class="cyan lighten-3"
      v-model="drawer"
      :clipped="$vuetify.breakpoint.lgAndUp"
      app
    >
      <v-list dense>
        <template v-for="opcion in menu">
          <v-row v-if="opcion.heading" :key="opcion.heading" align="center">
            <v-col cols="6">
              <v-subheader v-if="opcion.heading">{{ opcion.heading }}</v-subheader>
            </v-col>
            <v-col cols="6" class="text-center">
              <a href="#!" class="body-2 black--text">EDIT</a>
            </v-col>
          </v-row>
          <v-list-group
            v-else-if="opcion.hijo"
            :key="opcion.descripcion"
            v-model="opcion.model"
            :prepend-icon="opcion.model ? 'fa-chevron-up' : 'fa-chevron-down'"
            append-icon
          >
            <template v-slot:activator>
              <v-list-item-content>
                <v-list-item-title>{{ opcion.descripcion }}</v-list-item-title>
              </v-list-item-content>
            </template>
            <v-list-item
              v-for="(child, i) in opcion.hijo"
              :key="i"
              link
              :to="{name: child.route,
            params:{padre:opcion.descripcion,hijo:child.descripcion,icono:child.icono}}"
            >
              <v-list-item-action v-if="child.icono">
                <v-icon>{{ child.icono }}</v-icon>
              </v-list-item-action>
              <v-list-item-content>
                <v-list-item-title>{{ child.descripcion }}</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list-group>
          <v-list-item v-else :key="opcion.descripcion" link :to="{name: opcion.route}">
            <v-list-item-action>
              <v-icon>{{ opcion.icono }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>{{ opcion.descripcion }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar :clipped-left="$vuetify.breakpoint.lgAndUp" app color="cyan darken-2" dark>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title style="width: 300px" class="ml-0 pl-4 d-flex justify-space-around">
        RETO BACKEND
        <!-- <img :src="'../images/serenazgo.png'" alt style="width:15%;" />
        <img :src="'../images/larco.png'" alt style="width:15%;" />-->
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-menu
        bottom
        offset-y
        origin="center center"
        transition="scale-transition"
        min-width="300px"
      >
        <template v-slot:activator="{on}">
          <v-btn icon @click="messages=0" alt="Log out" v-on="on">
            <v-badge :content="messages" :value="messages" color="green" overlap>
              <v-icon>fa-bell</v-icon>
            </v-badge>
          </v-btn>
        </template>
        <v-list>
          <v-list-item class="d-flex justify-space-between" v-for="(item, i) in lista" :key="i">
            <div class="caption grey--text font-weight-light">{{item.fecha}}</div>
            <div class="caption grey--text text--darken-1 font-weight-bold">{{item.direccion}}</div>
          </v-list-item>
        </v-list>
      </v-menu>
      <v-btn icon @click="cerrarSesion()" alt="Log out">
        <v-icon>fa-power-off</v-icon>
      </v-btn>
    </v-app-bar>
    <v-content>
      <router-view></router-view>
    </v-content>
  </v-app>
</template>

<script>
export default {
  props: {
    source: String
  },
  data() {
    return {
      lista: [],
      messages: 0,
      menu: [],
      dialog: false,
      drawer: null
    };
  },
  mounted() {
    this.resetMenu();
    axios
      .get("obtener-menu")
      .then(response => {
        this.menu = response.data;
      })
      .catch(error => {});
  },
  methods: {
    formatDateTime(value) {
      return moment(value).format("DD/MM/YYYY h:mm:ss");
    },
    resetMenu() {
      this.lista = [];
      this.lista.push({
        direccion: "No hay datos",
        fecha: "",
        estado: 1
      });
    },
    cerrarSesion() {
      axios
        .get("/cerrar-sesion")
        .then(response => {
          this.$notify({
            type: "success",
            group: "foo",
            title: "Exito",
            text: "Has cerrado la sesión"
          });
          location.reload();
        })
        .catch(error => {
          this.$notify({
            type: "warn",
            group: "foo",
            title: "Error",
            text: "Ocurrió un error"
          });
          location.reload();
        });
    }
  }
};
</script>