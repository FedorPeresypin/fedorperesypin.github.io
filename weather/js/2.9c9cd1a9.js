(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([[2],{"0565":function(t,e,a){"use strict";a("cbf9")},"8b24":function(t,e,a){"use strict";a.r(e);var s=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("q-page",{staticClass:"flex column"},[a("header",[a("h1",[t._v("Прогноз погоды")]),a("h2",[t._v("Тренировочное приложение")])]),a("div",{staticClass:"weather-app"},[a("div",{staticClass:"row"},[a("div",{staticClass:"form col-lg-3 offset-lg-1 col-md-3 offset-md-1 col-sm-10 offset-sm-1  col-12"},[a("q-select",{attrs:{filled:"",value:t.model,"use-input":"","hide-selected":"","fill-input":"","input-debounce":"0",options:t.options,label:"Название",color:"purple","label-color":"purple",hint:""+this.apiErr,"hint-color":"purple"},on:{filter:t.filterFn,"input-value":t.setModel,keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.getWeatherBySearch(e)}},scopedSlots:t._u([{key:"no-option",fn:function(){return[a("q-item",[a("q-item-section",{staticClass:"text-grey"},[t._v("\n                No results\n              ")])],1)]},proxy:!0}])}),a("q-btn",{attrs:{color:"purple",label:"Искать",icon:"search"},on:{click:t.getWeatherBySearch}})],1),t.weatherData?a("div",{staticClass:"result form col-lg-5 offset-lg-1 col-md-7 offset-md-1 col-sm-10 offset-sm-1 col-12"},[a("div",{staticClass:"result__city"},[t._v(t._s(t.weatherData.city.name))]),a("div",{staticClass:"result__day"},[a("div",{staticClass:"day-change"},[t._v("Сегодня")]),a("img",{attrs:{src:t.apiImg+"/"+t.weatherData.list[0].weather[0].icon+"@2x.png",alt:""}}),a("div",{staticClass:"descr"},[t._v(t._s(t.weatherData.list[0].weather[0].description))]),a("div",{staticClass:"temp"},[t._v(t._s(Math.round(t.weatherData.list[0].main.temp)))])]),a("div",{staticClass:"result__day"},[a("div",{staticClass:"day-change"},[t._v("Завтра")]),a("img",{attrs:{src:t.apiImg+"/"+t.weatherData.list[8].weather[0].icon+"@2x.png",alt:""}}),a("div",{staticClass:"descr"},[t._v(t._s(t.weatherData.list[8].weather[0].description))]),a("div",{staticClass:"temp"},[t._v(t._s(Math.round(t.weatherData.list[8].main.temp)))])]),a("div",{staticClass:"result__day"},[a("div",{staticClass:"day-change"},[t._v("Послезавтра")]),a("img",{attrs:{src:t.apiImg+"/"+t.weatherData.list[16].weather[0].icon+"@2x.png",alt:""}}),a("div",{staticClass:"descr"},[t._v(t._s(t.weatherData.list[16].weather[0].description))]),a("div",{staticClass:"temp"},[t._v(t._s(Math.round(t.weatherData.list[16].main.temp)))])])]):t._e()])]),a("footer",[a("h2",[t._v("Приложение прогноза погоды, автор — Пересыпин Федор")])])])},i=[],r=(a("b902"),a("c545")),c={name:"PageIndex",data(){return{weatherData:null,apiUrl:"https://api.openweathermap.org/data/2.5/forecast",apiKey:"ce77c1cc210b29be3e98700d960f9a76",apiImg:"http://openweathermap.org/img/wn",apiErr:"",model:"",options:this.cityDate,cityDate:[]}},created(){this.getListOfCity()},methods:{getWeatherBySearch(){this.apiErr="",this.$axios(`${this.apiUrl}?q=${this.model}&appid=${this.apiKey}&units=metric&lang=ru`).then((t=>{this.weatherData=t.data})).catch((t=>{404===t.response.status&&(this.apiErr="Населенный пункт не найден!"),400===t.response.status&&(this.apiErr="Напишите что-нибудь!"),r["a"].create({message:`${this.apiErr}`,color:"red"})}))},getListOfCity(){this.$axios("https://gist.githubusercontent.com/gorborukov/0722a93c35dfba96337b/raw/435b297ac6d90d13a68935e1ec7a69a225969e58/russia").then((t=>{for(let e=0;e<t.data.length;e++)this.cityDate.push(t.data[e].city)})).catch((t=>{console.log("-----error-------"),console.log(t)}))},filterFn(t,e){e((()=>{const e=t.toLocaleLowerCase();this.options=this.cityDate.filter((t=>t.toLocaleLowerCase().indexOf(e)>-1))}))},setModel(t){this.model=t}}},l=c,o=(a("0565"),a("a6c2")),n=a("505d"),d=a("f636"),h=a("e0e9"),p=a("6c44"),u=a("ef9c"),m=a("19dc"),f=a("d73d"),g=a("63c1"),v=a.n(g),_=Object(o["a"])(l,s,i,!1,null,null,null);e["default"]=_.exports;v()(_,"components",{QPage:n["a"],QSelect:d["a"],QItem:h["a"],QItemSection:p["a"],QBtn:u["a"],QIcon:m["a"],QField:f["a"]})},cbf9:function(t,e,a){}}]);