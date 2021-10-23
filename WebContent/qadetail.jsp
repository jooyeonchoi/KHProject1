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
	<h1>글 상세보기</h1>
	
	<table border="1">
		<tr>
			<th>글 번호</th>
			<td>${dto.boardno }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.regId }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${dto.regdate }</td>
		</tr>
		<tr>
			<th>수정일</th>
			<td>${dto.moddate }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="삭제" onclick="location.href='qaanswer.do?command=delete&boardno=${dto.boardno}'">
				<input type="button" value="수정" onclick="location.href='qaanswer.do?command=updateform&boardno=${dto.boardno}'">
				<input type="button" value="목록" onclick="location.href='qaanswer.do?command=list'">
				<input type="button" value="답글" onclick="location.href='qaanswer.do?command=answerform&parentboardno=${dto.boardno}'">
			</td>
		</tr>
	</table>








</body>
</html>