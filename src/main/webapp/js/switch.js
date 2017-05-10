// JavaScript Document
window.onload = function() { 
	var reg = new RegExp("(^|&)"+"tab"+"=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg);
	var tab=null;
	var inttab=0;
	if (r != null) {tab=unescape(r[2]);
	inttab=parseInt(tab,"10");}
    var oDiv = document.getElementById("qy");
    var oLi = oDiv.getElementsByTagName("ul")[0].getElementsByTagName("li");
    var aCon =oDiv.getElementsByClassName("plcHotPlaceContent");
    for (var j= 0; j < oLi.length; j++) {
		   oLi[j].className = "";
       aCon[j].style.display = "none";
   };
    oLi[inttab].className = "current";            
   aCon[inttab].style.display = "block";
     for (var i = 0; i < oLi.length; i++) {
         oLi[i].index = i;
         oLi[i].onclick = function() {
         for (var j= 0; j < oLi.length; j++) {
			   oLi[j].className = "";
              aCon[j].style.display = "none";
          };
           oLi[this.index].className = "current";            
          aCon[this.index].style.display = "block";
          };
    }
}