<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Ride together</title>
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/include/cssInitialize.jsp"/>
	<style>	
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  .front_article{
  	font-size:14px;
  }
  
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>	
	<div class="container mt-3">
		<div class="row" style="height:475px">
			<div class="col-sm-3"> <!-- 왼쪽 회원정보 표시기 // 로그인 안한 상태에선 뭐 띄움? -->
				<div class="row"> <!-- 개인정보/모임일정 표시 영역 -->
					<div class="col" style="height:200px"><!-- 개인정보 표시 영역 -->
						<c:if test="${sMid==null}">
							<h4>회원정보</h4>
							<hr/>
							로그인 해주세요!
						</c:if>
						<c:if test="${sMid!=null}">
							<h4>회원정보</h4>
							<hr/>
							<div name="memberInfo" id="memberInfo">
							아이디 : ${sMid}<br/>
							닉네임 : ${sNickName}<br/>
							등급 : ${sMemberGrade}<br/> <!-- 회원 등급 표시시에는 sMembergrade로, 다른 기타 함수에서 사용시에는 sLevel 사용 -->
							출석일수 : ${sTotCnt}<br/>
							이전접속시간 : ${sLastVisit}
							<br/>
							<!-- 일단 여기까지 표시해놓고 필요에 따라 데이터 표시 추가. -->
							</div>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col" style="height:275px"><!-- 일정표 표시 영역 -->
						<p>모임 일정</p>
						<hr/>
						
					</div><!-- 일정표 표시 영역 끝 -->
				</div>
			</div><!-- 개인정보/모임일정 표시 영역끝 -->
			<div class="col-sm-9" > <!-- 카로셀 이미지 표시 영역 시작 -->
			<div id="demo" class="carousel slide" data-ride="carousel"><!-- 카로셀 -->
			  <!-- 아래 항목 표시기 -->
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			    <li data-target="#demo" data-slide-to="2"></li>
			  </ul>
			  <!-- 슬라이드 쇼 이미지 -->
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="${ctp}/images/mainSlides/resized1.jpg" alt="MTB" >
			    </div>
			    <div class="carousel-item">
			      <img src="${ctp}/images/mainSlides/resized2.jpg" alt="하이브리드" >
			    </div>
			    <div class="carousel-item">
			      <img src="${ctp}/images/mainSlides/resized3.jpg" alt="로드바이크" >
			    </div>
			  </div>
			  
			  <!-- 왼쪽 오른쪽 버튼 -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			</div><!-- 카로셀 끝 -->
			</div><!-- 카로셀 그리드 영역 끝 -->
		</div>
		<div class="mt-2"><!-- 최신글 영역 그리드 시작 -->
		<h2>최신글</h2> <!--  -->
		<hr style="margin:8px"/>
		<div class="row text-center mt-0">
			<div class="col-sm-1 front_article">번호</div>
			<div class="col-sm-1 front_article">카테고리</div>
			<div class="col-sm-2 front_article">작성자</div>
			<div class="col-sm-5 front_article">제목</div>
			<div class="col-sm-1 front_article">추천</div>
			<div class="col-sm-1 front_article">작성시간</div>
			<div class="col-sm-1 front_article">조회</div>
		<hr/>
		</div>
		<div>
			<c:forEach var="vo" items="${vos}" varStatus="st">
			</c:forEach>
		</div>
	</div><!-- 최신 글 영역 그리드 끝 -->
</div><!-- 인덱스 컨테이너 div 끝 -->
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>