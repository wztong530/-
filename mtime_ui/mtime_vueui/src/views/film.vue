<template>
  <div class="app-film">
    <my-header></my-header>
    <my-search></my-search>
    <div class="carousel">
      <mt-swipe :auto="4000">
        <mt-swipe-item v-for="item of banners" :key="item">
          <img :src="item" alt="">
        </mt-swipe-item>
      </mt-swipe>
      <div class="car_logo">广告</div>
    </div>
    <h5 class="sp">以下影院均非时光网自营</h5>
    <ul>
      <li v-for="item of cinemaList" :key="item.i">
        <div class="cname">
          <h4>{{item.cname}}</h4>
          <h5>{{item.caddress}}</h5>
        </div>
        <div class="sprice">{{item.sp}}<span>元起</span></div>
      </li>
    </ul>
    <mt-button @click="loadMore" v-if="hasmore">加载更多</mt-button>
    <p v-else>没有更多了。。。</p>
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
      banners:[
        "http://127.0.0.1:5050/img/naodong750-175.jpg",
        "http://127.0.0.1:5050/img/hbt750175.jpg"
      ],
      cinemaList:[],
      pno:0,
      pageSize:8,
      hasmore:true
    }
  },
  methods:{
    loadMore(){
      this.pno++;
      var url="http://127.0.0.1:5050/film/cinemaList?pno="+this.pno;
      this.axios.get(url).then(res=>{
        this.cinemaList=this.cinemaList.concat(res.data.data);
        if(res.data.data.length<8){
          this.hasmore=false;
        }
      })
    }
  },
  created(){
    this.loadMore()
  },
  components:{
    myHeader,myFooter,returnTop,mySearch
  }
}
</script>
<style scoped>
.app-film .cname{
  text-align: justify;
  width:80%;
}
.app-film .cname h5{
  margin:10px;
  margin-left: 0;
  line-height: 20px;
}
.app-film .sprice{
  color:#ff8600;
  padding-top:8px;
  font-size: 22px;
}
.app-film .sprice span{
  font-size:12px;
}
.app-film ul{
  list-style:none;
  padding-left: 0;
  padding:0 20px;
  margin-top:0;
}
.app-film ul li{
  border-bottom:1px solid #ddd;
  display:flex;
  justify-content: space-between;
  padding:10px 0;
}
.app-film .carousel{
  position: relative;
  margin-top:5px;
}
.app-film .carousel .car_logo{
  width:36px;
  height:22px;
  position:absolute;
  border: 1px solid #fff;
  color:#fff;
  font-size:12px;
  left:5px;
  bottom:5px;
}
.app-film .mint-swipe{
  height:100px;
}
.app-film .mint-swipe img{
  height:100%;
}
.app-film .sp{
  background-color:#f6f6f6;
  padding:10px;
}
</style>