<template>
  <div class="app-shop">
    <my-header></my-header>
    <my-search></my-search>
    <!-- 轮播图 -->
    <mt-swipe :auto="4000">
      <mt-swipe-item v-for="item of banners" :key="item">
        <img :src="'http://127.0.0.1:5050/img/shop/'+item" alt="">
      </mt-swipe-item>
    </mt-swipe>
    <!-- 导航栏 -->
    <ul class="navs">
      <li v-for="item of navList" :key="item.i">
        <router-link :to="item.target">
          <img :src="'http://127.0.0.1:5050/img/shop/'+item.pic" alt="">
          <div>{{item.name}}</div>
        </router-link>
      </li>
    </ul> 
    <!-- 静态广告 -->
    <div class="pro_ad">
      <div class="pro_ad_f1">
        <div class="pro_ad_f1_l">
          <router-link to="/ad">
            <img src="http://127.0.0.1:5050/img/shop/product1.jpg" alt="">
          </router-link>
        </div>
        <div class="pro_ad_f1_r">
          <router-link to="/ad">
            <img src="http://127.0.0.1:5050/img/shop/product2.jpg" alt="">
          </router-link>
          <router-link to="/ad">
            <img src="http://127.0.0.1:5050/img/shop/product3.jpg" alt="">
          </router-link>
        </div>
      </div>
      <div class="pro_ad_f2">
        <router-link to="/ad">
          <img src="http://127.0.0.1:5050/img/shop/product4.jpg" alt="">
        </router-link>
      </div>
    </div>
    <!-- 动态商品展示栏 -->
    <div class="pro_act">
      <!-- 背景 -->
      <div class="pro_act_bg" :style="'backgroundImage:url('+bgUrl+')'">
      <!-- 系列选项卡 -->
        <ul class="pro_navs">
          <li v-for="item of family_list" :key="item.i" @click="changefm(item.family_id)">
            <img :src="'http://127.0.0.1:5050/img/shop/'+item.logo" alt="">
          </li>
        </ul>
      </div>
      <!-- 标题 -->
      <div class="pro_title">
        <h5>{{en_title}}</h5>
        <h4>{{title}}</h4>
      </div>
      <!-- 商品列表 -->
      <ul class="pro_list">
        <li v-for="item of products_list" :key="item.i">
          <router-link to="/">
            <img :src="'http://127.0.0.1:5050/img/shop/'+item.img" alt="">
            <h5>{{item.pname}}</h5>
            <p>¥<span>{{item.price}}</span></p>
          </router-link>
        </li>
      </ul>
      <!-- 更多商品 -->
      <div class="pro_more">
        <router-link to="/">更多商品 ></router-link> 
      </div>
    </div>
    <!-- 商品分类展示 -->
    <!-- 玩具模型 -->
    <div class="pro_cart" v-for="item of carts" :key="item.i">
      <div class="cart_title">
        <h2 :style="'color:'+item.t_color"><span :style="'background-color:'+item.t_color">&nbsp;</span>{{item.fm_title}}</h2>
        <h4>
          <router-link to="/">更多 ></router-link>
        </h4>
      </div>
      <img :src="'http://127.0.0.1:5050/img/shop/'+item.f1_img" alt="" class="cart_img">
      <ul class="pro_list">
        <li v-for="item of item.p_list" :key="item.i">
          <router-link to="/">
            <img :src="'http://127.0.0.1:5050/img/shop/'+item.img" alt="">
            <h5>{{item.pname}}</h5>
            <p>¥<span>{{item.price}}</span></p>
          </router-link>
        </li>
      </ul>
    </div>
    <!-- 数码配件 -->
    <!-- 服饰配件 -->
    <!-- 家居生活 -->
    <!-- 你可能感兴趣的 -->
    <div class="recommend_t">
      <span>◆ 你可能感兴趣的</span>  
    </div>
    <ul class="recommend">
      <li v-for="item of recommendlist" :key="item.i">
        <router-link to="/">
          <img :src="'http://127.0.0.1:5050/img/shop/'+item.img" alt="">
          <h5>{{item.pname}}</h5>
          <p>¥<span>{{item.price}}</span></p>
        </router-link>
      </li>
    </ul>
    <mt-button @click="loadMore" v-if="hasmore">更多推荐</mt-button>
    <p v-else>没有更多了。。。</p>
    <my-footer></my-footer>
    <return-top></return-top>
  </div>
</template>
<script>
import myHeader from "@/components/header.vue";
import myFooter from "@/components/footer.vue";
import returnTop from "@/components/returnTop.vue";
import mySearch  from "@/components/search.vue";

export default {
  data(){
    return{
      banners:["banner1.jpg","banner2.jpg","banner3.jpg","banner4.jpg"],
      navList:[
        {name:"模玩",pic:"nav1.jpg",target:"/"},
        {name:"数码",pic:"nav2.jpg",target:"/"},
        {name:"服饰",pic:"nav3.jpg",target:"/"},
        {name:"家居",pic:"nav4.jpg",target:"/"},
        {name:"星战",pic:"nav5.jpg",target:"/"},
        {name:"漫威",pic:"nav6.jpg",target:"/"},
        {name:"蝙超",pic:"nav7.jpg",target:"/"},
        {name:"全部",pic:"nav8.jpg",target:"/"}
      ],
      family_id:1,
      family_list:[],
      products_list:[],
      title:"星球大战",
      en_title:"Star Wars",
      bgUrl:"",
      carts:[
        {family_id:6,fm_title:"玩具模型",t_color:"#FFB90F",f1_img:"cart0_0.jpg",p_list:[]},
        {family_id:7,fm_title:"数码配件",t_color:"#e16364",f1_img:"cart1_0.jpg",p_list:[]},
        {family_id:8,fm_title:"服饰配件",t_color:"#25ACBD",f1_img:"cart2_0.jpg",p_list:[]},
        {family_id:9,fm_title:"家居生活",t_color:"#00e1ad",f1_img:"cart3_0.jpg",p_list:[]}
      ],
      recommendlist:[],
      pno:0,
      pageSize:8,
      hasmore:true
    }
  },
  methods:{
    getfamily(){
      var url="http://127.0.0.1:5050/film/getfamily?family_id="+this.family_id;
      this.axios.get(url).then(res=>{
        var reslist=res.data.data;
        this.family_list=reslist;
        this.title=reslist[this.family_id-1].title;
        this.en_title=reslist[this.family_id-1].en_title;
        this.bgUrl="http://127.0.0.1:5050/img/shop/"+reslist[this.family_id-1].bg;
      });
    },
    getproducts(){
      var url="http://127.0.0.1:5050/film/getproducts?family_id="+this.family_id;
      this.axios.get(url).then(res=>{
        this.products_list=res.data.data;
      })
    },
    changefm(id){
      this.family_id=id;
      this.getfamily();
      this.getproducts();
    },
    getcarts(id){
      var url="http://127.0.0.1:5050/film/getproducts?family_id="+id;
      this.axios.get(url).then(res=>{
        this.carts[id-6].p_list=res.data.data;
      })
    },
    loadMore(){
      this.pno++;
      var url="http://127.0.0.1:5050/film/recommend?pno="+this.pno;
      this.axios.get(url).then(res=>{
        this.recommendlist=this.recommendlist.concat(res.data.data);
        if(res.data.data.length<8){
          this.hasmore=false;
        }
      })
    }
  },
  created(){
    this.getfamily();
    this.getproducts();
    for(var item of this.carts){
      this.getcarts(item.family_id);
    }
    this.loadMore();
  },
  components:{
    myHeader,myFooter,returnTop,mySearch
  }
}
</script>
<style scoped>
.app-shop ul.recommend{
  list-style: none;
  padding-left: 0;
  display: flex;
  flex-wrap: wrap;
}
.app-shop ul.recommend li{
  width:50%;
}
.app-shop ul.recommend li img{
  width:90%;
}
.app-shop ul.recommend li p{
  color:#f15353;
}
.app-shop ul.recommend li p span{
  font-size:22px;
  font-weight:bold;
}
.app-shop ul.recommend li h5{
  color:#2c3e50;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  padding-left:10px;
  padding-right: 10px;
}
.app-shop .recommend_t{
  height:55px;
  background-color:#f6f6f6;
  position: relative;
}
.app-shop .recommend_t::after{
  content: "";
  display: block;
  width:60%;
  height:1px;
  background-color: #dcdcdc;
  overflow: hidden;
  position:absolute;
  left:20%;
  top:50%;
  z-index: 0;
}
.app-shop .recommend_t span{
  font-size:14px;
  color:#999;
  margin-top:13px;
  padding:5px;
  background-color:#f6f6f6;
  position: relative;
  display: inline-block;
  z-index: 1;
}
.app-shop .cart_title{
  display: flex;
  justify-content: space-between;
}
.app-shop .cart_title h2{
  font-size:18px;
}
.app-shop .cart_title h2 span{
  margin-right: 5px;
}
.app-shop .cart_title h4 a{
  font-size:16px;
  color:#333;
  font-weight: normal;
  margin-right: 20px;
}
.app-shop .pro_cart{
  border-bottom: 1px solid #ddd;
  margin-top:20px;
}
.app-shop .cart_img{
  width:90%;
  border-bottom: 1px solid #ddd;
}
.app-shop .pro_more{
  border-bottom:1px solid #ddd;
}
.app-shop .pro_more a{
  display: block;
  margin:0 auto;
  width: 120px;
  height:35px;
  line-height: 35px;
  background-color:#f15353;
  color:#fff;
  font-size:16px;
  border-radius:35px;
  margin-bottom: 20px;
}
.app-shop ul.pro_list li p{
  color:#f15353;
}
.app-shop ul.pro_list li p span{
  font-size:20px;
  font-weight:bold;
}
.app-shop ul.pro_list li h5{
  color:#2c3e50;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  padding-left:10px;
  padding-right: 10px;
}
.app-shop ul.pro_list li img{
  width:80%;
}
.app-shop ul.pro_list li{
  width:33.33333%;
}
.app-shop ul.pro_list{
  list-style: none;
  padding-left: 0;
  display:flex;
  flex-wrap: wrap;
}
.app-shop .pro_title{
  margin-top:-5px;
}
.app-shop .pro_title h4{
  font-size:22px;
  margin:0;
}
.app-shop .pro_title h5{
  font-size:16px;
  color:#2c3e50;
  margin:0;
}
.app-shop ul.pro_navs{
  list-style: none;
  width:125%;
  display: flex;
  padding-left: 0;
  margin:0;
  margin-top:85px;
}
.app-shop ul.pro_navs li{
  width:25%;
  margin:8px;
}
.app-shop ul.pro_navs li img{
  width:100%;
  border-radius: 50%;
  box-shadow: -5px -5px 8px 2px #ccc inset;
}
.app-shop .pro_act_bg{
  background-repeat: no-repeat;
  background-position: center;
  background-size:100%;
  overflow-x: auto;
}
.app-shop .pro_act_bg::-webkit-scrollbar{
  display: none;
}
.app-shop .pro_ad_f2{
  border-bottom:1px solid #ddd;
}
.app-shop .pro_ad_f1{
  display:flex;
}
.app-shop .pro_ad_f1_l{
  border-right:1px solid #ddd;
  border-bottom:1px solid #ddd;
}
.app-shop .pro_ad_f1_r a{
  border-bottom:1px solid #ddd;
}
.app-shop .pro_ad_f1_l,.app-shop .pro_ad_f1_r{
  width:50%;
}
.app-shop .pro_ad img{
  width:100%;
}
.app-shop ul.navs{
  list-style: none;
  padding-left: 0;
  display:flex;
  flex-wrap: wrap;
}
.app-shop ul.navs li div{
  color:#2c3e50;
  font-size:15px;
}
.app-shop ul.navs li{
  width:25%;
  padding:10px;
}
.app-shop ul.navs li img{
  width:65%;
}
.app-shop .mint-swipe{
  margin-top:5px;
  height:200px;
}
.app-shop .mint-swipe img{
  width:100%;
}
</style>