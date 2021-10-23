<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<col width="100">
		<col width="100">
		<col width="100">
		<tr>
			<td><a href="noticeanswer.do?command=list">공지사항</a></td>
			<td><a href="faqanswer.do?command=list">FAQ</a></td>
			<td><a href="qaanswer.do?command=list">QA</a></td>
		</tr>
	</table>

	<h1>FAQ</h1>
	
	<table border="1">
		<col width="100"><col width="300"><col width="100"><col width="100">
		<tr>
			<th>번호</th>
			<th>자주 묻는 질문</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5">================작성 된 글이 없습니다==============</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.faqSeq }</td>
						<td>
							<a href="faqanswer.do?command=detail&faqSeq=${dto.faqSeq }">${dto.title }</a>
						</td>
						<td>${dto.regId }</td>
						<td>${dto.regDt }</td>
						<td>${dto.modDt }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5">
				<input type="button" value="글쓰기" onclick="location.href='faqanswer.do?command=writeform'">
			</td>
		</tr>		
	</table>
	
</body>
</html>