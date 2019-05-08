<template>
  <div class="app-reheader">
    <mt-header fixed>
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
  </div>
</template>
<script>
export default {
  data(){
    return{}
  }
}
</script>
<style scoped>
.app-reheader{
  padding-top:40px;
  overflow-x:hidden;
}
.app-reheader .mint-header{
  background:#1c2635 url(http://127.0.0.1:5050/icon/logo_mtime.png) no-repeat center center;
  background-size:auto 32px;
}
.app-reheader .mint-header .mint-button{
  margin-left:10px; 
}
</style>