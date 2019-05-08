<template>
<div class="app-search">
  <div class="search">
    <input type="text" placeholder="影片/影院/影人，任你搜">
  </div>
</div>
</template>
<script>
export default {
  data(){
    return{}
  }
}
</script>
<style>
.app-search .search{
  width:85%;
  margin:10px auto 0;
}
.app-search .search input{
  width:85%;
  background:url(http://127.0.0.1:5050/icon/search_ico_01.png) no-repeat 10px center;
  background-size:25px 25px;
  padding-left: 45px;
  border-radius:8px;
  margin-bottom:5px;
}
</style>
