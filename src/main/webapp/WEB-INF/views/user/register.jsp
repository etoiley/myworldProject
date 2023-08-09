<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%-- Daum 우편번호 서비스 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
	.content {
        background-color:white;
        width:100%;
        margin:auto;
      }
    .innerOuter {
        border:1px solid lightgray;
        width: 45%;
        height : 100%;
        margin:auto;
        margin-bottom: 50px;
        padding:5% 5%;
        background-color:white;
    }
    #registerBtn{
        margin: auto;
        margin-top: 50px;
        float: right;
       
    }
    #sample6_postcode{
      margin: auto; 
    }
  
</style>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="content">
        <br><br>
        <div class="innerOuter">
	
	<h1>회원가입</h1>
	
	<form action="/register.lo" method="post" id="registerForm">
		아이디<input type="text" name="userId" id="registerUserId" required><br/>
        <div id="checkResult" class="result" style="font-size:0.9em; display:none"></div><br>
					
		비밀번호<input type="password" name="userPw" id="registerUserPw" required><br/>
        비밀번호 재확인  <input type="password" id="registerUserPwChk" required><br/>
		이름<input type="text" name="userName" id="registerUserName" required><br/>
		이메일<input type="email" name="userEmail" id="registerUserEmail" required><br>
        <div id="checkEmailResult" class="result" style="font-size:0.9em; display:none"></div><br>
		전화번호
		<input type="text" name="userPhone" id="registerUserPhone" size="14" required><br>
		<br>
		주소 <br>
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="sample6_postcode" placeholder="우편번호" name="userZoneCode"><br>
			<input type="text" id="sample6_address" placeholder="주소" name="userAddress"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="userAddressDetail"><br>
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="userAddressDetail2">
		<input type="submit" id="registerBtn" value="가입">
		</form>
	</div>
</div>

<script>
//유효성
    $("#registerBtn").on("click", function(){
        		
        		var pattern = /^[가-힣]+$/;
        		if($("#registerUserId").val()==""){
        			alert("아이디를 입력해주세요.");
        			$("#registerMemId").focus();
        			return false;
        		}
        		if($("#registerMemIdChk").val()=="N"){
        			alert("아이디 중복 확인을 해주세요.");
        			$("#registerMemId").focus();
        			return false;
        		}
        		if($("#registerUserPw").val()==""){
        			alert("비밀번호를 입력해주세요.");
        			$("#registerUserPw").focus();
        			return false;
        		}
        		if ($('#registerUserPw').val() != $('#registerUserPwChk').val()) {
        			alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요!");
        			$('#registerUserPw').val("");
        			$('#registerUserPwChk').val("");
        			return false;
        		}
        		if($("#registerUserName").val()==""){
        			alert("이름을 입력해주세요.");
        			$("#registerUserName").focus();
        			return false;
        		}
        		if($("#registerUserEmail").val()==""){
        			alert("이메일을 입력해주세요.");
        			$("#registerUserEmail").focus();
        			return false;
        		}
                if($("#registerUserPhone").val()==""){
        			alert("전화번호를 입력해주세요.");
        			$("#registerUserPhone").focus();
        			return false;
        		}
        	
    })

    $(function(){
            //아이디 중복 체크
    		const $idInput = $("#registerForm input[name=userId]");
    		$idInput.keyup(function(){

    			if($idInput.val().length >= 4){
            
    				$.ajax({
                        type : "POST",
    					url:"idCheck.lo",
    					data:{
                            userId : $idInput.val()
                        },
    					success:function(result){
    						console.log(result)
    						if(result == "NN"){ // 사용불가능
    							$("#checkResult").show();
    							$("#checkResult").css("color","red").text("중복된 아이디가 존재합니다.");
    							$("#registerBtn").attr("disabled",true);
    						
    						}else{ // 사용가능
    							$("#checkResult").show();
    							$("#checkResult").css("color","green").text("멋진 아이디네요~"); 
                                $("#registerBtn").attr("disabled",false);  							
    						}
    					}, error:function(){
    						console.log("아이디 중복체크용 ajax 통신 실패");
    					}
    				})
    			}else{
    				$("#checkResult").hide();
    			} 
    		})

            //이메일 중복 체크
            const $emailInput = $("#registerForm input[name=userEmail]");
            $emailInput.keyup(function(){
                if($emailInput.val().length >= 4){
                $.ajax({
                        type : "POST",
    					url:"emailCheck.lo",
    					data:{
                            userEmail : $emailInput.val()
                        },
                        success : function(result){
                            console.log(result)
    						if(result == "NN"){ // 사용불가능
    							$("#checkEmailResult").show();
    							$("#checkEmailResult").css("color","red").text("중복된 이메일이 존재합니다.");
    							$("#registerBtn").attr("disabled",true);
    						
    						}else{ // 사용가능
    							$("#checkEmailResult").show();
    							$("#checkEmailResult").css("color","green").text("사용 가능한 이메일입니다~"); 
                                $("#registerBtn").attr("disabled",false);  							
    						}
                        }

                })
                }else{
    				$("#checkEmailResult").hide();
    			} 
            })       

    	})
    	


    //Daum 우편번호 서비스
    function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
    }


</script>
		
</body>
</html>