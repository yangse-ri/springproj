<%@page import="org.zerock.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
LoginVO loginVO = (LoginVO) session.getAttribute("login");
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트<decorator:title /></title>
<!-- BootStrap 라이브러리 등록 전체적으로 진행. filter가 적용이 되면 개별적으로 한것은 다 지워야 한다. -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<!-- datepicker 제이쿼리 ui라이브러리를 cdn방식으로 등록 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	
	
<style type="text/css">
header, footer {
	background: AntiqueWhite;
}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: black;
	padding: 25px;
	color: #ddd;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}

}

article {
	min-height: 400px;
	margin-top: 80px; /* 메뉴부분만큼의 마진 적용 - 데이터가 메뉴에 가리는 것은 해결 */
	margin-bottom: 100px; /* copyRight 부분의 마진 적용 - 데이터가 copyRight에 가리는 것은 해결 */
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<!-- <script type="text/javascript">

	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
		
	});
</script>


<script type="text/javascript">
	$(function(){
		
		//서버에 저장해 놓은 쿠키를 가져온다
	var msgNumberStr = getCookie("msg");
	if (msgNumberStr){
		var msgNumber = Number(msgNumberStr);
		console.log(msgNumberStr + ", type : " + typeof(msgNumberStr));
		console.log("message: " + MSG_LIST[msgNumber]);
		setTimeout(
		function(){
			alert(MSG_LIST[msgNumber]);
		},200		
		);
		delCookie("msg","/");//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
		
	};
	});	 

</script> -->
<decorator:head/>
</head>
<body>
	<header>
<!-- 		<div id="log_image"><img src="/upload/image/dog01.jpg"/></div> -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand">Project</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
					
						<li><a href="/notice/list.do">공지사항</a></li>

						<li><a href="/board/list.do">게시판</a></li>
						
						<%if(loginVO != null) { %>
							<!-- 로그인되어 있는 경우의 메뉴 -->
							
							<%} %>
						<%if(loginVO !=null && loginVO.getGradeNo() == 9) { %>
						<li><a href="/member/list.do">회원관리</a></li>
						<%} %>
					</ul>
					<!-- 메인 메뉴 부분의 로그인 사용자 정보 -->
				    <ul class="nav navbar-nav navbar-right">
				      <% if(loginVO == null){ %>
				      <!-- 로그인이 안되어 있는 경우의 메뉴 -->
				      <li><a href="/member/write.do">회원가입</a></li>
				      <li><a href="/member/login.do">Login</a></li>
				      <%} else { %>
				      <!-- 로그인이 되어 있는 경우의 메뉴 -->
				      <li><a href="/member/view.do">
				      <img src="${login.photo }" style="width: 20px" class="img-circle">
				      <%=loginVO.getName() %>(<%= loginVO.getGradeName() %>)
				    </a></li>
				    
				      <li><a href="/member/logout.do">Logout</a></li>
				      <%} %>
				    </ul>
				</div>
			</div>
			</nav>
	</header>
	<article>
		<decorator:body/>
	</article>
	
</body>

</html>