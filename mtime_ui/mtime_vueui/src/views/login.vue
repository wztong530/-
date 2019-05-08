<template>
<div class="app-login">
  <my-reheader></my-reheader>
  <form>
    <div>
      <span class="i_user"></span>
      <input type="text" name="phone" placeholder="手机号码" v-model="phone" @blur="phoneBlur">
      <p class="clear" @click="clear" v-show="isclear"></p>
    </div>
    <div>
      <span class="i_password"></span>
      <input :type="isshow" name="upwd" placeholder="密码" v-model="upwd">
      <p class="showpwd" @click="showpwd">显示密码</p>
    </div>
  </form>
  <input type="button" value="登录" class="btn_login" @click="login">
  <div class="reg_find">
    <h4 @click="toreg">免费注册</h4>
    <h5 @click="tofind">找回密码</h5>
  </div>
  <dl class="otherlog">
    <dt><span>使用第三方登录</span></dt>
    <dd>
      <ul>
        <li>
          <router-link to="/" >
            <div class="sina"></div>
          </router-link>
        </li>
        <li>
          <router-link to="/">
            <div class="qq"></div>
          </router-link>
        </li>
      </ul>
    </dd>
  </dl>
  <my-footer></my-footer>
</div>
</template>
<script>
import myReheader from "@/components/reheader.vue";
import myFooter from "@/components/footer.vue";
import {Toast} from "mint-ui";
export default {
  data(){
    return{
      phone:"",
      upwd:"",
      isshow:"password",
      isclear:false
    }
  },
  methods:{
    toreg(){
      this.$router.push("/register");
    },
    tofind(){
      this.$router.push("/")
    },
    showpwd(){
      if(this.isshow=="password"){
        this.isshow="text";
      }else{
        this.isshow="password";
      }
    },
    phoneBlur(){
      var isphoneReg=/^1[3-9]\d{9}$/;
      if(!isphoneReg.test(this.phone)){
        Toast("请输入正确的手机号");
      }
      if(this.phone!==""){
        this.isclear=true;
      }
    },
    clear(){
      this.phone="";
      this.isclear=false;
    },
    login(){
      var url="http://127.0.0.1:5050/user/login?phone="+this.phone+"&upwd="+this.upwd;
      this.axios.get(url).then(res=>{
        if(res.data.code==1){
          Toast(res.data.msg);
          this.$router.push("/");
        }else{
          Toast(res.data.msg);
        }
      })
    }
  },
  components:{
    myReheader,myFooter
  }
}
</script>
<style scoped>
.app-login .clear{
  width:24px;
  height: 24px;
  background:url(http://127.0.0.1:5050/icon/search_clear.png) no-repeat center;
  background-size: 80%;
  position:absolute;
  top:8px;
  right: 30px;
}
.app-login dl.otherlog{
  margin-bottom: 90px;
}
.app-login .otherlog .sina,.app-login .otherlog .qq{
  width:66px;
  height:66px;
}
.app-login .otherlog .sina{
  background: url(http://127.0.0.1:5050/icon/o_sina.png);
  background-size:100%;
}
.app-login .otherlog .qq{
  background: url(http://127.0.0.1:5050/icon/o_qq.png);
  background-size:100%;
}
.app-login .otherlog ul{
  list-style: none;
  padding-left: 0;
  display: flex;
  justify-content: space-around;
  margin-right: 45px;
}
.app-login .otherlog dt span{
  display: inline-block;
  width:120px;
  background-color: #fff;
  color:#999;
  font-size: 15px;
}
.app-login .otherlog dt{
  margin-top:-11px;
}
.app-login .otherlog{
  border-top:1px solid #ddd;
  width:80%;
  margin:0 auto;
}
.app-login .reg_find{
  display: flex;
  justify-content: space-between;
  padding:30px;
  padding-top: 20px;
}
.app-login .reg_find h4{
  color:#1e7dd7;
}
.app-login .reg_find h5{
  font-size: 18px;
}
.app-login .btn_login{
  background-color: #1e7dd7;
  border-color:#1e7dd7;
  color:#fff;
  width:90%;
  height: 50px;
  border-radius: 50px;
  margin-top:30px;
  font-size:22px;
}
.app-login .showpwd{
  position: absolute;
  font-size:16px;
  color:#1e7dd7;
  top:10px;
  right: 30px;
}
.app-login form div{
  position: relative;
}
.app-login form{
  margin-top:30px;
  border-bottom: 1px solid #ddd;
}
.app-login form input{
  width:80%;
  border:0;
}
.app-login form div:last-child input{
  margin-bottom: 0;
}
.app-login form div:first-child input{
  border-bottom: 1px solid #ddd;
}
.app-login .i_user,.app-login .i_password{
  display: inline-block;
  width:24px;
  height:28px;
  margin-bottom: -5px;
}
.app-login .i_user{
  background:url(http://127.0.0.1:5050/icon/i_user.png) no-repeat center;
  background-size:100%;
}
.app-login .i_password{
  background:url(http://127.0.0.1:5050/icon/i_password.png) no-repeat center;
  background-size:100%;
}
</style>