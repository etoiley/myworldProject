<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세내용</title>
</head>
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
        
        	min-height : 400px;
        }

</style>
<body>
<jsp:include page="../common/header.jsp"/>
 <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>공지사항</h2>
            <br>    
            <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <table align="center">           
                    <tr>
                        <th><label for="title">제목</label></th>                     
                        <td>${noticeVo.noticeTitle}</td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td colspan="2">관리자</td>
                    </tr>
                    <tr>
                    	<th>작성날짜</th>
                    	<td colspan="2">${noticeVo.noticeDay}</td>
                    </tr>
                    <tr>
                        <th><label for="BoardContent">내용</label></th>
                        <td colspan="2"><div id="textareaTd">${noticeVo.noticeContent}</div></td>          
                    </tr>
                </table>
                <br>
                <c:if test="${loginUser.userId eq 'admin'}">	
                    <div align="center">
                        <button onclick="noticeFormSubmit(1)">수정하기</button>
                        <button onclick="noticeFormSubmit(2)">삭제하기</button>
                </div> 
                </c:if>
               <form method="post" action="" id="noticeForm">
            	<input type="hidden" name="noticeNo" value="${noticeVo.noticeNo }">              	
              </form>     
        </div>   
    </div>
<script>
		function noticeFormSubmit(num){
			if(num == 1){//수정
				$("#noticeForm").attr("action", "updateNoticeDetail.no").submit();
			}else{//삭제
				if(confirm("게시글을 삭제하시겠습니까?")){
					$("#noticeForm").attr("action", "deleteNotice.no").submit();
				}			
			}
		}

</script>   
  
    


</body>
</html>