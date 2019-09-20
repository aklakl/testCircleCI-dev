



 //==========================================================utils===========================================================
Date.prototype.format = function(fmt) { 
     var o = { 
        "M+" : this.getMonth()+1,                  
        "d+" : this.getDate(),                     
        "h+" : this.getHours(),                    
        "m+" : this.getMinutes(),                  
        "s+" : this.getSeconds(),                 
        "q+" : Math.floor((this.getMonth()+3)/3),  
        "S"  : this.getMilliseconds()             
    }; 
    if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
    }
     for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
         }
     }
    return fmt; 
}
String.prototype.nthIndexOf = function(searchElement, n, fromElement) {
    n = n || 0;
    fromElement = fromElement || 0;
    while (n > 0) {
        fromElement = this.indexOf(searchElement, fromElement);
        if (fromElement < 0) {
            return -1;
        }
        --n;
        ++fromElement;
    }
    return fromElement - 1;
};

//==========================================================utils===========================================================

const net = require('net');
const request = require("request");




var delay = 1*1000;
var currentIter = 0;
var maxIter = 999999999;
let maxExeCounts = 3;
var task = function() {
    return new Promise(function(resolve, reject) {
        setTimeout(function(){
            taskForReq();
            console.log('task', currentIter );
            resolve();          
        }, 100);
    });
}

var run = function() {
    task().then(function(){
        setTimeout(function(){
            ++currentIter;
            if (currentIter == maxIter) currentIter =1;
            //console.log("currentIter="+currentIter);
            if (currentIter < maxIter)
                run();
        }, delay)
    });
}

//========================================taskForReq==========================================================
function taskForReq(){
	for (let i =1;i<maxExeCounts;i++){
		let requestUrl = "https://www.google.com";
		//console.log("requestUrl="+requestUrl);
		request(requestUrl, { json: true }, (err, res, body) => {
		  if (err) { return console.log(err); }
		  //console.log("success|requestUrl="+requestUrl +"|err="+err+"|res="+res);//+"|body="+JSON.stringify(body)
		  //console.log(body);
		});
	}
}

run();
