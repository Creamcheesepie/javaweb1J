<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Ride together</title>
	<jsp:include page="/include/cssInitialize.jsp"/>
	<jsp:include page="/include/cssMyStyle.jsp"/>
	<style>	
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  .front_article{
  	font-size:14px;
  }
  .fBList{
  	font-size:14px;
  	padding : 0px;
  	margin : 0px;
  }
   a {  text-decoration: none;color: black;}
   
@font-face{
	font-family:'jejugothic';
	src : url('../fonts/JejuGothic.ttf') format('truetype');
}
h4 {
	font-family : 'jejugothic';
	font-weight : 800;
}
	</style>
 <jsp:include page="/include/bs4.jsp"/>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>	
	<div class="container mt-3">
		<div class="row" style="height:475px">
			<div class="col-sm-3"> <!-- 왼쪽 회원정보 표시기 // 로그인 안한 상태에선 뭐 띄움? -->
				<div class="row"> <!-- 개인정보/모임일정 표시 영역 -->
					<div class="col" style="height:200px"><!-- 개인정보 표시 영역 -->
						<c:if test="${sMid==null}">
							<h4>내 정보</h4>
							<hr/>
							로그인 해주세요!
						</c:if>
						<c:if test="${sMid!=null}">
							<h4>내 정보</h4>
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
				<div class="row mt-2">
					<div class="col" style="height:275px"><!-- 일정표 표시 영역 -->
						<h4><i class="fa-light fa-person-biking"></i>모임 일정</h4>
						<hr style="margin : 8px 0px 8px 0px"/>
						<c:forEach var="vo" items="${gvos}" varStatus="st">
							<div class="row">
								<div class="col-sm left" style="font-size:12px;">(${vo.getheringType})${vo.title}</div>
								</div>
							<div class="row">
								<div class="col-sm text-right" style="font-size:12px;">${vo.location}</div>
							</div>
							<hr style="margin : 4px 0px 4px 0px"/>
						</c:forEach>
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
		<div class="row"><!-- 하단 최신글, 일정요약 -->
			<div class="col-sm-6">
				<div class="mt-2"><!-- 최신글 영역 그리드 시작 -->
					<h4>최신글</h4> <!--  -->
					<hr style="margin:8px"/>
					<div class="row text-center mt-0">
						<div class="col-sm-1 fBList p-0 m-0">번호</div>
						<div class="col-sm-1 fBList p-0 m-0">분류</div>
						<div class="col-sm-3 fBList p-0 m-0">작성자</div>
						<div class="col-sm-5 fBList p-0 m-0">제목</div>
						<div class="col-sm-1 fBList p-0 m-0">추천</div>
						<div class="col-sm-1 fBList p-0 m-0">조회</div>
					</div>
					<hr style="margin:8px"/>
					<c:forEach var="vo" items="${bvos}" varStatus="st">
					<div class="row text-center">
							<div class="col-sm-1 align-self-center fBList p-0 m-0">${vo.idx}</div>
							<div class="col-sm-1 align-self-center fBList p-0 m-0">${vo.category}</div>
							<div class="col-sm-3 align-self-center fBList p-0 m-0">${vo.aNickName}</div>
							<div class="col-sm-5 align-self-center fBList p-0 m-0"><a href="${ctp}/boardRead.cp?idx=${vo.idx}&pageSize=10&nowPage=1">${vo.title}</a></div>
							<div class="col-sm-1 align-self-center fBList p-0 m-0">${vo.recommend}</div>
							<div class="col-sm-1 align-self-center fBList p-0 m-0">${vo.viewCnt}</div>
					</div>
					</c:forEach>
				</div><!-- 최신 글 영역 그리드 끝 -->
			</div>

			<div class="col-sm-6 mt-2"><!-- 인기글 -->
				<h4>인기글</h4> <!--  -->
					<hr style="margin:8px"/>
					<div class="row text-center mt-0">
						<div class="col-sm-1 fBList p-0 m-0">번호</div>
						<div class="col-sm-1 fBList p-0 m-0">분류</div>
						<div class="col-sm-3 fBList p-0 m-0">작성자</div>
						<div class="col-sm-5 fBList p-0 m-0">제목</div>
						<div class="col-sm-1 fBList p-0 m-0">추천</div>
						<div class="col-sm-1 fBList p-0 m-0">조회</div>
					</div>
					<hr style="margin:8px"/>
						<c:forEach var="vo" items="${bestbvos}" varStatus="st">
					<div class="row text-center">
							<div class="col-sm-1 align-self-center fBList p-0 m-0">${vo.idx}</div>
							<div class="col-sm-1 align-self-center fBList p-0 m-0">${vo.category}</div>
							<div class="col-sm-3 align-self-center fBList p-0 m-0">${vo.aNickName}</div>
							<div class="col-sm-5 align-self-center fBList p-0 m-0"><a href="${ctp}/boardRead.cp?idx=${vo.idx}&pageSize=10&nowPage=1">${vo.title}</a></div>
							<div class="col-sm-1 align-self-center fBList p-0 m-0">${vo.recommend}</div>
							<div class="col-sm-1 align-self-center fBList p-0 m-0">${vo.viewCnt}</div>
					</div>
						</c:forEach>
			</div>
			
		</div><!-- 하단 최신글, 일정요약끝  -->	
</div><!-- 인덱스 컨테이너 div 끝 -->
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>