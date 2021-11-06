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
	    <a class="nav-link active" aria-current="page" href="noticeanswer.do?command=list">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="faqanswer.do?command=list">FAQ</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="qaanswer.do?command=list">Q&A</a>
	  </li>
	</ul>

	<br><br>
	<h3>&emsp;공지 작성하기</h3>
	<br>
	
	<form action="noticeanswer.do" method="post">
		<input type="hidden" name="command" value="boardwrite">
		<table border="1" align="center">
			<tr>
				<th>작성자</th>
				<td><textarea rows="1" cols="80" name="regId"></textarea></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><textarea rows="1" cols="80" name="title"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="30" cols="100" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right;">
					<input type="submit" value="작성">
					<input type="button" value="목록" onclick="location.href='noticeanswer.do?command=list'">
				</td>
			</tr>
		</table>
	
	</form>


</body>
</html>