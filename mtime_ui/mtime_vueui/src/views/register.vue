<template>
  <div class="app-register">
    <my-reheader></my-reheader>
    <!-- 条款提示框 -->
    <div class="pol_box" v-show="isagree">
      <div class="pol_content">
        <h3>Mtime服务条款与隐私保护概览</h3>
        <p>
          感谢您对时光网产品/服务的信任，您已经进入时光网用户的注册流程，当您完成所有注册程序后，您即可以享受我们专门为注册用户提供的产品/服务内容，<b>在此使用过程中，可能会对您应履行的义务有所要求或对您的权利有所限制。因此，为了更好地保障您的个人权益，请务必审慎阅读《Mtime时光网服务条款》与《隐私政策》内的所有条款，并在您同意以上协议全部内容后点击“同意”并进入下一步注册流程。</b>如果您不同意以上协议（包括不同意协议的任一内容），请您停止注册，您停止注册的行为不影响您可以使用/继续使用我们提供的部分产品/服务，但您将无法享受我们专门为我们的注册用户提供的完整的产品/服务。<b>您点击“同意”的行为即表示您已阅读完毕并同意以上协议的全部内容，包括您同意我们对您的个人信息的收集/保存/使用/对外提供/保护等规则条款，以及您的用户权利等条款；约定我们的限制责任、免责条款；其他以颜色或加粗进行标识的重要条款；以及协议内的其他所有条款。</b>如您对以上协议有任何疑问，可通过客服电话4006-118-118与我们联系。
        </p>
        <div class="policy">
          我已阅读并同意<a href="javascript:;">Mtime服务条款</a>和<a href="javascript:;">隐私政策</a>
        </div>
        <div class="btn_isagree">
          <span class="disagree" @click="disagree">不同意</span>
          <span class="agree" @click="agree">同意并继续</span>
        </div>
      </div>
    </div>
    <!-- 注册页面 -->
    <form >
      <div>手机号：
        <input type="text" name="phone" placeholder="请输入手机号" v-model="phone" @blur="phoneBlur">
        <span class="getnum" @click="getNumber">获取验证码</span>
      </div>
      <div>验证码：
        <input type="text" name="number" v-model="number" >
      </div>
      <div>密&nbsp;&nbsp;&nbsp;&nbsp;码：
        <input type="password" name="upwd" placeholder="6-16位字母或数字 _ 组成" v-model="upwd" @blur="upwdBlur">
      </div>
      <p class="policy">
        <span class="i_suc"></span>
        我已阅读并同意
        <a href="javascript:;">《Mtime时光网服务条款》</a>
        <a href="javascript:;">《隐私政策》</a>
      </p>
      <input type="button" value="注册" class="btn_reg" @click="reg">
    </form>
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
      isagree:true,
      phone:"",
      number:"",
      upwd:""
    }
  },
  methods:{
    agree(){
      this.isagree=false;
    },
    disagree(){
      this.$router.push("/");
    },
    phoneBlur(){
      var phoneReg=/^1[3-9]\d{9}$/;
      if(!phoneReg.test(this.phone)){
        Toast("请输入正确的手机号");
        this.phone="";
      }else{
        var url="http://127.0.0.1:5050/user/phoneCheck?phone="+this.phone;
        this.axios.get(url).then(res=>{
          if(res.data.code==1){
            Toast(res.data.msg);
          }else{
            Toast(res.data.msg);
            this.phone="";
          }
        })
      }
    },
    getNumber(){
      this.number=parseInt(Math.random()*999999);
    },
    upwdBlur(){
      var upwdReg=/^\w{6,16}$/;
      if(!upwdReg.test(this.upwd)){
        Toast("请输入正确格式的密码");
        this.upwd="";
      }
    },
    reg(){
      var url="http://127.0.0.1:5050/user/register";
      var postData=this.$qs.stringify({
        phone:this.phone,
        upwd:this.upwd
      });
      this.axios({
        method:"post",
        url,
        data:postData
      }).then(res=>{
        if(res.data.code==1){
          Toast(res.data.msg);
          this.$router.push("/");
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
.app-register form div{
  width:95%;
  border-bottom: 1px solid #ddd;
  margin-bottom: 15px;
}
.app-register form input.btn_reg{
  width:95%;
  height: 48px;
  border:0;
  border-radius:48px;
  background-color: #1e7dd7;
  color:#fff;
  font-size:22px;
  margin-top:20px;
}
.app-register form p span.i_suc{
  display: inline-block;
  width:22px;
  height:22px;
  background:url(http://127.0.0.1:5050/icon/i_suss.png) no-repeat center;
  background-size:100%;
  margin-bottom: -5px;
}
.app-register form p.policy a{
  color:#1e7dd7;
}
.app-register form p.policy{
  font-size: 18px;
  line-height: 24px;
}
.app-register .getnum{
  position:absolute;
  top:50px;
  right: 15px;
  border:1px solid #1e7dd7;
  width:115px;
  height: 36px;
  border-radius: 36px;
  color:#1e7dd7;
  text-align: center;
  line-height: 36px;
}
.app-register input{
  width:70%;
  border:0;
  margin-bottom: 5px;
}
.app-register form{
  padding-top:50px;
  padding-bottom: 100px;
  font-size:18px;
  text-align: left;
  padding-left: 20px;
  position: relative;
}
.app-register .agree,.app-register .policy a{
  color:#fa923f;
}
.app-register .btn_isagree{
  display: flex;
  justify-content: space-around; 
}
.app-register .btn_isagree span{
  margin-top:18px;
}
.app-register .policy{
  font-size:14px;
  margin:-2px;
  margin-top:2px;
}
.app-register .pol_content h3{
  font-size:18px;
}
.app-register .pol_content p{
  color:#2c3e50;
  width:100%;
  height:336px;
  overflow-y: auto;
  margin:0;
}
.app-register .pol_content{
  width:280px;
  height: 450px;
  position:absolute;
  top:50%;
  left:50%;
  margin-left:-140px;
  margin-top:-255px;
  background-color:#fff;
  border-radius: 10px;
  padding:10px;
}
.app-register .pol_box{
  width:100%;
  height:728px;
  background-color:rgba(0,0,0,0.6);
  position: absolute;
  top:0;
  left: 0;
  z-index: 100;
}
</style>