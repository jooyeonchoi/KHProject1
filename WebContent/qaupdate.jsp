<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/common-head.jsp" %>

<style>
	th {text-align: center;}
	td {text-align: left;}
	
</style>

</head>
<body>
	<br><br>
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link" href="noticeanswer.do?command=list">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="faqanswer.do?command=list">FAQ</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="qaanswer.do?command=list">Q&A</a>
	  </li>
	</ul>

	<br><br>
	<h3>&emsp;글 수정하기</h3>
	<br>
	
	<form action = "qaanswer.do" method="post">
		<input type="hidden" name="command" value="boardupdate">
		<input type="hidden" name="boardno" value="${dto.boardno }">
		<table border="1" align="center">
			<tr>
				<th>작성자</th>
				<td>${dto.regId }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="hidden" name="title" value="${dto.title }">${dto.title }</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="30" cols="100" name="content">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right;">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="location.href='qaanswer.do?command=detail&boardno=${dto.boardno }'">
				</td>
			</tr>		
		</table>
		
	</form>
	
	
	
</body>
</html>