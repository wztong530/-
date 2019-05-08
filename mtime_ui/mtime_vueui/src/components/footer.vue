<template>
<div class="app-footer">
  <div class="tabbar">
    <ul>
      <li v-for="item of list" :key="item.i">
        <router-link :to="item.path">{{item.title}}</router-link>
      </li>  
    </ul>
  </div>
  <ul class="bottom_list">
    <li v-for="item of bottom_list" :key="item.i">{{item}}</li>
  </ul>
  <div>
    <img src="http://127.0.0.1:5050/icon/fot_logo.png" alt="">
  </div>
  <p>
    <span>Copyright </span>
    <span>2006-2019</span>
    <span> Mtime.com Inc. All rights reserved.</span>
  </p>
</div>
</template>
<script>
export default {
  data(){
    return{
      list:[
        {path:"/home",title:"首页"},
        {path:"/film",title:"购票"},
        {path:"/shop",title:"商城"},
        {path:"/login",title:"我的"}
      ],
      bottom_list:["PC版","|","客户端下载","|","意见反馈","|","帮助中心"]
    }
  }
}
</script>
<style scoped>
.app-footer .tabbar ul{
  list-style: none;
  display:flex;
  justify-content: space-around;
  padding-left:0;
}
.app-footer p{
  color:#cdcdcd;
  margin-bottom: 0;
  padding-bottom: 20px;
}
.app-footer ul.bottom_list{
  list-style: none;
  padding-left: 0;
  display: flex;
  justify-content: space-around;
  font-size:14px;
  color:#333;
  padding: 0 20px;
}
</style>