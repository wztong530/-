<template>
  <div class="app-returnTop">
    <div class="returnTop" @click="reTop" v-show="reToTop"></div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      reToTop:false
    }
  },
  methods:{
    reTop(){
      window.scrollTo(0,0);
    },
    scrollToTop(){
      var scrollTop=window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
      if(scrollTop>window.outerHeight){
        this.reToTop=true;
      }else{
        this.reToTop=false;
      }
    }
  },
  mounted(){
    window.addEventListener("scroll",this.scrollToTop)
  },
  destroyed(){
    window.removeEventListener("scroll",this.scrollToTop);
  }
}
</script>
<style scoped>
.app-returnTop .returnTop{
  background:url(http://127.0.0.1:5050/icon/backtop1.png) no-repeat center center;
  background-size:contain;
  width:45px;height:45px;
  position:fixed;
  bottom: 50px;
  right:10px;
}
</style>
