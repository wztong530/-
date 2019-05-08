<template>
  <div class="app-show">
    <my-reheader></my-reheader>
    <h1>正在热映</h1>
    <my-footer></my-footer>
  </div>
</template>
<script>
import myReheader from "@/components/reheader.vue";
import myFooter from "@/components/footer.vue";
export default {
  data(){
    return{}
  },
  components:{
    myReheader,myFooter
  }
}
</script>
<style scoped>

</style>
