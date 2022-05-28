/**
 * 쿠키 조작함수 정의
 */
 
 //function(쿠키이름,쿠키값,지속시간-1000분의 1초, 저장위치) - 쿠키 생성하기
 const setCookie = function(name,value,period,path){
	let date = new Date();
	date.setDate(date.getDate() + period);
	let Cookie = `${name}=encodeURIComponent(${value});Expires=${date.toUTCString()};path=${path}`
	document.cookie = Cookie;
	
}


//쿠키 가져오기
const getCookie = function (name){
	
	let value = document.cookie.match(`(^|;) ?${name}=([^;]*)(;|$)`);
	return value ? value[2] : null;
}

//쿠키 지우기
const delCookie = function (name,path){
	let date = new Date();
	date.setDate(date.getDate() - 100);
	let Cookie = `${name}=;Expires=${date.toUTCString()};path=${path}`
	document.cookie = Cookie;
}