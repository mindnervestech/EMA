function JO2Str(O) {
	var S = [], J = "";
	if (Object.prototype.toString.apply(O) === '[object Array]') {
	for (var i = 0; i < O.length; i++) S.push(JO2Str(O[i]));
	J = '[' + S.join(',') + ']';
	}
	else if (Object.prototype.toString.apply(O) === '[object Date]')
	J = "new Date(" + O.getTime() + ")";
	else if (Object.prototype.toString.apply(O) === '[object RegExp]' || Object.prototype.toString.apply(O) === '[object Function]')
	J = O.toString();
	else if (Object.prototype.toString.apply(O) === '[object Object]') {
	for (var i in O) S.push('"'+i+'":'+(typeof(O[i])==='object'?JO2Str(O[i]):'"'+O[i]+'"'));
	J = '{'+S.join(',')+'}';
	}
	else return '"'+O+'"';
	return J;
}
function decodeHtmlEntity(str){
	  return str.replace(/&#(\d+);/g,function(match, dec){
	    return String.fromCharCode(dec);
	  });
}
function encodeHtmlEntity(str){
	  var buf =[];
	  for(var i=str.length-1;i>=0;i--){
	    buf.unshift(['&#', str[i].charCodeAt(),';'].join(''));
	  }
	  return buf.join('');
}
function urlParam(name){
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r!=null) return unescape(r[2]); return null;
}
