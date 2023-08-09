<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>

<style>
 		.content {
            background-color:white;
            width:1200px;
            margin:auto;
            padding : 50px;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:85%;
            margin:auto;
            padding:5%;
            background-color:white;      
        }
        table{
        	
        }
        #noticeTable{
        	margin : 10px;
        }
        #list{
        	margin : 10px;
        }
        .pagination{
        	margin-top : 5%;
        	margin-left : 57%;
        	display : block;
        }
    
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

		<c:if test="${loginUser.userId eq 'admin'}">	
		<button onclick="noticeEnrollBtn()">공지사항 작성하러 가기</button>
		</c:if>
			
			<div class="content">     
		        <div class="innerOuter">
		            <h2>공지사항</h2>
		            <div id="list">
			            <table id="noticeTable">
			            	<thead>
				                <tr>
				                    <th>No.</th>                    
				                    <th>제목</th>
				                    <th>작성자</th>
				                    <th>조회수</th>
				                    <th>작성일</th>
				                </tr>
				            </thead>
				            <tbody>     
				                <c:choose>
				                	<c:when test="${empty noticeList }">
				                		 <tr>
				                   			 <td colspan="4">게시글이 없습니다.</td>
				                		</tr>
				                	</c:when>
				                	<c:otherwise>
				                		<c:forEach var="n" items="${noticeList }">
						                <tr>
						                    <td>${n.noticeNo }</td>
						                    <td class="nno" style="display:none">${n.noticeNo }</td>
						                    <td>${n.noticeTitle}</td>
						                    <td>관리자</td>  
						                    <td>${n.noticeCount}</td>
						                    <td>${n.noticeDay }</td>
						                </tr>
					                </c:forEach>		               
				                	</c:otherwise>
				                </c:choose>
			                </tbody>				                
			            </table>
     				 </div>
     				 
   				 <!-- Pagination -->
					<div class="actions pagination">
						<c:if test="${page.currentPage eq page.maxPage }">
							<a href="#" class="disabled button large previous">Previous Page</a>
							<a href="noticeList.no?npage=${ page.currentPage +1 }" class="button large next">Next Page</a>
						</c:if>
						<c:if test="${1 < page.currentPage && page.currentPage < page.maxPage }">
							<a href="noticeList.no?npage=${page.currentPage - 1}" class="button large previous">Previous Page</a>
							<a href="noticeList.no?npage=${ page.currentPage +1 }" class="button large next">Next Page</a>
						</c:if>
						<c:if test="${ page.currentPage ne page.maxPage}">
							<a href="noticeList.no?npage=${page.currentPage - 1}" class="button large previous">Previous Page</a>
							<a href="#" class="disabled button large next">Next Page</a>
						</c:if>
						
					</div>		 
		        </div>    
	    	</div>
	
	
</body>
<script>

	function noticeEnrollBtn(){
		location.href = "/noticeEnrollForm.no"
	}
	
	$(function(){
		$("#noticeTable>tbody>tr").click(function(){
			location.href = '/noticeDetail.no?nno='+$(this).children(".nno").text();	
		})
		
	})

	
</script>
</html>