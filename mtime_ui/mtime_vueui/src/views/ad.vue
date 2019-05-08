<template>
<div class="app-ad">
  <!-- 分享好友 -->
  <img class="btn_share" src="http://127.0.0.1:5050/img/ad/share.png" alt="" @click="show">
  <div class="share" :class="share_class">
    <p>
      <img src="http://127.0.0.1:5050/img/ad/ele_share_sinaicon.png" alt=""><span>新浪微博</span>
    </p>
    <p>
      <img src="http://127.0.0.1:5050/img/ad/ele_share_qqicon.png" alt=""><span>腾讯微博</span>
    </p>
    <img class="btn_hide" src="http://127.0.0.1:5050/img/ad/btn_hide.png" alt="" @click="hide">
  </div>
  <!-- 主界面 -->
  <div class="content">
    <img src="http://127.0.0.1:5050/img/ad/114632.81673221_o.jpg" alt="">
    <img src="http://127.0.0.1:5050/img/ad/ig_03.jpg" alt="">
    <img src="http://127.0.0.1:5050/img/ad/ig_04.jpg" alt="">
    <img src="http://127.0.0.1:5050/img/ad/ig_05.jpg" alt="">
    <img src="http://127.0.0.1:5050/img/ad/ig_06.jpg" alt="">
    <img src="http://127.0.0.1:5050/img/ad/ig_07.jpg" alt="">
    <img src="http://127.0.0.1:5050/img/ad/ig_08.jpg" alt="">
    <img src="http://127.0.0.1:5050/img/ad/ig_09.jpg" alt="">
    <img src="http://127.0.0.1:5050/img/ad/ig_10.jpg" alt="" @click="toshop">
  </div>
  
</div>
</template>
<script>
export default {
  data(){
    return{
      share_class:{
        hide:true       
      }
    }
  },
  methods:{
    show(){
      this.share_class={hide:false}
    },
    hide(){
      this.share_class={hide:true}
    },
    toshop(){
      this.$router.push("/shop")
    }
  }
}
</script>
<style scoped>
.app-ad{
  position: relative;
}
.app-ad .btn_share{
  width:58px;
  position: fixed;
  top:0px;
  right:2px;
}
.app-ad .share{
  position:fixed;
  background-color: #333;
  width:100%;
  height:140px;
  display: flex;
  z-index: 1;
  top:0;
  transition: top 0.4s;
}
.app-ad .share p{
  width:50%;
  display: flex;
  flex-direction: column;
  justify-content:center;
  align-items: center;
}
.app-ad .share p img{
  width:25%;
}
.app-ad .share span{
  color:#fff;
  font-size:12px;
}
.app-ad .share .btn_hide{
  position: absolute;
  width:58px;
  bottom:-2px;
  right:2px;
}
.app-ad .share.hide{
  top:-140px;
}
.app-ad .content img{
  width:100%;
  margin:-3px 0;
}
</style>
