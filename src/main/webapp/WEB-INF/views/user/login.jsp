<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
     <!-- CSS only 있어야함 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

 <div style="position:absolute; top:50%; left:50%; width:19%; height:80px; margin:-80px 0px 0px -200px;">
  <form id="loginFrm" name="loginFrm" method="post">
            아이디 : <input type="text" name="userId" id="userId" required/><br>
            패스워드 : <input type="password" name="userPw" id="userPw" required/><br>
            <button type="button" id="userInfoCheck">로그인</button>
  </form>
  <div id="info">
  	 
  </div>
  <button id="searchId" data-bs-toggle="modal" data-bs-target="#searchIdModal">아이디찾기</button>
  <button id="changePw" data-bs-toggle="modal" data-bs-target="#changePwModal">비밀번호재설정</button>
  </div>
  
  
 <!-- Modal -->
 <!-- 아이디 찾기 -->
<div class="modal fade" id="searchIdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">아이디찾기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="text" placeholder="이름" id="findIdName">
        <input type="text" placeholder="핸드폰번호" id="findIdPhone">
        <div id="resultId">
        	아이디 표기하는 곳
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" data-bs-dismiss="modal">Close</button>
        <button type="button" id="findId">찾기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="changePwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 재설정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ..
      </div>
      <div class="modal-footer">
        <button type="button" data-bs-dismiss="modal">Close</button>
        <button type="button" id="findId">찾기</button>
      </div>
    </div>
  </div>
</div>


<script>
//이메일, 아이디 체크
	$('#userInfoCheck').click(function(){
		$("#info").text("");
		
		
		var $userId = $("#userId").val();
		var $userPw = $("#userPw").val();
		
	    if($userId == ""){
	        alert("아이디를 입력하세요.");
	        $("#userId").focus(); // 입력포커스 이동
	        return false; // 함수 종료
	    }
	    if($userPw == ""){
	        alert("비밀번호 입력하세요.");
	        $("#userPw").focus();
	        return false;
	    }
	    
	    $.ajax({
			url : 'userCheck.lo',
			type : 'post',
			data : {
				userId : $userId, 
				userPw : $userPw
			},
			success : function(result){
				console.log("result" + result);
				var result = result;			
				if(result == 'N'){		
					$("#info").text("아이디/비밀번호를 다시 확인해주세요");
					$("#userId").val("");
					$("#userPw").val("");
					$("#userId").focus(); // 입력포커스 이동
					return false;							
				}else{
					 // 폼 내부의 데이터를 전송할 주소
			        document.loginFrm.action="/loginProgress.lo";
			        // 제출
			        document.loginFrm.submit();				
				}		
			}	
			
		})//ajax 끝
	
	
	
	})


	$(function(){
		//하이픈(-) 자동 입력, 클래스에 phoneNumber 추가
        $(document).on("keyup", "#findIdPhone", function() {
        	$(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3").replace("--", "-"));
        });
		
		$('#findId').click(function(){
			
			const $findIdName = $('#findIdName');
			const $findIdPhone = $('#findIdPhone');
			const $resultId = $('#resultId');	
			
			if($findIdName.val() == ""){
				alert("이름을 입력하세요");
				$findIdName.focus();
				return false;			
			}
			if($findIdPhone.val() == ""){
				alert("전화번호를 입력하세요");
				$findIdPhone.focus();
				return false;			
			}			
			
			$.ajax({
				type : 'post',
				url : '/findId.lo',			
				data : {
					'userName' : $findIdName.val(),
					'userPhone' : $findIdPhone.val()
				},
				success : function(result) {
					var result = result;
					console.log(result)
					if(result == 'N'){
						console.log("없음")
						$resultId.text("");
						$resultId.text("입력하신 정보로 알맞은 아이디를 찾지 못했습니다.");
						$findIdName.focus();
					}else{
						searchId.val(result);
					}	
				},
				error : function(){
					console.log("에러체크")
				}
			})
		})
	})

</script>

</body>
</html>