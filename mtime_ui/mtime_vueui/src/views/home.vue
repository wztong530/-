<template>
<div class="app-home">
  <my-header></my-header>
  <my-search></my-search>
  <!-- 正在热映 -->
  <h2>
    <router-link to="/show">
      <span>正在热映(25部)</span>
      <span class="t">></span>
    </router-link>
  </h2>
  <ul class="show">
    <li v-for="item of showlist" :key="item.i">
      <router-link :to="item.href">
        <div class="pic">
          <img :src="item.img_url" alt="">
          <p class="score">{{item.score}}</p>
        </div>
        <h5 class="title">{{item.title}}</h5>
      </router-link>
    </li>
  </ul>
  <!-- 即将上映 -->
  <h2>
    <router-link to="/willshow">
      <span>即将上映(51部)</span>
      <span class="t">></span>
    </router-link>
  </h2>
  <!-- 广告 -->
  <div class="ad">
    <router-link to="/ad">
      <img src="http://127.0.0.1:5050/img/get.jpg" alt="">
    </router-link>
  </div>
  <!-- 今日热点 -->
  <h3>今日热点</h3>
  <ul class="hottip">
    <li v-for="item of hottips" :key="item.i">
      <div>
        <img :src="item.img_url" alt="">
      </div>
      <div class="hot_content">
        <h4>{{item.title}}</h4>
        <h5>{{item.sub}}</h5>
        <p>{{item.shelf_time}}</p>
      </div>
    </li>
  </ul>
  <my-footer></my-footer>
  <return-top></return-top>
</div>
</template>
<script>
import myHeader from "@/components/header.vue";
import myFooter from "@/components/footer.vue";
import returnTop from "@/components/returnTop.vue";
import mySearch from "@/components/search.vue";
export default {
  data(){
    return{
      hottips:[
        {title:"最强美剧怎样炼成？",sub:'"权利的游戏"主创独家专访',shelf_time:"2019-04-12 16:47:32",img_url:"http://127.0.0.1:5050/img/hotTip/get1.jpg"},
        {title:'"失控"的港姐',sub:'曾经港片半边天如今被吐槽',shelf_time:"2019-04-11 16:48:56",img_url:"http://127.0.0.1:5050/img/hotTip/get2.jpg"},
        {title:"贾樟柯娄烨王小帅30年",sub:'从边缘到主流的第六代导演',shelf_time:"2019-04-10 17:24:01",img_url:"http://127.0.0.1:5050/img/hotTip/get3.jpg"}
      ],
      showlist:[
        {title:"复仇者联盟4:终局之战",score:"8.4",img_url:"http://127.0.0.1:5050/img/show/show1.jpg",href:"/movie?mid=1"},
        {title:"何以为家",score:"8.2",img_url:"http://127.0.0.1:5050/img/show/show2.jpg",href:"/movie?mid=2"},
        {title:"大侦探皮卡丘",score:"",img_url:"http://127.0.0.1:5050/img/show/show3.jpg",href:"/movie?mid=3"},
        {title:"撞死了一只羊",score:"7.4",img_url:"http://127.0.0.1:5050/img/show/show4.jpg",href:"/movie?mid=4"},
        {title:"下一任:前任",score:"5.5",img_url:"http://127.0.0.1:5050/img/show/show5.jpg",href:"/movie?mid=5"},
        {title:"雪暴",score:"6.4",img_url:"http://127.0.0.1:5050/img/show/show6.jpg",href:"/movie?mid=6"},
        {title:"调音师",score:"7.7",img_url:"http://127.0.0.1:5050/img/show/show7.jpg",href:"/movie?mid=7"},
        {title:"一个母亲的复仇",score:"7.0",img_url:"http://127.0.0.1:5050/img/show/show8.jpg",href:"/movie?mid=8"}
      ]
    }
  },
  components:{
    myHeader,myFooter,returnTop,mySearch
  }
}
</script>
<style scoped>
.app-home ul.show{
  list-style: none;
  padding-left:0;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  padding:0 10px;
}
.app-home .show li{
  width:25%;
  padding:0 3px;
}
.app-home .show li .pic{
  position: relative;
}
.app-home .show li .pic img{
  width:100%;
}
.app-home .show li .pic p{
  position:absolute;
  width:18px;
  height: 17px;
  top:3px;
  right:4px;
  background-color:#659d0e;
  font-size:13px;
  color:#fff;
  line-height: 17px;
}
.app-home .show li h5{
  color:#333;
  font-size:18px;
  height:40px;
  line-height: 20px;
  overflow: hidden;
  margin-top: 0;
}
.app-home .ad{
  border-top:1px solid #ddd;
  padding-top:10px;
}
.app-home .ad img{
  width:100%;
}
.app-home h2{
  font-size:22px;
  text-align: left;
  padding:10px;
  padding-left: 20px;
  border-top:1px solid #ddd;
}
.app-home h2 a{
  color:#2c3e50; 
}
.app-home h2 a span.t{
  margin-left: 170px;
  color:#cdcdcd;
}
.app-home h3{
  font-size:22px;
  text-align: left;
  padding-left: 20px;
  margin-top:10px;
}
.app-home ul.hottip{
  list-style: none;
  padding-left: 0;
  margin-top:0;
}
.app-home ul.hottip li{
  display:flex;
  justify-content: space-between;
  padding:10px 20px;
  border-bottom: 1px solid #ddd;

}
.app-home ul.hottip li img{
  width:140px;
}
.app-home ul.hottip li .hot_content{
  display:flex;
  flex-direction: column;
  justify-content: center;
  align-items: baseline;
}

</style>