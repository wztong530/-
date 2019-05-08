import Vue from 'vue'
import App from './App.vue'
import router from './router'
import qs from 'qs'
import'mint-ui/lib/style.css'

Vue.config.productionTip = false
//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'

//按需加载mint-ui组件库中的一个组件Header
//1.按需引入Header Button
/*import {Header,Button,Swipe,SwipeItem,Lazyload} from "mint-ui";
//2.全局注册Header
//标签:Header.name="mt-header"
Vue.component(Header.name,Header);
Vue.component(Button.name,Button);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.use(Lazyload);*/
import MintUI from "mint-ui";
Vue.use(MintUI);
//3.1引入axios库
import axios from "axios";
//3.2配置跨域访问保存session中的数据
axios.defaults.withCredentials=true;
//3.3将axios配置到Vue实例属性中
Vue.prototype.axios=axios;
//将qs配置到Vue实例属性中
Vue.prototype.$qs=qs;
//4 创建日期格式过滤器
Vue.filter("datetimeFilter",function(val){
  //(1)创建新日期对象保存原有日期
  var now=new Date(val);
  //(2)创建六个变量保存年月日时分秒
  var y=now.getFullYear();
  var m=now.getMonth()+1; //0~11
  var d=now.getDate();
  var h=now.getHours();
  var mi=now.getMinutes();
  var s=now.getSeconds();
  //(3)调整月份日期格式
  m<10&&(m="0"+m);
  d<10&&(d="0"+d);
  //(4)返回拼接字符串
  return `${y}-${m}-${d} ${h}:${mi}:${s}`;
})




new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
