<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>출석 한마디 관리</title>
	<jsp:include page="/include/bs4.jsp"/>
		<style>
		.msub{
			font-size:12px;
			font-weight:bolder;
		}
		.mm{
			font-size:12px;
		
		}
	</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<h4>출석 한마디 관리</h4>
		<hr style="margin: 4px 0px 4px 0px"/>
		<div>
			<div class="row text-center">
				<div class="col-sm-1 msub  p-0 m-0">고유번호</div>
				<div class="col-sm-2 msub  p-0 m-0">제목</div>
				<div class="col-sm-4 msub p-0 m-0">내용</div>
				<div class="col-sm-1 msub p-0 m-0">작성자Ip</div>
				<div class="col-sm-1 msub p-0 m-0">작성시간</div>
				<div class="col-sm-1 msub p-0 m-0">작성자ID</div>
				<div class="col-sm-1 msub p-0 m-0">작성자 닉네임</div>
				<div class="col-sm-1 msub p-0 m-0">&nbsp;</div>
			</div>
		</div>
		<hr style="margin : 6px 0px 6px 0px "/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<div class="row text-center">
				<div class="col-sm-1 mm p-0 m-0">${vo.idx}</div>
				<div class="col-sm-2 mm p-0 m-0">${vo.title}</div>
				<div class="col-sm-4 mm p-0 m-0">${vo.article}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.hostIp}</div>
				<div class="col-sm-1 mm p-0 m-0">${fn:substring(vo.wDate,0,16)}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.aMid}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.aNickName}</div>
				<div class="col-sm-1 mm p-0 m-0"></div>
				<div class="col-sm-1 mm p-0 m-0">&nbsp;</div>
			</div>
		</c:forEach>
	</div>

<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>