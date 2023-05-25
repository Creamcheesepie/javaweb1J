<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리 페이지</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
	<div class="text-center">
		<h3><a href="${ctp}/memberManagement.ad">회원관리</a></h3>
		<h3><a href="${ctp}/TAMManagement.ad">출석 한마디 관리</a></h3>
		<h3><a href="${ctp}/boardMangement.ad">게시판 관리</a></h3>
		<h3>모임관리</h3>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>