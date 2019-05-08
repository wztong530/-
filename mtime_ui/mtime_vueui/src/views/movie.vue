<template>
<div class="app-movie">
  <my-reheader></my-reheader>
  <!-- 影片简介 -->
  <div class="intro">
    <div class="intr_left">
      <img src="http://127.0.0.1:5050/img/show/show1.jpg" alt="">
    </div>
    <div class="intr_right">
      <h2>复仇者联盟4:终极之战</h2>
      <h3>Avengers: Endgame</h3>
      <h4>181分钟</h4>
      <h4>动作/冒险/奇幻</h4>
      <h4>2019年4月24日中国上映</h4>
      <h5 class="score">8.4</h5>
      <div>
        <p><router-link to="/login">我想看</router-link></p>
        <p><router-link to="/login">我要评分</router-link></p>
      </div>
    </div>
  </div>
  <h5 class="word">超级英雄们共谋大计战灭霸</h5>
  <router-link to="/film">
    <h4 class="tofilm" :class="tofilm_to_top">查影讯/购票</h4>
  </router-link>
  <div class="m_info" >
    <h5 :class="m_info_hide">
      《复仇者联盟3：无限战争》的毁灭性事件过后，宇宙由于疯狂泰坦灭霸的行动而变得满目疮痍。无论前方将遭遇怎样的后果，复仇者联盟都必须在剩余盟友的帮助下再一次集结，以逆转灭霸的所作所为，彻底恢复宇宙的秩序。
    </h5>
    <p class="btn_m_info" :class="btn_m_info_hide" @click="mInfoHide"></p>
  </div>
  <!-- 演职员 -->
  <h1>
    <router-link to="/">
      <span>160位演职员</span>
      <span class="t">></span>
    </router-link>
  </h1>
  <div class="person">
    <div class="psleft">
      <h4>导演</h4>
      <img src="http://127.0.0.1:5050/img/person/p1.jpg" alt="">
      <h4>安东尼.罗索</h4>
      <h5>Anthony Russo</h5>
    </div>
    <div class="psright">
      <h4>主要演员</h4>
      <ul>
        <li>
          <img src="http://127.0.0.1:5050/img/person/p2.jpg" alt="">
          <h4>小罗伯特.唐尼</h4>
          <h5>Robert Downey Jr.</h5>
          <h5>饰:托尼·斯塔克 ..</h5>
        </li>
        <li>
          <img src="http://127.0.0.1:5050/img/person/p3.jpg" alt="">
          <h4>克里斯·埃文斯</h4>
          <h5>Chris Evans</h5>
          <h5>饰:史蒂夫·罗杰斯..</h5>
        </li>
      </ul>
    </div>
  </div>
  <!-- 图片 -->
  <h1>
    <router-link to="/">
      <span>177张图片</span>
      <span class="t">></span>
    </router-link>
  </h1>
  <ul class="mpic">
    <li v-for="item of mpic_imgs" :key="item">
      <img :src="item" alt="">
    </li>
  </ul>
  <!-- 精选影评 -->
  <h1>
    <router-link to="/">
      <span>精选影评(81)</span>
      <span class="t">></span>
    </router-link>
  </h1>
  <dl>
    <dt>《复仇者联盟4》：最后的告别，讲不出再见</dt>
    <dd>在零点场看完《复仇者联盟4》之后，跟随着观众群慢慢往影院外走。快靠近电梯的时候，一位挑染着蓝色头发的女孩靠着墙壁..</dd>
  </dl>
  <div class="avat">
    <div class="avatar">
      <img src="http://127.0.0.1:5050/img/person/get.jpg" alt="">
    </div>
    <div>
      <p>happy木易</p>
      <p>2019-04-24 12:31:00 看过 - 评分 <span>8.0</span></p>
    </div>
  </div>
  <!-- 网友短评 -->
  <h1>
    <router-link to="/">
      <span>网友短评(3632)</span>
      <span class="t">></span>
    </router-link>
  </h1>
  <my-footer></my-footer>
  <return-top></return-top>
</div>
</template>
<script>
import myReheader from "@/components/reheader.vue";
import myFooter from "@/components/footer.vue";
import returnTop from "@/components/returnTop.vue";
export default {
  data(){
    return{
      btn_m_info_hide:{btn_m_hide:false},
      m_info_hide:{m_hide:true},
      tofilm_to_top:{tofilm_top:false},
      mpic_imgs:[
        "http://127.0.0.1:5050/img/mpic/m1.jpg",
        "http://127.0.0.1:5050/img/mpic/m2.jpg",
        "http://127.0.0.1:5050/img/mpic/m3.jpg",
        "http://127.0.0.1:5050/img/mpic/m4.jpg"
      ]
    }
  },
  methods:{
    mInfoHide(){
      if(this.btn_m_info_hide.btn_m_hide==false){
        this.btn_m_info_hide={btn_m_hide:true};
        this.m_info_hide={m_hide:false};
      }else{
        this.btn_m_info_hide={btn_m_hide:false};
        this.m_info_hide={m_hide:true};
      }
    },
    scrollTop(){
      var scrolltop=window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
      console.log(scrolltop)
      if(scrolltop>270){
        this.tofilm_to_top={tofilm_top:true}
      }else{
        this.tofilm_to_top={tofilm_top:false}
      }
    }
  },
  mounted(){
    window.addEventListener("scroll",this.scrollTop)
  },
  destroyed(){
    window.removeEventListener("scroll",this.scrollTop)
  },
  components:{
    myReheader,myFooter,returnTop
  }
}
</script>
<style scoped>
.app-movie .avat{
  display: flex;
  padding:0 20px;
  border-bottom: 1px solid #ddd;
  padding-bottom: 20px;
}
.app-movie .avatar{
  width:15%;
}
.app-movie .avatar img{
  border-radius: 50%;
  width:100%;
}
.app-movie .avatar+div{
  width:85%;
  text-align: justify;
  padding-left: 20px;
}
.app-movie .avatar+div p{
  font-size:16px;
  color:#666;
  margin:2px;
}
.app-movie .avatar+div p span{
  display:inline-block;
  width:22px;
  height:22px; 
  font-size:14px;
  text-align: center;
  background-color:#659d0e;
  color: #fff;
}
.app-movie dl{
  padding: 0 20px;
  text-align: justify;
}
.app-movie dt{
  font-size:19px;
  font-weight: bold;
  margin-bottom:10px;
}
.app-movie dd{
  margin:0;
}
.app-movie ul.mpic{
  list-style: none;
  padding-left: 0;
  display:flex;
  justify-content: space-between;
  padding:0 20px;
}
.app-movie ul.mpic li{
  width:25%;
  padding: 5px;
}
.app-movie ul.mpic li img{
  width:100%;
}
.app-movie .person img{
  width:85%;
}
.app-movie .person{
  display:flex;
  text-align: justify;
  padding:5px 20px;
}
.app-movie .person h4{
  font-size:14px;
}
.app-movie .person h5{
  font-size: 12px;
  color:#2c3e50;
  line-height: 16px;
}
.app-movie .person .psleft{
  width:35%;
  border-right:1px solid #ddd;
}
.app-movie .person .psright{
  width:65%;
  padding:0 10px;
}
.app-movie .person .psright ul{
  display: flex;
  list-style: none;
  padding-left: 0;
  justify-content: space-between;
}
.app-movie .person .psright ul li{
  padding:0 5px;
  text-align: center;
}
.app-movie .m_info h5.m_hide{
  height: 46px;
  /*多行文本溢出显示省略号*/
  overflow: hidden;
  -webkit-line-clamp: 2;
  display: -webkit-box;
  -webkit-box-orient: vertical;
}
.app-movie .btn_m_info.btn_m_hide{
  transform: rotate(180deg);
}
.app-movie .m_info{
  border:1px solid #ddd;
  padding:10px 20px;
  margin-top:20px;
  padding-bottom:5px;
}
.app-movie .btn_m_info{
  background:url(http://127.0.0.1:5050/icon/i-tmore.png) no-repeat center center;
  height: 30px;
  margin:0;
}
.app-movie .m_info h5{
  font-size:18px;
  color:#2c3e50;
  line-height: 24px;
  text-align: justify;
  overflow: hidden;
}
.app-movie h1 a{
  color:#2c3e50;
  display: flex;
  justify-content: space-between;
  margin-right: 20px; 
}
.app-movie h1 a span.t{ 
  color:#cdcdcd;
}
.app-movie h1{
  font-size:20px;
  text-align: left;
  padding:10px;
  padding-left: 20px;
}
.app-movie .intro{
  display: flex;
  padding-top:20px;
  background:#1c2635 url(http://127.0.0.1:5050/img/cinemainfo_bg.png) no-repeat center 75px;
  background-size:auto 165px;
} 
.app-movie .intro .intr_left{
  width:45%;
}
.app-movie .intro .intr_left img{
  border:3px solid #fff;
  outline:1px solid #ddd;

}
.app-movie .intro .intr_right{
  width:55%;
  padding-right: 20px;
  text-align: left;
  position: relative;
}
.app-movie .intro .intr_right h2{
  color:#fff;
  font-size:22px;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
  margin-top:10px;
}
.app-movie .intro .intr_right h3{
  font-size:14px;
  color:#fff;
  margin-bottom:25px;
}
.app-movie .intro .intr_right h4{
  font-size: 15px;
  margin-top:10px;
}
.app-movie .intro .intr_right .score{
  position:absolute;
  width:32px;
  height:32px;
  font-size:18px;
  line-height: 32px;
  text-align: center;
  color:#fff;
  background-color:#659d0e;
  top:40px;
  right:20px;
}
.app-movie .intro .intr_right div{
  display:flex;
  justify-content: space-between;
  margin-top:10px;
}
.app-movie .intro .intr_right div p{
  width:90px;
  height:40px;
  border:1px solid #999;
  border-radius:40px;
  text-align: center;
  line-height: 40px;;
  font-size:17px;
}
.app-movie .intro .intr_right div p:first-child a{
  color:#777;
}
.app-movie .intro .intr_right div p:last-child a{
  color:#659d0e;
}
.app-movie .intro .intr_right div p:last-child{
  border:1px solid #659d0e;
}
.app-movie .word{
  background: url(http://127.0.0.1:5050/icon/i_dot.png) no-repeat 65px center;
  background-size:17px;
  color:#fd8900;
  font-size: 17px;
  margin:15px auto;
}
.app-movie .tofilm{
  font-size:19px;
  width:80%;
  margin:0 auto;
  height: 48px;
  background-color:#fd8900;
  color:#fff;
  line-height: 48px;
  border-radius:48px;
}
.app-movie .tofilm.tofilm_top{
  position:fixed;
  top:45px;
  left:37.5px;
}

</style>