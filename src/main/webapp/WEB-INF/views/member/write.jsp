<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
$(function(){
	
	//id중복체크 변수, 비밀번호와 비밀번호 확인이 같은지 체크 변수-> 전역변수 선언
	var idCheck = false;
	var pwCheck = false;
	
	
		// datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능[달력]
		$(".datepicker").datepicker({
			changeMonth: true,
			changeYear: true,
			dateFormat: "yy-mm-dd",
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
			});
		
		   // datepicker 클래스 이벤트
		   var now = new Date();
		   var startYear = now.getFullYear();
		   var yearRange = (startYear - 120) +":" + startYear ;
		   // datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
		   //원래 있던 datepicker에 option을 추가하는 방법이다.
		   $( ".datepicker" ).datepicker("option", {
		      "maxDate" : new Date(),
		      "yearRange": yearRange
		   });
		   
		 
		   //아이디 실시간 중복체크
		   $("#id").keyup(function(){
			   var id = $("#id").val();
			  //공백문자 처리
			  id = $.trim(id);
			  $("#id").val(id);
			  //alert("입력한 아이디: " + id);
			  
			  //4자 미만일시
			  if(id.length < 4){
				  $("#idCheckDiv").removeClass("alert-success");
				  $("#idCheckDiv").addClass("alert-danger");
				  $("#idCheckDiv").text("아이디는 4자 이상 입력하셔야 합니다.");
				  return;
			  }
			  
			  //10자 초과
			  if(id.length > 10){
				  $("#idCheckDiv").removeClass("alert-success");
				  $("#idCheckDiv").addClass("alert-danger");
				  $("#idCheckDiv").text("아이디는 10자 이내로 입력하셔야 합니다.");
				  return;
			  }
			  //4-10자 사이의 아이디인 경우-중복체크 하러감-서버로 감, url필요->화면에 다른 데이터는 변하지 않으면서 일부 처리에 필요한 데이터만 변경. url은 변경이 없다(ajax)
			  //중복안된 경우(아이디가 null인 경우)- 사용가능한 아이디입니다, 
			  //중복된 경우(아이디가 null이 아닌 경우) - 중복된 아이디입니다 ->서버에서 처리
			  // /member/idCheck->*.do:sitemesh 위아래 메뉴와 카피라이트가 붙는다
			  //result->서버에서 전달해 주는 데이터
			  
			  $("#idCheckDiv").load("/member/idCheck?id=" + id, function(result){
					//결과에 따른 배경색 처리
					//alert(result);
					//클래스 다 지우기
				  $("#idCheckDiv").removeClass("alert-success alert-danger");
				  if(result.indexOf("가능한") == -1){  //indexOf는 0부터 시작
					  //중복된경우(배경 빨강)
					  $("#idCheckDiv").addClass("alert-danger");
					  idCheck = false;					  
				  } else {
					  //사용가능한 아이디(배경 파랑)
					  $("#idCheckDiv").addClass("alert-success");
					  idCheck = true;
					  
				  }
			  });
		   }); //$("#id").keyup()이벤트의 끝
		   
		 	//================비밀번호 처리 이벤트
			  $("#pw").keyup(function(){
				  pwCheck = false;
				var pw = $(this).val();
			    
				//4자 미만일시
			  if(pw.length < 4){
				  $("#pwCheckDiv").removeClass("alert-success");
				  $("#pwCheckDiv").addClass("alert-danger");
				  $("#pwCheckDiv").text("비밀번호는 4자 이상이어야 합니다.");
				  return;
			  }
				//10자 초과 처리
			  if(pw.length > 10){
				  $("#pwCheckDiv").removeClass("alert-success");
				  $("#pwCheckDiv").addClass("alert-danger");
				  $("#pwCheckDiv").text("비밀번호는 10자 이내여야 합니다.");
				  return;
			  }
		 
		   	
				
		   		//4-10 사이 중 pw2와 같은지 체크
		   		var pw2 = $("#pw2").val();
				if(pw == pw2){
					//비밀번호와 비밀번호 확인이 같은 경우
					  $("#pwCheckDiv,#pw2CheckDiv").removeClass("alert-danger");
					  $("#pwCheckDiv,#pw2CheckDiv").addClass("alert-success");
					  $("#pwCheckDiv,#pw2CheckDiv").text("사용 가능한 비밀번호입니다.");
					  pwCheck = true;
					 
				}else{ //비밀번호와 비밀번호 확인이 같지 않으면
					  $("#pwCheckDiv,#pw2CheckDiv").removeClass("alert-success");
					  $("#pwCheckDiv,#pw2CheckDiv").addClass("alert-danger");
					  $("#pwCheckDiv").text("비밀번호와 비밀번호 확인은 같아야 합니다.");
						if(pw2.length < 4)
							$("#pw2CheckDiv").text("비밀번호 확인은 4자 이상이어야 합니다.");
						else if(pw2.length >10)
							$("#pw2CheckDiv").text("비밀번호 확인은 10자 이내여야 합니다.");
						else
							$("#pw2CheckDiv").text("비밀번호와 비밀번호 확인은 같아야 합니다.");
							
				}
			  });
			   
			  
			 //================비밀번호 확인 처리 이벤트
				$("#pw2").keyup(function(){
					 pwCheck = false;
					var pw2 = $(this).val();
				    //4자 미만일시
					if(pw2.length < 4){
						  $("#pw2CheckDiv").removeClass("alert-success");
						  $("#pw2CheckDiv").addClass("alert-danger");
						  $("#pw2CheckDiv").text("비밀번호 확인은 4자 이상이어야 합니다.");
						  return;
					  }
				    
					//10자 초과 처리
					  if(pw2.length > 10){
						  $("#pw2CheckDiv").removeClass("alert-success");
						  $("#pw2CheckDiv").addClass("alert-danger");
						  $("#pw2CheckDiv").text("비밀번호 확인은 10자 이내어야 합니다.");
						  return;
					  }
					
					
					//4-10 사이 중 pw와 같은지 체크
			   		var pw = $("#pw").val();
					if(pw == pw2){
						//비밀번호와 비밀번호 확인이 같은 경우
						  $("#pw2CheckDiv,#pwCheckDiv").removeClass("alert-danger");
						  $("#pw2CheckDiv,#pwCheckDiv").addClass("alert-success");
						  $("#pw2CheckDiv,#pwCheckDiv").text("사용 가능한 비밀번호입니다.");
						  pwCheck = true;
						  
					}else{ //비밀번호와 비밀번호 확인이 같지 않으면
						  $("#pwCheckDiv,#pw2CheckDiv").removeClass("alert-success");
						  $("#pwCheckDiv,#pw2CheckDiv").addClass("alert-danger");
						  $("#pw2CheckDiv").text("비밀번호와 비밀번호 확인은 같아야 합니다.");
							if(pw.length < 4)
								$("#pwCheckDiv").text("비밀번호 확인은 4자 이상이어야 합니다.");
							else if(pw.length >10)
								$("#pwCheckDiv").text("비밀번호 확인은 10자 이내여야 합니다.");
							else
								$("#pwCheckDiv").text("비밀번호와 비밀번호 확인은 같아야 합니다.");
								
					}
				  });//비밀번호 처리 이벤트의 끝
				
			
			//회원 가입 이벤트
			$("#writeForm").submit(function(){
				
				//아이디 중복체크 - 사용가능한 아이디인지 확인
				if(!idCheck){
					alert("중복이 되지 않은 적당한 형식의 아이디를 사용하셔야만 합니다");
				$("#id").focus();
				return false;
				}
				//비밀번호와 비밀번호 확인
				if(!pwCheck){
					alert("비밀번호와 비밀번호 확인의 길이가 4~10이어야 하고 같아야 합니다");
				$("#pw").focus();
				return false;
				}
				
			});
			
	});//$(function(){})의 끝
	
</script>
</head>
<body>
	<div class="container">
		<h2>회원가입</h2>
		<form action="write.do" method="post" enctype="multipart/form-data" id="writeForm">
			<div class="form-group">
				<label for="id">아이디</label> 
				<input id="id" name="id" required="required" pattern="[A-Za-z0-9]{4,10}" placeholder="아이디 입력" class="form-control" autocomplete="off">
				<div class="alert alert-danger" id="idCheckDiv">아이디는 4자 이상 입력하셔야 합니다.</div>
			</div>

			<div class="form-group">
				<label for="pw">비밀번호</label> 
				<input id="pw" name="pw" required="required" pattern=".{4,10}" placeholder="비밀번호 입력" class="form-control" type="password">
				<div id="pwCheckDiv" class="alert alert-danger">비밀번호는 4자 이상이어야 합니다.</div>
			</div>

			<div class="form-group">
				<label for="pw2">비밀번호 확인</label> 
				<input id="pw2" name="pw2" required="required" pattern=".{4,10}" placeholder="비밀번호 입력" class="form-control" type="password">
				<div id="pw2CheckDiv" class="alert alert-danger">비밀번호 확인은 4자 이상이어야 합니다.</div>				
			</div>

			<div class="form-group">
				<label for="name">이름</label> 
				<input id="name" name="name" required="required" pattern="[가-힣]{2,10}" placeholder="이름 입력" class="form-control">
			</div>

			<div class="form-group">
				<label>성별</label>
				<div>
					<label class="checkbox-inline">
					<input type="checkbox" name="gender" value="남자">남자</label> 
					<label class="checkbox-inline">
					<input type="checkbox" name="gender" value="여자">여자</label>
				</div>
			</div>
			<div class="form-group">
				<label for="birth">생년월일</label> 
				<input id="birth" name="birth" required="required" placeholder="생년월일 입력" 
				class="form-control datepicker" autocomplete="off">
			</div>
			
			<div class="form-group">
				<label for="tel">연락처</label>
				<input id="tel" name="tel" required="required" placeholder="연락처 입력" 
				class="form-control">
			</div>
			
			<div class="form-group">
				<label for="email">이메일</label>
				<input id="email" name="email" required="required" placeholder="이메일 입력" 
				class="form-control">
			</div>
			
			<div class="form-group">
				<label for="photoFile">사진</label>
				<input id="photoFile" name="photoFile" type="file" 
				class="form-control">
			</div>
			
			<button class="btn btn-default">등록</button>
			<button class="btn btn-default" type="reset">새로입력</button>
			<button class="btn btn-default cancelBtn" type="button">취소</button>
			
				
		</form>
	</div>

</body>
</html>