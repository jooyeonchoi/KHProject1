<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>FAQ 작성하기</h1>
	
	<form action="faqanswer.do" method="post">
		<input type="hidden" name="command" value="boardwrite">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="regId"></td>
			</tr>
			<tr>
				<th>질문</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>답변</th>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성">
					<input type="button" value="목록" onclick="location.href='faqanswer.do?command=list'">
				</td>
			</tr>
		</table>
	
	</form>





</body>
</html>