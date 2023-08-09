<script>
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
						value += "<div class='mydiaryTitle' id='mydiaryTitle" + result[i].diaryNo + "'>" + result[i].diaryTitle + "</div>"
							+ "<div class='mydiaryDay'>" + result[i].diaryDay + "</div>"
							+ "<div class='mydiaryNo' style='display:none;'>" + result[i].diaryNo + "</div>"
					}	
					$("#minihomepy-left-side").html(value);
					$("#minihomepy-left-side").append("<button id='diaryInsert'>글 적으러 가기!</button>");
					$(".mydiaryTitle").eq(0).trigger("click");
				
				}else{
					console.log("글 없는 곳")
					$("#minihomepy-left-side").html("<p>아직 글 없음</p><button id='diaryInsert'>글 적으러 가기!</button>");
					$("#minihomepy-right-side").html("<p>아직 글이 없어욤</p>");
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
					+	"<div align='center'>"
					+		"<button type='button' id='updateFormDiary'>수정하기</button>"
					+		"<button type='button' id='deleteDiary'>삭제하기</button>"
					+	"</div>"
					+"</div>";
					
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
						console.log(titleNo);
						$(titleNo).html(mydiaryDetail.diaryTitle);
						$("#minihomepy-right-side").html(value);
				}
			})	
		}
	})	

	$(document).on("click", "#deleteDiary", function(){
		if(confirm("게시글을 삭제하시겠습니까?")){
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
</script>