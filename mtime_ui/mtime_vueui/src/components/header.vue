<template>
<div class="app-header"> 
  <mt-header fixed></mt-header>
  <div class="navbar">
    <ul>
      <li @click="istrue=index" v-for="(item,index) of list" :key="index">
        <router-link :to="item.path" :class="{active:istrue===index}">{{item.title}}</router-link>
      </li> 
      <li>
        <router-link to="/login">
          <img src="http://127.0.0.1:5050/icon/ico_my.png" alt="">
        </router-link>
      </li>
    </ul>
  </div>
</div>
</template>
<script>
export default {
  data(){
    return{
      istrue:0,
      list:[
        {path:"/home",title:"首页"},
        {path:"/film",title:"购票"},
        {path:"/shop",title:"商城"}
      ]
    }
  },
  methods:{
  
  }
  
}
</script>
<style scoped>
.app-header{
  padding-top:80px;
  overflow-x:hidden;
  position: relative;
  z-index: 100;
}
.app-header::after{
  content: "";
  display: block;
  clear: both;
}
.app-header .mint-header{
  background:#1c2635 url(http://127.0.0.1:5050/icon/logo_mtime.png) no-repeat center center;
  background-size:auto 32px;
}
.app-header .navbar{
  width:100%;
  background-color:#1c2635;
  height:40px;
  position:fixed;
  top:40px;
}
.app-header .navbar ul{
  list-style: none;
  display:flex;
  justify-content: space-between;
  margin:0;
  padding:10px;
  padding-left: 50px;
  padding-right:25px; 
  background:url(http://127.0.0.1:5050/icon/share07.png) no-repeat 5px 3px;
  background-size:32px;
}
.app-header .navbar img{
  width:65%;
}
.app-header .navbar a{
  color:#bbb;
}
.app-header .navbar a.active{
  color:#fff;
  font-weight: bold;
}
</style>
