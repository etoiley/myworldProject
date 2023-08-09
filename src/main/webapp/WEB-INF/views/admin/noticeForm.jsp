<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항작성</title>
</head>
<script type="text/javascript" src="../../resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
	.content {
          background-color:white;
          width:1200px;
          margin:auto;
      }
      .innerOuter {
          border:1px solid lightgray;
          width:85%;
          margin:auto;
          padding:5% 5%;
          background-color:white;
      }
      table * {margin:3px;}
      table {width:100%;}
      #boardContent{
      	height : 100%;	       	    	
      }
      #textareaTd{
      	border : solid 1px rgba(160, 160, 160, 0.3);
      }

</style>
<body>
<jsp:include page="../common/header.jsp"/>
 <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>공지 작성하기</h2>
            <br>
            <form id="noticeEnrollForm" method="post" action="insertNotice.no">
            <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <table align="center">           
                    <tr>
                        <th><label for="title">제목</label></th>                     
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td colspan="2"><input type="text" id="writer" class="form-control" value="" readonly></td>
                    </tr>
                    <tr>
                    	<th>작성날짜</th>
                    	<td colspan="2"><input type="text" value=""></td>
                    </tr>
                    <tr>
                        <th><label for="BoardContent">내용</label></th>
                        <td colspan="2"><div id="textareaTd"><textarea name="noticeContent" id="noticeContent" rows="10" required></textarea></div></td>          
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" id="InsertNotice">등록하기</button>
                    <button type="reset">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
    <script type="text/javascript">
    
    	console.log(${loginUser.userNo})
    	
		 var oEditors = [];
		 nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "noticeContent",
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
			$("#InsertNotice").click(function(){
				// 에디터의 내용이 textarea에 적용
				 oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);			
			})
		})

	</script>

</body>
</html>