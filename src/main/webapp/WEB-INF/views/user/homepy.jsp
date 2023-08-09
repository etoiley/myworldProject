<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미니홈피</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script type="text/javascript" src="../../resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

	
<style>
div{
	box-sizing : border-box;
}
#minihomepy-wrap{
	width : 1070px;
	height : 570px;	
	background-color : #e7e7e7;
	border-radius: 5px;
	box-shadow: skyblue 5px;
	border : 1px rgb(227, 227, 227) solid;
}
#minihomepy-area{
	width : 1000px;
	height : 550px;
	margin : auto;
	margin-top : 10px;
	background-color :  #f9f9f9;
	border-radius: 5px;
	border : 1px rgb(227, 227, 227) solid;
	
}
#minihomepy-nav{
	height : 13%;
	border-radius: 5px;
	border : 1px rgb(227, 227, 227) solid;
}
#minihomepy-left-side{
	width : 30%;
	height : 70%;
	float : left;
	border : 1px rgb(227, 227, 227) solid;

}
#minihomepy-right-side{
	width : 70%;
	height : 70%;
	border : 1px rgb(227, 227, 227) solid;
	
}
#minihomepy-left-footer{
	width : 30%;
	height : 18%;
	float : left;
}
#minihomepy-right-footer{
	width : 100%;
	height : 18%;	
}
.homepyCount{
	width : 15%;
	float : right;
	margin : 15px;
	font-style: italic;
}
#minihomepy-title{
	width : 50%;
	float : left;
	margin : 18px;
	margin-top: 20px;
	font-family: "Courier New", monospace;
	font-size: 22px;
}
#my-status{	
	height : 12%;
	margin : 10px 10px;
	text-align : center;
	background-color: rgb(218, 218, 218);
	font-family:serif;
}
#minihomepy-img{
	height : 50%;
	width : 70%;
	margin : auto;
}
#minihomepy-profile{
	height : 110px;
	width : 70%;
	margin : auto;
	padding : 5%;
	text-align : center;
	font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
	border : 1px rgb(227, 227, 227) solid;
}
.mini-upBtn{	
	background-color : transparent;
	height : 11px;
	border : 0px;
	font-size : 10px;
	float : right;	
}
.mini-upBtn:hover{
	color : teal;
	font-weight: bold;
}
#mydiaryList{
	height : 70px;
	width : 100%;
}
#todayCountValue, #totalCountValue{
	font-weight: bold;
}
p{
	display : inline-block;
}
#myminiStatus{
	font-weight: bold;
}
ul{
	list-style-type: none;
}
ul>li{
	float: right;
	margin-right: 20px;
}
#minihomepy-left-footer{
	text-align: center;
	font-family: "Courier New", monospace;
}
table * {
	margin: 3px;
	width : 580px;
}
#textareaTd{
border : solid 1px rgba(160, 160, 160, 0.3);
}
#diaryTitle{
	width : 97%;
	height : 30px;
	border: #ffffff;
	background-color : rgb(255, 255, 255);
}

/*방명록*/
#GuestBook-write-wrap{
	width : 580px;
	height : 180px;
	margin : auto;
	margin-top: 35px;
	margin-bottom: 35px;
	border: 1px gray solid ;
	border-radius: 5px;
	background-color: #e7e7e7;
}
.GuestBook-write-wrap2{
	width : 580px;
	height : 200px;
	margin : auto;
	margin-top: 35px;
	margin-bottom: 35px;
	border: 1px gray solid ;
	border-radius: 5px;
	background-color: #e7e7e7;
}
#GuestBook-img-area{
	width : 100px;
	height: 100px;
	margin: 18px;
	border: 1px gray dashed;
	float: left;
	background-color: white;
	
}
#GuestBook-write-area{
	width : 400px;
	height : 100px;
	margin: 20px;
	margin-left: 10px;
	border: 1px gray dashed;
	float: left;
	background-color: white;
}
.GuestBook-img-area2{
	width : 100px;
	height: 100px;
	margin: 10px 10px 10px 18px;
	border: 1px gray dashed;
	float: left;
	background-color: white;	
}
.GuestBook-write-area2{
	width : 400px;
	height : 100px;
	margin: 10px 10px 18px 18px;
	border: 1px gray dashed;
	float: left;
	background-color: white;
}		
#GuestBook-write-btn{
	margin-left: 390px;
	color: #474747;
	background-color: #e7e7e7;
	border-radius: 3px;
	border: #e7e7e7 1px solid;
	padding : 5px;
	transition-duration: 0.4s;
}
#GuestBook-write-btn:hover{
	background-color: rgba(146, 146, 146, 0.932); 
	color : white;
}
#GuestBook-twoBtn>button, #GuestBook-update-btn, .boardBtns button, #diaryInsert, #moreGBbutton{
	color: #474747;
	background-color: #e7e7e7;
	border-radius: 3px;
	border: #e7e7e7 1px solid;
	padding : 5px;
	transition-duration: 0.4s;
	margin : 3px;

}
#GuestBook-twoBtn>button:hover, #GuestBook-update-btn:hover, .boardBtns button:hover , #diaryInsert:hover, #moreGBbutton:hover{
	background-color: rgba(146, 146, 146, 0.932); 
	color : white;
}
#GuestBook-write{
	resize: none;
	height : 75px;
	width : 375px;
	padding : 10px;
	border: none;
	margin: auto;
}
.GuestBook-checkbox{
	margin: 15px;
	font-size: 10px;
}
#GuestIMG{
	width : 100%;
	height : 100%;
}
.GuestBook-writerName{
	font-size: 10px;
	margin-top: 10px;
	margin-left: 20px;
	float: left;
}
.GuestBook-day-area{
	font-size: 10px;
	margin-top: 10px;
	margin-left: 470px;
}
#GuestBook-twoBtn{	
	margin-left: 410px;
}
#GuestBook-update-btn{
	margin-left : 390px;
}
/*미니홈피 헤더*/
#myMenuLis{	
	font-family :Arial, Helvetica, sans-serif;
	color : rgb(10, 102, 82);
}
#myMenuList>ul>li:hover{
	color : rgb(133, 133, 133);
	font-weight: bold;
	cursor: pointer;
}
.boardIMG{
	max-width: 250px;
	max-height: 250px;
}
.myBoardList{
	margin: 30px 10px 50px 10px;
	padding : 10px;
	background-color: #e9e9e9;
	border-radius: 5px;
	border: 1px gray dashed;
}
#noDiary{
	margin: auto;
	text-align: center;
	color :rgb(10, 102, 82)
}
#noDiaryList{
	margin:auto;
	color: #1baa30;
}
#diaryInsert{
	display: block;
}
.diaryInfo{
	padding : 12px;
}
.diaryInfo .mydiaryTitle{
	color: #474747;
	font-size: 15px;
}
.diaryInfo .mydiaryTitle:hover{
	cursor: pointer;
	color: #30a341;
}
.diaryInfo .mydiaryDay{
	color :rgb(0, 0, 0);
	font-size: 10px;
	font-weight: 100;
	margin-left: 180px;
}
.categoryList{
	padding-left : 12px;
	color: #474747;
	font-size: 15px;
}
.categoryList:hover{
	cursor: pointer;
	color: #30a341;
}
#myminihomepyImg{
	margin: 10px;
}
.todayVisitor-title{	
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: 30%;	
	font-family: Arial, Helvetica, sans-serif;
}
.todayVisitor-List{
	margin-left: 30%;
	padding : 3px;
	font-size: 10px;
}
#mainPage{
	width : 650px;
	height : 350px;
}
#moreGBbutton{
	margin-left: 50%;
}
.categoryList-area{
	margin-left: 30%;
	padding : 5px;
}



</style>
</head>
<body>
<div id="minihomepy-wrap" style="overflow: hidden;">
	<div id="minihomepy-area">
		<div id="minihomepy-nav">
			<div id="minihomepy-title">
				<div id="myminiTitle">${minihomepyVo.miniTitle }</div>
				<c:if test="${(loginUser.userNo eq minihomepyVo.userNo) || (loginUser.userId eq 'admin')}">
					<button id="miniTitle-FormupBtn" class="mini-upBtn"> > 타이틀 바꾸기</button>
					<button id="miniTitle-upBtn" class="mini-upBtn">수정하기</button>
				</c:if>
			</div>
			<div id="totalCount"class="homepyCount">Total : <p id="totalCountValue"><p></div>
			<div id="todayCount" class="homepyCount">Today :<p id="todayCountValue"><p> </div>
		</div>
		<div id="minihomepy-left-side">
			<div id="my-status">Today is...<p id="myminiStatus">${minihomepyVo.miniMystatus }</p>			
			</div>
			<div id="minihomepy-img">
				<img id="myminihomepyImg" style="width: 170px; height: 170px;"/>

			</div>
			<div id="minihomepy-profile">
				<pre id="myminiProfile">${minihomepyVo.miniProfile }</pre>
				
			</div>
			<c:if test="${(loginUser.userNo eq minihomepyVo.userNo) || (loginUser.userId eq 'admin')}">
				<button id="miniProfileStatus-FormupBtn" class="mini-upBtn"> > 프로필 바꾸기</button>
				<button id="miniProfileStatus-upBtn" class="mini-upBtn"> > 수정하기</button>
			</c:if>
		</div>
		<div id="myMenuList">
			<ul>
				<li id="myGuestBook-home">GuestBook</li>
				<li id="myBoard-home">Board</li>
				<li id="myDiary-home">Diary</li>
				<li id="myHome-home">Home</li>
			</ul>
		</div>
		<div id="minihomepy-right-side" style="overflow: auto">
			<img src="../../resources/images/2.png" id="mainPage">


		</div>
		<div id="minihomepy-left-footer"></div>
		<div id="minihomepy-right-footer"></div>
	</div>



</div>





</body>
<script>
	//홈으로 가기
	$(document).on("click", "#myHome-home", function(){	
	
		//console.log(${loginUser.userNo})
		//console.log(${minihomepyVo.userNo})
		location.reload();
	})

	
	if("${minihomepyVo.fileNo}" == 0){
	$("#myminihomepyImg").attr("src", "../../resources/images/jordy.jpg");
	}
	
	var fileNo = ${minihomepyVo.fileNo};
	if(fileNo != ""){		
		$("#myminihomepyImg").attr("src", "../../" + "${minihomepyVo.filePath}");
	}

	$("#myminihomepyImg").click(function(){	
		$("#file1").click();
	})
	//사진 등록 후 사진 미리보기
	function readURLModi(inputFile){		
			
			if(inputFile.files.length == 1){
				
				var reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);	
				reader.onload = function(e){
					
					$('#myminihomepyImg').attr("src", e.target.result);		
				}
			}else{
				$("#myminihomepyImg").attr("src", null);
			}	
		}

$(function(){
	
	//미니홈피 타이틀 수정
	$("#miniTitle-upBtn").hide();
	$(document).on("click", "#miniTitle-FormupBtn", function(){
		$("#myminiTitle").html("<input type='text' name='miniTitle' id='miniTitle' value='" + $("#myminiTitle").text() + "'>");
		
		$("#miniTitle-FormupBtn").hide();
		$("#miniTitle-upBtn").show();
		
	})
	
	$(document).on("click", "#miniTitle-upBtn", function(){		
		
		$.ajax({
			type : "POST",
			url : "/updateMiniTitle.hp",		
			data : {
				miniTitle : $("#miniTitle").val(),
				miniNo : ${minihomepyVo.miniNo}
			},
			success : function(result){
				
				$("#myminiTitle").html("<input type='text' name='miniTitle' id='miniTitle' value='" + result + "'>");
			
				$("#myminiTitle").text(result);
				$("#miniTitle-upBtn").hide();
				$("#miniTitle-FormupBtn").show();

			},			
			error : function(err){
				console.log(err);
			}
		});
		
	})
	//미니홈피 정보(상태, 사진, 프로필) 수정
	$("#miniProfileStatus-upBtn").hide();
	$(document).on("click", "#miniProfileStatus-FormupBtn", function(){
		$("#myminiStatus").html("<input type='text' name='miniMystatus' id='miniMystatus' value='" + $("#myminiStatus").text() + "'>");
		$("#minihomepy-img").append("<input style='display: none;' type='file' name='upfile' id='file1' class='upload up' accept='images/*' onchange='readURLModi(this);'/>")
		$("#myminiProfile").html("<textarea type='text' name='miniProfile' id='miniProfile'>" + $("#myminiProfile").text() + "</textarea>");
		
		$("#miniProfileStatus-FormupBtn").hide();
		$("#miniProfileStatus-upBtn").show();
		
			
	})
 	$(document).on("click", "#miniProfileStatus-upBtn", function(){
 		console.log("? :"+ $("#miniMystatus").val()+ " " +$("#miniProfile").val() )
		 var formData = new FormData();
			formData.append("miniMystatus", $("#miniMystatus").val());
			formData.append("miniProfile" ,$("#miniProfile").val());
			formData.append("miniNo",  ${minihomepyVo.miniNo});
			formData.append("fileNo", ${minihomepyVo.fileNo});
			formData.append("upfile", document.getElementById('file1').files[0]);
		
		$.ajax({
			type : "POST",
			url : "/updateMiniProfile.hp",	
			enctype : "multipart/form-data",
			processData : false,
			contentType : false,
			dataType : 'json',
			data : formData,
			success : function(result){
				
				$("#myminiStatus").text(result.miniMystatus);
				$("#myminiProfile").text(result.miniProfile);
				$('input').remove( '#file1' );
				$("#myminihomepyImg").attr("src", "../../" + result.filePath);	
			}	
		})
		
		$("#miniProfileStatus-upBtn").hide();
		$("#miniProfileStatus-FormupBtn").show();
 
	}) 

	//totalCount
	$.ajax({
		type : "POST",
		url : "/totalCount.hp",		
		data : {		
			miniNo : ${minihomepyVo.miniNo}
		},
		success : function(result){				
			$("#totalCountValue").html(result);
		},
		error : function(err){
			console.log(err);
		}
	});
	//todayCount
	$.ajax({
		type : "POST",
		url : "/todayCount.hp",		
		data : {		
			miniNo : ${minihomepyVo.miniNo}
		},
		success : function(result){	
			$("#todayCountValue").html(result);
		},
		error : function(err){
			console.log(err);
		}
	});
	$(function(){
//다이어리 항목으로
	$(document).on("click", "#myDiary-home", function(){
	
		$.ajax({
			type : "POST",
			url : "/myDiaryHome.hp",
			data : {
				miniNo : ${minihomepyVo.miniNo}
			},
			success : function(result){
				
				if(result!= 0){
					$("#minihomepy-left-side").html("");
					$("#minihomepy-right-side").html("");				
					
					let value = "";
					for(let i in result){
						value += "<div class='diaryInfo'><div class='mydiaryTitle' id='mydiaryTitle" + result[i].diaryNo + "'>" + result[i].diaryTitle + "</div>"
							+ "<div class='mydiaryDay'>" + result[i].diaryDay + "</div>"
							+ "<div class='mydiaryNo' style='display:none;'>" + result[i].diaryNo + "</div></div>"
					}	
					$("#minihomepy-left-side").html(value);
					<c:if test="${(loginUser.userNo eq minihomepyVo.userNo) || (loginUser.userId eq 'admin')}">
						$("#minihomepy-left-side").append("<button id='diaryInsert'>글 적으러 가기!</button>");
					</c:if>
					$(".mydiaryTitle").eq(0).trigger("click");
				
				}else{
					console.log("글 없는 곳")	
					$("#minihomepy-left-side").html("<p id='noDiary'>아직 글 없음</p>")
					<c:if test="${(loginUser.userNo eq minihomepyVo.userNo) || (loginUser.userId eq 'admin')}">
						$("#minihomepy-left-side").append("<button id='diaryInsert'>글 적으러 가기!</button>")
					</c:if>
					$("#minihomepy-right-side").html("<p id='noDiaryList'>아직 글이 없어욤</p>");
				}		
			}
		})		
	})
	//다이어리 작성 폼 불러오기
	$(document).on("click", "#diaryInsert", function(){
		let value = "";
			value += "<div id='mydiaryInsertForm'>"								
				+ "<table align='center'>"           
				+	"<tr>"
				+		"<th><label for='diaryTitle'>제목</label></th>"                     
				+		"<td><input type='text' id='diaryTitle' class='form-control' name='diaryTitle' required></td>"
				+	"</tr>"							
				+	"<tr>"
				+		"<th><label for='diaryContent'>내용</label></th>"
				+		"<td colspan='2'><div id='textareaTd'><textarea name='diaryContent' id='diaryContent' rows='20' required></textarea></div></td>"          
				+	"</tr>"
				+"</table>"
				+"<br>"
				+	"<div align='center'>"
				+		"<button type='button' id='insertDiary'>등록하기</button>"
				+		"<button type='reset'>취소하기</button>"
				+	"</div>"
				+"</div>"
		$("#minihomepy-right-side").html(value);

		//스마트 에디터
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "diaryContent",
		sSkinURI: "resources/smartEditor/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,             
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,     
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true
		}, 
		fCreator: "createSEditor2"
		});
	
		$(function(){		
			$("#insertDiary").click(function(){
				// 에디터의 내용이 textarea에 적용
					oEditors.getById["diaryContent"].exec("UPDATE_CONTENTS_FIELD", []);			
			})
		})
		
	})
	//다이어리 작성
	$(document).on("click", "#insertDiary", function(){
		$.ajax({
			type : "POST",
			url : "/insertDiary.hp",
			data : {
				miniNo : ${minihomepyVo.miniNo},
				diaryTitle : $("#diaryTitle").val() ,
				diaryContent : $("#diaryContent").val(),
				userNo : ${minihomepyVo.userNo}
			},
			success : function(result){
				$("#myDiary-home").trigger("click");
			
			}			
		})
	})
	//다이어리 상세보기
	$(document).on("click", ".mydiaryTitle", function(){
		var diaryNo = $(this).next().next().text();
		$.ajax({	
			type : "POST",
			url : "/detailDiary.hp",
			data : {
				miniNo : ${minihomepyVo.miniNo},
				diaryNo : diaryNo
			},
			success : function(mydiaryDetail){	
							
				let value = "";
				value += "<div id='mydiaryInsertForm'>"								
					+ "<table align='center'>"           
					+	"<tr>"
					+		"<th><label for='diaryTitle'>제목</label></th>"                     
					+		"<td>" + mydiaryDetail.diaryTitle +"</td>"
					+	"</tr>"							
					+	"<tr>"
					+		"<th><label for='diaryContent'>내용</label></th>"
					+		"<td colspan='2'><div id='textareaTd'><div>" + mydiaryDetail.diaryContent + "</div></div></td>"          
					+	"</tr>"
					+"</table>"
					+"<br>"
					+	"<div id='mydiaryNo' style='display:none;'>" + mydiaryDetail.diaryNo + "</div>"
					<c:if test="${(loginUser.userNo eq minihomepyVo.userNo) || (loginUser.userId eq 'admin')}">
					value +=	"<div align='center'>"
					+		"<button type='button' id='updateFormDiary'>수정하기</button>"
					+		"<button type='button' id='deleteDiary'>삭제하기</button>"
					+	"</div>"
					</c:if>
					value += "</div>";
					
					$("#minihomepy-right-side").html(value);		
			}			
		})	
	
	})
	//다이어리 수정(폼 불러오기)
	$(document).on("click", "#updateFormDiary", function(){
		
		$.ajax({	
			type : "POST",
			url : "/detailDiary.hp",
			data : {				
				diaryNo : $("#mydiaryNo").text(),
				miniNo : ${minihomepyVo.miniNo}
			},			
			success: function(mydiaryDetail){
				
				let value = "";
				value += "<div id='myDiaryUpdate'>"								
					+ "<table align='center'>"           
					+	"<tr>"
					+		"<th><label for='diaryTitle'>제목</label></th>"                     
					+		"<td><input type='text' id='diaryTitle' class='form-control' name='diaryTitle' value='" + mydiaryDetail.diaryTitle + "'required></td>"
					+	"</tr>"							
					+	"<tr>"
					+		"<th><label for='diaryContent'>내용</label></th>"
					+		"<td colspan='2'><div id='textareaTd'><textarea name='diaryContent' id='diaryContent' rows='20' required>" +  mydiaryDetail.diaryContent +"</textarea></div></td>"          
					+	"</tr>"
					+"</table>"
					+"<br>"
					+ "<div id='mydiaryNo' style='display:none;'>" + mydiaryDetail.diaryNo + "</div>"
					+	"<div align='center'>"
					+		"<button type='button' id='updateDiary'>등록하기</button>"
					+	"</div>"
					+"</div>"
					
				$("#minihomepy-right-side").html(value);

				//스마트 에디터
				var oEditors = [];
				nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "diaryContent",
				sSkinURI: "resources/smartEditor/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,             
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,     
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true
				}, 
				fCreator: "createSEditor2"
				});
			
				$(function(){		
					$("#updateDiary").click(function(){
						// 에디터의 내용이 textarea에 적용
							oEditors.getById["diaryContent"].exec("UPDATE_CONTENTS_FIELD", []);			
					})
				})
			}	
		})
	})

	//다이어리 수정
    $(document).on("click", "#updateDiary", function(){
		if(confirm("게시글을 수정하시겠습니까?")){
			$.ajax({	
				type : "POST",
				url : "/updateDiary.hp",
				data : {				
					diaryNo : $("#mydiaryNo").text(),
					diaryTitle : $("#diaryTitle").val(),
					diaryContent : $("#diaryContent").val(),	
					miniNo : ${minihomepyVo.miniNo}	
				},
				success : function(mydiaryDetail){			
									
					let value = "";
					value += "<div id='mydiaryInsertForm'>"								
						+ "<table align='center'>"           
						+	"<tr>"
						+		"<th><label for='diaryTitle'>제목</label></th>"                     
						+		"<td>" + mydiaryDetail.diaryTitle +"</td>"
						+	"</tr>"							
						+	"<tr>"
						+		"<th><label for='diaryContent'>내용</label></th>"
						+		"<td colspan='2'><div id='textareaTd'><div>" + mydiaryDetail.diaryContent + "</div></div></td>"          
						+	"</tr>"
						+"</table>"
						+"<br>"
						+	"<div id='mydiaryNo' style='display:none;'>" + mydiaryDetail.diaryNo + "</div>"
						+	"<div align='center'>"
						+		"<button type='button' id='updateFormDiary'>수정하기</button>"
						+		"<button type='button' id='deleteDiary'>삭제하기</button>"
						+	"</div>"
						+"</div>";
						
						var titleNo = "#mydiaryTitle" + mydiaryDetail.diaryNo;
						
						$(titleNo).html(mydiaryDetail.diaryTitle);
						$("#minihomepy-right-side").html(value);
				}
			})	
		}
	})	

	$(document).on("click", "#deleteDiary", function(){
		if(confirm("다이어리를 삭제하시겠습니까?")){
			$.ajax({	
			type : "POST",
			url : "/deleteDiary.hp",
			data : {				
				diaryNo : $("#mydiaryNo").text(),		
			},
			success : function(result){
				if(result>0){
					alert("삭제 완료")
				}
				$("#myDiary-home").trigger("click");
			}
			})				
		}	
	})
})

	//게시판 카테고리 보이기
	function categoryList(){
		$.ajax({	
				type : "POST",
				url : "/boardCate.hp",
				data : {				
					miniNo : ${minihomepyVo.miniNo}				
				},
				success : function(data){
					console.log(data);
					var value = "";
					for(let i in data){	
						value +=  "<div class='categoryList'>" 
							  		+  "<p class='categoryN'>" + data[i].cateName + "</p>" 
							  		+  "<p class='categoryNo' style='display:none'>" + data[i].cateNo + "</p>" 
							  	+  "</div>"
					}
					$('#minihomepy-left-side').html(value);

					var buttonValue = "";
						buttonValue += "<button id='categoryBtn'>카테고리 관리</button>"
					<c:if test="${(loginUser.userNo eq minihomepyVo.userNo) || (loginUser.userId eq 'admin')}">
					$("#minihomepy-left-side").append(buttonValue);	
					</c:if>
					var insertBoardBtn = "";
						insertBoardBtn += "<button id='insertBoardBtn'>글 작성</button>"
					<c:if test="${(loginUser.userNo eq minihomepyVo.userNo) || (loginUser.userId eq 'admin')}">
					$("#minihomepy-left-side").append(insertBoardBtn);	
					</c:if>
				}
			})						
	}
	//카테고리 관리
	$(document).on("click", "#categoryBtn", function(){
		categoryManage()
	})
	function categoryManage(){
		$.ajax({	
				type : "POST",
				url : "/boardCate.hp",
				data : {				
					miniNo : ${minihomepyVo.miniNo}				
				},
				success : function(data){
					var value = "";
						
					for(let i in data){	
					
							value  += "<div class='categoryList-area'>" 
							  + "<input type='hidden' class='categoryNo' value=" +  data[i].cateNo + ">"
							  +	"<input type='text' class='categoryName' value=" +  data[i].cateName + ">"
							  + "<button class='updateCategory'>수정</button><button class='deleteCategory'>삭제</button>"
							  + "</div>"					 
					}						
					$('#minihomepy-right-side').html(value);
					
					var catePlus = "";
						catePlus += "<div><input type='text' id='cateName'></div>"
								+ "<button id='insertCategory'>추가하기</button>"
					$('#minihomepy-right-side').append(catePlus);			
				}
			})

	}
	//카테고리 수정
	$(document).on("click", ".updateCategory", function(){

		var $categoryNo = $(this).parent().children('.categoryNo')
		var $categoryName = $(this).parent().children('.categoryName')
		if($categoryName.val().trim() != 0 ){
			$.ajax({	
				type : "POST",
				url : "/updateBoardCate.hp",
				data : {				
					miniNo : ${minihomepyVo.miniNo},
					cateNo : $categoryNo.val(),
		
					changeName : $categoryName.val()
				},
				success : function(result){
				
					if(result=="NN"){
						alert("중복되는 카테고리 명이 존재하여 추가 불가능")
					}else{
						alert("수정 완료");
						categoryList();
					}
				}
			})
		}else{
			alert("공백은 입력되지 않습니다.")
		}
	})
	//카테고리 삭제
	$(document).on("click", ".deleteCategory", function(){
		if(confirm("삭제하시겠습니까?")){
			var $categoryNo = $(this).parent().children('.categoryNo')
			var $categoryName = $(this).parent().children('.categoryName')
				$.ajax({	
					type : "POST",
					url : "/deleteBoardCate.hp",
					data : {				
						miniNo : ${minihomepyVo.miniNo},
						cateNo : $categoryNo.val(),
						cateName : $categoryName.val()
					},
					success : function(result){
						
						if(result == "NN1"){
							alert("카테고리가 하나 뿐이라 삭제 불가능")
						}else if(result == "NN2"){
							alert("해당 카테고리에 남아있는 글이 있어서 삭제 불가능")
						}else{
							alert("카테고리 삭제 완료")
							categoryList();
							categoryManage();
						}
					}
				})					
		}
	})
	//카테고리 추가
	$(document).on("click", "#insertCategory", function(){
		$cateName = $("#cateName");

		if($cateName.val().trim() != 0 ){
		
		$.ajax({	
				type : "POST",
				url : "/insertBoardCate.hp",
				data : {				
					miniNo : ${minihomepyVo.miniNo},
					cateName : $cateName.val()
				},
				success : function(result){
				
					if(result == "NN"){
						alert("중복되는 카테고리 명이 존재하여 추가 불가능")
					}else{
						
						alert("카테고리 추가 완료")
						categoryList();
						categoryManage();
					}
				}
			})
		}else{
			alert("공백은 입력되지 않습니다.")
		}

	})
	$(document).on("click", ".categoryList", function(){
		$categoryNo = $(this).children('.categoryNo')	
		BoardList($categoryNo.text());
	})

	$(document).on("click", ".categoryList", function(){
		$categoryNo = $(this).children('.categoryNo')	
		BoardList($categoryNo.text());
	})

	//게시글 불러오기(전체)
	function totalBoardList(){
		console.log("전체 리스트 불러오기");
		$.ajax({	
				type : "POST",
				url : "/totalBoardList.hp",
				data : {				
					miniNo : ${minihomepyVo.miniNo} 			
				},
				success : function(data){
					console.log("전체 게시글", data)
					let value = "";												
					if(data.length != 0){
						for(let i in data){					
						value += "<div class='myBoardList'>"								
							+ "<table align='center'>"           
							+	"<tr>"
							+		"<th>제목</th>"                     
							+		"<td>" + data[i].boardTitle +"</td>"
							+	"</tr>"	
							+	"<tr>"
							+		"<th>분류</th>"                     
							+		"<td>" + data[i].boardCate +"</td>"
							+	"</tr>"	
							+	"<tr>"
							+		"<th>날짜</th>"                     
							+		"<td>" + data[i].boardDay +"</td>"
							+	"</tr>"						
							+	"<tr>"
							+		"<th>내용</th>"
							+		"<td colspan='2'>"
							if(data[i].filePath != null){
								value += "<img class='boardIMG' src=" + data[i].filePath+ ">" 
							}									
							value +=  data[i].boardContent 
							+		"</td>"          
							+	"</tr>"
							+"</table>"
							+"<br>"
							+	"<div class='boardNo' style='display:none;'>" + data[i].boardNo + "</div>"
							<c:if test="${(loginUser.userNo eq minihomepyVo.userNo) || (loginUser.userId eq 'admin')}">
							value +=	"<div align='center' class='boardBtns'>"
							+		"<button type='button' class='updateFormBoard'>수정하기</button>"
							+		"<button type='button' class='deleteBoard'>삭제하기</button>"
							+	"</div>"
							</c:if>
							value += "</div>";
						}
						
						$("#minihomepy-right-side").html(value);
					}else{
						value += "<div>해당 카테고리에 게시글이 존재하지 않습니다.</div>"
						$("#minihomepy-right-side").html(value);
					}
				}
		})
	}
	
	//게시글 불러오기
	function BoardList(param){
		$.ajax({	
				type : "POST",
				url : "/boardList.hp",
				data : {				
					cateNo : param			
				},
				success : function(data){
					console.log(data)
					let value = "";												
					if(data.length != 0){
						for(let i in data){					
						value += "<div class='myBoardList'>"								
							+ "<table align='center'>"           
							+	"<tr>"
							+		"<th>제목</th>"                     
							+		"<td>" + data[i].boardTitle +"</td>"
							+	"</tr>"	
							+	"<tr>"
							+		"<th>분류</th>"                     
							+		"<td>" + data[i].boardCate +"</td>"
							+	"</tr>"	
							+	"<tr>"
							+		"<th>날짜</th>"                     
							+		"<td>" + data[i].boardDay +"</td>"
							+	"</tr>"						
							+	"<tr>"
							+		"<th>내용</th>"
							+		"<td colspan='2'>"
							if(data[i].filePath != null){
								value += "<img class='boardIMG' src=" + data[i].filePath+ ">" 
							}									
							value +=  data[i].boardContent 
							+		"</td>"          
							+	"</tr>"
							+"</table>"
							+"<br>"
							+	"<div class='boardNo' style='display:none;'>" + data[i].boardNo + "</div>"
							<c:if test="${(loginUser.userNo eq minihomepyVo.userNo) || (loginUser.userId eq 'admin')}">
							value +=	"<div align='center' class='boardBtns'>"
							+		"<button type='button' class='updateFormBoard'>수정하기</button>"
							+		"<button type='button' class='deleteBoard'>삭제하기</button>"
							+	"</div>"
							</c:if>
							value += "</div>";
						}
						
						$("#minihomepy-right-side").html(value);
					}else{
						value += "<div>해당 카테고리에 게시글이 존재하지 않습니다.</div>"
						$("#minihomepy-right-side").html(value);
					}
				}
		})
	}

	//게시글 작성 폼 불러오기
	$(document).on("click", "#insertBoardBtn", function(){
		$.ajax({	
				type : "POST",
				url : "/boardCate.hp",
				data : {				
					miniNo : ${minihomepyVo.miniNo}				
				},
				success : function(data){
					let value = "";
						value += "<div id='myBoardInsertForm'>"								
							+ "<table align='center'>"           
							+	"<tr>"
							+		"<th><label for='boardTitle'>제목</label></th>"                     
							+		"<td><input type='text' id='boardTitle' class='form-control' name='boardTitle' required></td>"
							+	"</tr>"
							+	"<tr>"
							+		"<th><label for='boardTitle'>카테고리</label></th>"  
							+"<td><select id='boardCate'>"	
							for(let i in data){	
								value += "<option value='" + data[i].cateName  +"'>" + data[i].cateName +"</option>"						
								}		
							
							value += "</select></td></tr>"	
							+	"<tr>"
							+		"<th><label for='boardFile'>파일</label></th>"                     
							+		"<td><input type='file' id='boardFile' name='upfile'></td>"
							+	"</tr>"						
							+	"<tr>"
							+		"<th><label for='boardContent'>내용</label></th>"
							+		"<td colspan='2'><div id='textareaTd'><textarea name='boardContent' id='boardContent' rows='20' required></textarea></div></td>"          
							+	"</tr>"
							+"</table>"
							+"<br>"
							+	"<div align='center'>"
							+		"<button type='button' id='insertBoard'>등록하기</button>"
							+	"</div>"
							+"</div>"
					$("#minihomepy-right-side").html(value);

					//스마트 에디터
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
					oAppRef: oEditors,
					elPlaceHolder: "boardContent",
					sSkinURI: "resources/smartEditor/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,             
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,     
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true
					}, 
					fCreator: "createSEditor2"
					});
				
					$(function(){		
						$("#insertBoard").click(function(){
							// 에디터의 내용이 textarea에 적용
								oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", []);			
						})
					})
				}
			})	
	})
	//게시판 작성
	$(document).on("click", "#insertBoard", function(){ 
		console.log("게시판 작성버튼")
		var formData = new FormData();
			formData.append("miniNo", ${minihomepyVo.miniNo});
			formData.append("boardCate", $("#boardCate").val() );
			formData.append("boardTitle",$("#boardTitle").val());
			formData.append("boardContent",  $("#boardContent").val());
			formData.append("upfile", document.getElementById('boardFile').files[0]);
			
			/*for (var pair of formData.entries()) {
                console.log(pair[0]+ ', ' + pair[1]); 
            }*/

		$.ajax({
			type : "POST",
			url : "/insertBoard.hp",
			enctype : "multipart/form-data",
			processData : false,
			contentType : false,
			dataType : 'json',
			data : formData,
			success : function(result){		
		
			}			
		})
		
		alert("게시글 작성 완료")
		$("#myBoard-home").trigger("click");	
	})
	//게시글 수정하기(폼 불러오기)
	$(document).on("click", ".updateFormBoard", function(){
		$boardNo = $(this).parent().siblings(".boardNo");
		
		$.ajax({	
			type : "POST",
			url : "/detailBoard.hp",
			data : {				
				boardNo : $boardNo.text(),
				miniNo : ${minihomepyVo.miniNo}
			},			
			success: function(myboardDetail){
				
				$.ajax({	
					type : "POST",
					url : "/boardCate.hp",
					data : {				
						miniNo : ${minihomepyVo.miniNo}				
					},
					success : function(data){
						console.log(myboardDetail.boardNo)
						console.log("???" + typeof(myboardDetail.boardNo));
						let value = "";
						value += "<div id='myBoardUpdate'>"								
							+ "<table align='center'>"           
							+	"<tr>"
							+		"<th><label for='boardTitle'>제목</label></th>"                     
							+		"<td><input type='text' id='boardTitle' class='form-control' name='boardTitle' value='" + myboardDetail.boardTitle + "'required></td>"
							+	"</tr>"	
							+	"<tr>"
							+		"<th><label for='boardTitle'>카테고리</label></th>"  
							+	"<td><select id='boardCate'>"
							for(let i in data){	
							value += "<option value='" + data[i].cateName  +"'>" + data[i].cateName +"</option>"						
							}		
							value += "</select></td></tr>"	
							+	"<tr>"
							+		"<th><label for='boardFile'>파일</label></th>"                     
							+		"<td><input type='file' id='boardFile' name='reupfile'></td>"
							+	"</tr>"								
							+	"<tr>"
							+		"<th><label for='boardContent'>내용</label></th>"
							+		"<td colspan='2'><div id='textareaTd'><textarea name='boardContent' id='boardContent' rows='20' required>" +  myboardDetail.boardContent +"</textarea></div></td>"          
							+	"</tr>"
							+"</table>"
							+"<br>"
							+ "<div id='boardNo' style='display:none;'>" + myboardDetail.boardNo + "</div>"
							+	"<div align='center'>"
							+		"<button type='button' id='updateBoard'>등록하기</button>"
							+	"</div>"
							+"</div>"
						
						$("#minihomepy-right-side").html(value);

						//스마트 에디터
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors,
						elPlaceHolder: "boardContent",
						sSkinURI: "resources/smartEditor/SmartEditor2Skin.html",
						htParams : {
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar : true,             
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true,     
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true
						}, 
						fCreator: "createSEditor2"
						});
					
						$(function(){		
							$("#updateBoard").click(function(){
								// 에디터의 내용이 textarea에 적용
									oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", []);			
							})
						})
					}	
				})
			}//							
		})				
	})
	//게시글 수정하기
	$(document).on("click", "#updateBoard", function(){
		if(confirm("게시글을 수정하시겠습니까?")){
			
			var formData = new FormData();
			formData.append("miniNo", ${minihomepyVo.miniNo});
			formData.append("boardNo", $("#boardNo").text());
			formData.append("boardCate", $("#boardCate").val());
			formData.append("boardTitle",$("#boardTitle").val());
			formData.append("boardContent",  $("#boardContent").val());
			formData.append("reupfile", document.getElementById('boardFile').files[0]);
			
			$.ajax({
				type : "POST",
				url : "/updateBoard.hp",
				enctype : "multipart/form-data",
				processData : false,
				contentType : false,
				dataType : 'json',
				data : formData,
				success : function(result){
					console.log(result)	
						
				}			
			})
		$("#myBoard-home").trigger("click");	
		}
	
	})
	//게시글 삭제하기
	$(document).on("click", ".deleteBoard", function(){
		$boardNo = $(this).parent().siblings(".boardNo");
		if(confirm("게시글을 삭제하시겠습니까?")){
			$.ajax({	
					type : "POST",
					url : "/deleteBoard.hp",
					data : {				
						boardNo : $boardNo.text()			
					},
					success : function(result){
						if(result == "YY"){
							alert("게시글 삭제 완료")
						}else{
							alert("게시글 삭제 실패")
						}
					}
				})
		}
	  })
	//게시판 홈
	$(document).on("click", "#myBoard-home", function(){
		categoryList();
		totalBoardList();
	
	})
	//방명록
	$(document).on("click", "#myGuestBook-home", function(){

		//오늘의 방문자
		$.ajax({	
				type : "POST",
				url : "/todayVisitor.hp",
				data : {				
					miniNo : ${minihomepyVo.miniNo}			
				},
				success : function(data){
					console.log(data)
					let titleValue = "";
					titleValue = "<div class='todayVisitor-title'>♥ Today Visitor ♥</div>";
					
					for(let i in data){	
						titleValue +=  "<div class='todayVisitor-List'>" + data[i].userName + "(" + data[i].userId +")</div>"
									
					}	
					$('#minihomepy-left-side').html(titleValue);
					
				}
			})
		
		
		let value = "";
			value += "<div id='GuestBook-write-wrap'>"
						+ "<div id='GuestBook-img-area'><img id='GuestIMG' src='../../" + "${loginUserFile.filePath}"  + "'></div>"
						+ "<div id='GuestBook-write-area'><textarea id='GuestBook-write'></textarea></div>"
							
						+ "<div><div class='GuestBook-checkbox'> 비밀글 체크 : <input type='checkbox' id='GuestBook-secret'><button id='GuestBook-write-btn'>작성하기</button></div></div>"
						+ "</div>"
		$('#minihomepy-right-side').html(value);

		
		$.ajax({	
				type : "POST",
				url : "/guestBookList.hp",
				data : {				
					miniNo : ${minihomepyVo.miniNo},
					loginUserNo : ${loginUser.userNo}			
				},
				success : function(data){
					$('#minihomepy-right-side').append("<div id='GuestBookList-area'></div>");	
					if(data == null){
						//작성된 방명록 없음
					}else{
						//방명록 있움
						
						let value2 = "";
							
						for(let i in data){						
							value2 += "<div class='GuestBook-write-wrap2'>"
										+"<div class='GuestNo' style='display : none'>" + data[i].gbNo +"</div>" 
										+ "<div class='GuestBook-writerName'> FROM. " + data[i].userName  +"</div>"
										+ "<div class='GuestBook-day-area'> DAY. " + data[i].gbDay + "</div>"
										+ "<div class='GuestBook-img-area2'><img id='GuestIMG' src='../../" + data[i].filePath  + "'></div>"
										+ "<div class='GuestBook-write-area2'><pre id='GuestBook-write'>" + data[i].gbContent +"</pre></div>"
										+ "<div class='GuestBook-checkbox'></div>"
										if(${loginUser.userNo} == data[i].gbWriter){
											value2 += "<div id='GuestBook-twoBtn'><button class='GuestBook-updateForm-btn'>수정하기</button>"
													+ "<button class='GuestBook-delete-btn'>삭제하기</button></div>"	
										}								
										value2 += "</div>" 
						}
						$('#GuestBookList-area').append(value2);	
						
						//방명록 더보기(페이징)
						let value3 = "";
						value3 += "<div id='moreGBbutton-area'><button id='moreGBbutton'>더보기</button></div>"
							$('#minihomepy-right-side').append(value3);	
					}						
				}
			})
	})
	
	//방명록 더보기(페이징)
	function moregbList(){
		var callLength = $("#minihomepy-right-side").children().children(".GuestBook-write-wrap2").length;
		console.log("ㅇㅇ",callLength)
		$.ajax({
			type : "POST",
			url : "/moregbList.hp",
			data : {				
				miniNo : ${minihomepyVo.miniNo},
				loginUserNo :  ${loginUser.userNo},
				callLength : callLength,
				limit : 5
			
			},
			success : function(data){
				console.log("더보기 가저온", data)
				let value2 = "";
				if(data.length < 5 ){
						//나머지 방명록 없음
						for(let i in data){						
							value2 += "<div class='GuestBook-write-wrap2'>"
										+"<div class='GuestNo' style='display : none'>" + data[i].gbNo +"</div>" 
										+ "<div class='GuestBook-writerName'> FROM. " + data[i].userName  +"</div>"
										+ "<div class='GuestBook-day-area'> DAY. " + data[i].gbDay + "</div>"
										+ "<div class='GuestBook-img-area2'><img id='GuestIMG' src='../../" + data[i].filePath  + "'></div>"
										+ "<div class='GuestBook-write-area2'><pre id='GuestBook-write'>" + data[i].gbContent +"</pre></div>"
										+ "<div class='GuestBook-checkbox'></div>"
										if(${loginUser.userNo} == data[i].gbWriter){
											value2 += "<div id='GuestBook-twoBtn'><button class='GuestBook-updateForm-btn'>수정하기</button>"
													+ "<button class='GuestBook-delete-btn'>삭제하기</button></div>"	
										}								
										value2 += "</div>" 
						}
						$('#GuestBookList-area').append(value2);
						$("#moreGBbutton").hide();
				}else{
						//방명록 있움
						
						
						for(let i in data){						
							value2 += "<div class='GuestBook-write-wrap2'>"
										+"<div class='GuestNo' style='display : none'>" + data[i].gbNo +"</div>" 
										+ "<div class='GuestBook-writerName'> FROM. " + data[i].userName  +"</div>"
										+ "<div class='GuestBook-day-area'> DAY. " + data[i].gbDay + "</div>"
										+ "<div class='GuestBook-img-area2'><img id='GuestIMG' src='../../" + data[i].filePath  + "'></div>"
										+ "<div class='GuestBook-write-area2'><pre id='GuestBook-write'>" + data[i].gbContent +"</pre></div>"
										+ "<div class='GuestBook-checkbox'></div>"
										if(${loginUser.userNo} == data[i].gbWriter){
											value2 += "<div id='GuestBook-twoBtn'><button class='GuestBook-updateForm-btn'>수정하기</button>"
													+ "<button class='GuestBook-delete-btn'>삭제하기</button></div>"	
										}								
										value2 += "</div>" 
						}
						$('#GuestBookList-area').append(value2);
						
				}		
			}
		})
	}
	$(document).on("click", "#moreGBbutton", function(){
		moregbList();
	})
	
	

	//방명록 작성
	$(document).on("click", "#GuestBook-write-btn", function(){
		if($("#GuestBook-write").val().trim() != 0 ){
			
			if($('#GuestBook-secret').is(':checked') == true){
				$('#GuestBook-secret').attr('value', "Y");
			}else{
				$('#GuestBook-secret').attr('value', "N");
			}		
			$.ajax({	
					type : "POST",
					url : "/insertGuestBook.hp",
					data : {				
						miniNo : ${minihomepyVo.miniNo},
						gbWriter : ${loginUser.userNo},
						gbContent : $("#GuestBook-write").val(),
						gbSecret : $("#GuestBook-secret").val()                          	
					},
					success : function(data){
						$("#GuestBook-write-area").html("");
						if($('#GuestBook-secret').is(':checked') == true){
							$('#GuestBook-secret').prop("checked", false)
						}
						$("#myGuestBook-home").trigger("click");			
					}
				})
		}else{
			alert("방명록을 올바르게 입력해주세요.");	
		}		
	})

	//방명록 수정(품 불러오기)
	$(document).on("click", ".GuestBook-updateForm-btn", function(){
		if(confirm("방명록을 수정하시겠습니까?")){

			var gbNo = $(this).parent().parent().children('.GuestNo').text();
			var $gbContent = $(this).parent().parent().children('.GuestBook-write-area2');
			var $gbSecret = $(this).parent().parent().children('.GuestBook-checkbox');
			var $gbBtn = $(this).parent().parent().children('#GuestBook-twoBtn');
			
			$gbBtn.html("");

			$.ajax({
				type : "POST",
					url : "/updateGuestBookForm.hp",
					data : {				
						gbNo : gbNo		                       	
					},
					success : function(result){
						
						let value = "";
							value += "<textarea id='GuestBook-write'>" + result.gbContent +"</textarea>"
						$gbContent.html(value)
					
						let value2 = "";
							if(result.gbSecret == 'Y'){
								value2 += "비밀글 체크 : <input type='checkbox' id='GuestBook-secret' checked><button id='GuestBook-update-btn'>작성하기</button>"
							}else{
								value2 += "비밀글 체크 : <input type='checkbox' id='GuestBook-secret'><button id='GuestBook-update-btn'>작성하기</button>"
							}
						$gbSecret.append(value2)			
					}
			})	
		}
	})
	//방명록 수정
	$(document).on("click", "#GuestBook-update-btn", function(){
		
		var $gbNo = $(this).parent().parent().children('.GuestNo');
		var $GuestBook_write = $(this).parent().parent().children().children('#GuestBook-write');
		var $GuestBook_Secret = $(this).parent().parent().children().children('#GuestBook-secret');
		var $GuestBook_write_wrap2= $(this).parent().parent();
	
		if($GuestBook_Secret.is(':checked') == true){
			$GuestBook_Secret.attr('value', "Y");
		}else{
			$GuestBook_Secret.attr('value', "N");
		}	

		 $.ajax({	
				type : "POST",
				url : "/updateGuestBook.hp",
				data : {				
					gbNo : $gbNo.text(),
					gbContent : $GuestBook_write.val(),
					gbSecret : $GuestBook_Secret.val()
					
				},
				success : function(data){
					//<div class='GuestBook-write-wrap2'>
					var value = "";
					value += "<div class='GuestNo' style='display : none'>" + data.gbNo +"</div>"
							+ "<div class='GuestBook-writerName'> FROM. " + data.userName  +"</div>"
							+ "<div class='GuestBook-day-area'> DAY. " + data.gbDay + "</div>"
							+ "<div class='GuestBook-img-area2'><img id='GuestIMG' src='../../" + data.filePath  + "'></div>"
							+ "<div class='GuestBook-write-area2'><pre id='GuestBook-write'>" + data.gbContent +"</pre></div>"
							+ "<div class='GuestBook-checkbox'></div>"
							+ "<div id='GuestBook-twoBtn'><button class='GuestBook-updateForm-btn'>수정하기</button>"
							+ "<button class='GuestBook-delete-btn'>삭제하기</button></div>";																		
						$GuestBook_write_wrap2.html(value)
				}
			})
	})


	//방명록 삭제
	$(document).on("click", ".GuestBook-delete-btn", function(){		
		var gbNo = $(this).parent().parent().children('.GuestNo').text();

		if(confirm("방명록을 삭제하시겠습니까?")){
			$.ajax({	
				type : "POST",
				url : "/deleteGuestBook.hp",
				data : {				
					gbNo : gbNo                     	
				},
				success : function(result){
						console.log(result)
						if(result>0){
							alert("방명록이 삭제되었습니다.")				
						}
						$("#myGuestBook-home").trigger("click");	
				}
			})
		}
	})

})
</script>
</html>