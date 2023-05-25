<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원 관리</title>
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
		<h4>회원 관리</h4>
		<hr/>
		<div><!-- 서브타이틀 div -->
			<div class="row text-center">
				<div class="col-sm-1 msub  p-0 m-0">회원번호</div>
				<div class="col-sm-1 msub  p-0 m-0">아이디</div>
				<div class="col-sm-1 msub p-0 m-0">이름</div>
				<div class="col-sm-1 msub p-0 m-0">닉네임</div>
				<div class="col-sm-1 msub p-0 m-0">전화번호</div>
				<div class="col-sm-1 msub p-0 m-0">생일</div>
				<div class="col-sm-1 msub p-0 m-0">나이</div>
				<div class="col-sm-1 msub p-0 m-0">성별&nbsp;&nbsp;&nbsp;&nbsp;등급</div>
				<div class="col-sm-1 msub p-0 m-0">방문횟수</div>
				<div class="col-sm-1 msub p-0 m-0">오늘방문일수</div>
				<div class="col-sm-1 msub p-0 m-0">가입일자</div>
				<div class="col-sm-1 msub p-0 m-0">탈퇴여부</div>
			</div>
		</div>
		<hr style="margin : 6px 0px 6px 0px "/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<div class="row text-center">
				<div class="col-sm-1 mm p-0 m-0">${vo.idx}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.mid}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.name}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.nickName}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.tel}</div>
				<div class="col-sm-1 mm p-0 m-0">${fn:substring(vo.birthday,0,10)}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.age}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.gender}&nbsp;&nbsp;&nbsp;&nbsp;${vo.level}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.totCnt}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.todayCnt}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.signInDate}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.memberDel}</div>
			</div>
		</c:forEach>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>