<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>친구목록</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<div class="row">
			<div class="col-2">
				<div>친구목록</div>
				<div><a href="${ctp}/BanList.cp">차단목록</a></div>
			</div>
			<div class="col-10"><!-- 리스트 부분 -->
				<div class="row">
					<div class="col">
						<h3>친구목록</h3>				
					</div>
				</div>
				<hr style="margin:4px 0px 4px 0px"/>
				<div class="row">
					<div class="col-2">닉네임(아이디) </div>
					<div class="col-1">이름</div>
					<div class="col-1">나이</div>
					<div class="col-1">성별</div>
					<div class="col-2">라이딩정보</div>
					<div class="col-2">전화번호</div>
					<div class="col-2">이메일</div>
				</div>
				<hr style="margin:4px 0px 4px 0px"/>
				<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="row">
					<div class="col-2">${vo.nickName}(${vo.mid}) </div>
					<div class="col-1">${vo.name}</div>
					<div class="col-1">${vo.age}</div>
					<div class="col-1">${vo.gender}</div>
					<div class="col-2">${vo.rideInfo}</div>
					<div class="col-2">${vo.tel}</div>
					<div class="col-2">${vo.email}</div>
				</div>
				</c:forEach>
			</div><!-- 리스트 부분 끝 -->
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>