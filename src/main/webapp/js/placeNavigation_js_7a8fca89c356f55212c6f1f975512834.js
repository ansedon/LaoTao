$(document).ready(function(){function t(t){this._options=$.extend({$dom:$("#poiNavSearchBox"),$container:$("#poiNavSearchContainer"),$tab:$("#poiNavSearchBg"),$li:$("#poiNavSearchMenu"),$poiNavBox:$("#poiNavBox"),$poiNavForm:$("#poiNavSearchForm"),$main:$(".placeNav"),top:"0px",scrollFix:!0,zIndex:22,placeholder:"搜索国家/城市/目的地"},t||{}),this.init()}t.prototype={mainData:{},init:function(t){this.bindEvent(),this._options.$dom.attr("placeholder",this._options.placeholder)},bindEvent:function(){var t=this,n=null,o=t._options,i=null;o.$dom.on({"input propertychange":function(a){return""==$.trim(t._options.$dom.val())?(t.hidePanel(),!1):t.mainData[$.trim(o.$dom.val())]?(o.$container.html("").addClass("loading"),t.useData.call(t,t.mainData[$.trim(o.$dom.val())]),n&&clearTimeout(n),t.setFormAction.call(t,""),t.showPanel(),o.$li.addClass("_menuOn"),o.$dom.addClass("_search"),!1):(i&&clearTimeout(i),void(i=setTimeout(function(){return!t.mainData[$.trim(o.$dom.val())]&&(o.$container.html("").addClass("loading"),""==$.trim(t._options.$dom.val())?(t.hidePanel(),!1):(t.inputFunction.call(t,a),n&&clearTimeout(n),t.setFormAction.call(t,""),t.showPanel(),o.$li.addClass("_menuOn"),void o.$dom.addClass("_search")))},500)))},blur:function(){o.$container.removeClass("loading"),o.$dom.removeClass("_search"),o.$li.hasClass("_menuOn")||t.hidePanel()},focus:function(){""!=$.trim(t._options.$dom.val())&&(t.showPanel(),o.$li.addClass("_menuOn"),o.$dom.addClass("_search"))}}),o.$li.on("mouseleave",function(i){n=setTimeout(function(){o.$li.removeClass("_menuOn"),o.$dom.hasClass("_search")||t.hidePanel()},200)}),o.$li.on("mouseenter",function(t){n&&clearTimeout(n)}),o.$container.on("mouseenter",".multipleListItem",function(t){o.$container.find("li.openItem").removeClass("openItem"),$(this).addClass("openItem")}),o.$poiNavForm.on("submit",function(n){var o=$(this),i=t._options.$container.find(".multipleListItem"),a=t._options.$container.find(".openItem").index()-0;return 0!=i.length&&(t.setFormAction.call(t,i.eq(a==-1?0:a).find("a").attr("href")),""==o.attr("action")?(n.preventDefault(),!1):void 0)}),o.$dom.keydown(function(t){"38"!=t.keyCode&&"40"!=t.keyCode||t.preventDefault()}).keyup(function(n){var o=n.keyCode,i=$.trim($(this).val());if(""!=i){var a=t._options.$container.find(".multipleListItem"),e=t._options.$container.find(".openItem"),s=e.index()-0;38==o?a.removeClass("openItem").eq(s==-1?0:s?--s:a.length-1).addClass("openItem"):40==o&&a.removeClass("openItem").eq(s==-1?a.length-1:s==a.length-1?0:++s).addClass("openItem")}}),o.scrollFix&&t.scrollFix(),o.$main.on("click",".navComment",function(t){var n=$(this),o=n.find("a"),i=o.attr("data-id"),a=o.attr("data-type")||"city";requirejs(["common/component/footprint/js/comment"],function(t){var n={};"city"==a?(n.city_id=i,n.country_id&&delete n.country_id):(n.country_id=i,n.city_id&&delete n.city_id),t.commShow(n)})})},inputFunction:function(t){var n=this;n._options.$container.addClass("loading"),n.getDataFunction.call(n,{data:{keyword:$.trim(n._options.$dom.val())}})},getDataFunction:function(t){var n=this,o=(n._options.$dom,$.extend({url:"http://place.qyer.com/country.php?action=placesearch",onSuccess:function(t){n.mainData[t.data.keyword]=t,n.useData.call(n,t)},onError:function(t){n._options.$container.removeClass("loading").html('<li class="tip">没有找到匹配的目的地</li>'),require(["common/ui/tip/tip"],function(n){n.tip({type:"error",text:t.data.msg})})}},t));qyerUtil.doAjax(o)},useData:function(t){var n=this,o=n._options.$dom,i=$.trim(o.val());if(n._options.$container.removeClass("loading"),t.data.keyword==i){if(n._options.$container.html(""),0==t.data.list.length)n._options.$container.html('<li class="tip">没有找到匹配的目的地</li>');else{var a="";$.each(t.data.list,function(o,i){if(0==o?(n.setFormAction.call(n,i.link),a+='<li class="multipleListItem openItem"><div class="itemBox">'):a+='<li class="multipleListItem"><div class="itemBox">',a+='<h4 class="title"><a href="'+i.link+'" target="_blank" data-bn-ipg="place-'+PLACE.TYPE+"-nav-search-"+(o-0+1)+'" class="left">',i.cn&&(a+='<span class="cn fontYaHei">',a+=i.cn.replace(t.data.keyword,function(t){return'<em class="green">'+t+"</em>"}),a+="</span>"),i.en&&(a+='<span class="en fontYaHei">',a+=i.en.replace(t.data.keyword,function(t){return'<em class="green">'+t+"</em>"}),a+="</span>"),a+="</a>",i.tag&&(a+='<span class="right">'+i.tag+"</span>"),a+="</h4>",0!=i.category.length){var e={sight:"玩乐",hotel:"酒店",food:"美食",travel:"游记"},s={sight:"citytour",hotel:"cityhotel",food:"cityfood",travel:"citytravelnote"};a+='<div class="icons">',$.each(i.category,function(t,n){a+="<span class="+(t>=3?"lastBox":"box1")+'><a href="'+n.value+'" target="_blank" data-bn-ipg="place-'+PLACE.TYPE+"-nav-search-"+s[n.name]+'" class="icon '+n.name+'">'+e[n.name]+"</a></span>"}),a+="</div>"}a+="</div></li>"})}n._options.$container.html(a)}},showPanel:function(t){var n=this;n._options.$container.show(),n._options.$tab.show(),$(n).trigger("showPanelEvent")},hidePanel:function(t){var n=this;n._options.$container.hide(),n._options.$tab.hide(),$(n).trigger("hidePanelEvent")},scrollFix:function(t){var n=this;$(window).on("scroll",function(){$(window).scrollTop()>=40?n._options.$poiNavBox.css({top:n._options.top,"z-index":n._options.zIndex,position:"fixed"}):n._options.$poiNavBox.css({top:0,position:"relative"})})},setFormAction:function(t){var n=this;n._options.$poiNavForm.attr("action",t)}};new t});