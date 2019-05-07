

/*var v1=[];
var v2={};
var v3={};
function foo(v1,v2,v3){
	v1=[1];
	v2=[2];
	v3={a:3};
}
foo(v1,v2,v3);
console.log(v1);
console.log(v2);
console.log(v3);
*/


/*
function fn(){return 20;}
console.log(fn);
fn.toString=function(){return 30;}
console.log(fn);
console.log(fn+10);
console.log(fn());
*/
/*
var score=new Object();
score.chinese=89;
score.english=98;
score.history=78;
score.math=88;
var sum=0;
score.getSum=function(){
	for(var key in this ){
		sum+=this[key];
	}
    return sum;

};
Object.defineProperty(score,"getSum",{
	enumerable:false
})

console.log(score.getSum());*/

/*for(var i=0;i<10;i++){
	setTimeout(function(){
		console.log(i);
	});
}*/



/*var arr=[23,55,1,21,8];
//arr.sort(function(a,b){return a-b});
arr.sort((a,b)=>a-b);
console.log(arr);*/

/*var str="helloworld";
var arr=str.split("");
arr.reverse();
str=arr.join("");
console.log(str);*/



//判断数组中两位数之和是否为其中之一的数字
/*var arr=[1,3,5,7,8,9];
function check(arr){
	for(var i=0;i<arr.length-2;i++){
		for(var j=i+1;j<arr.length-1;j++){
			for(var n=j+1;n<arr.length;n++){
				if(arr[n]==arr[i]+arr[j]){
					return true;
				}
			}
		}
	}
	return false;
}
*/


/*arr=[1,2,3,4,5];
//arr.splice(2,1,10);
//arr.splice(2,0,10);
//arr.splice(2);
console.log(arr.splice(2));*/

/*
var name="xiao ming";
var object={
	name:"xiao ming",
	getNameFunc:function(){
		return function(){ return this.name;}
	}
};
alert(object.getNameFunc()());
*/
/*
var param=1;
function main(){
	console.log(param);
	var param=2;
	console.log(this.param);
	this.param=3;
}
main();//undefined 1
var m=new main();//undefined undefined
*/

/*
//写一个function实现对一个对象数组按任意属性排序，如对数组[{id:0,name:java},{id:1,name:'json'}]分别按id和name排序
function mySort(arr,attr){
	return arr.sort(function(a,b){
		return a[attr]-b[attr];
	});
}
var arr=[
	{id:3,name:"d"},
	{id:0,name:"a"},
	{id:1,name:"b"},
	{id:2,name:"c"}
];
*/

/*
function Foo(){
	getName=function(){
		console.log(1);
	}
	return this;
}
Foo.getName=function(){
	console.log(2);
}
Foo.prototype.getName=function(){
	console.log('baidu'&&'google');
}
var getName=function(){
	console.log(4);
}
function getName(){
	console.log(5);
}
//请写出以下输出结果
Foo.getName();//2
getName();//4
Foo().getName();//1
getName();//1
new Foo.getName();//2
new Foo().getName();//google
new new Foo().getName();//google
*/

//计算当前字符串内各个字符出现的次数
var str="helloworld";
var arr=str.split("");
console.log(arr);
var result=arr.reduce((prev,elem)=>{
	if(prev[elem]===undefined){
		prev[elem]=1;
	}else{
		prev[elem]+=1;
	}
	return prev;
},{});
console.log(result);
/*{d: 1
e: 1
h: 1
l: 3
o: 2
r: 1
w: 1}*/