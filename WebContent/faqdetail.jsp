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
	<h1>FAQ 상세보기</h1>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<td>${dto.faqSeq }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.regId }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.regDt }</td>
		</tr>
		<tr>
			<th>질문</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>답변</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="삭제" onclick="location.href='faqanswer.do?command=delete&faqSeq=${dto.faqSeq}'">
				<input type="button" value="수정" onclick="location.href='faqanswer.do?command=updateform&faqSeq=${dto.faqSeq}'">
				<input type="button" value="목록" onclick="location.href='faqanswer.do?command=list'">
			</td>
		</tr>
	</table>

</body>
</html>