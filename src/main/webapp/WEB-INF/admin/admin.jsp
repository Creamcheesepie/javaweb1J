<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<div class="container">
	<div class="row">
		<div class="col col-bordered"><h3>관리자페이지</h3></div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-sm-4">
			<h4><a href="${ctp}/memberManagement.ad">회원관리</a></h4>
		</div>
		<div class="col-sm-8 text-left">
			총 회원수 : ${avo.mCnt} <br/>
			등급별 회원수 <br/>
			준회원 : ${avo.l0Cnt} | 일반회원 : ${avo.l1Cnt} | 중급회원 : ${avo.l2Cnt} | 모임장 : ${avo.l3Cnt} | 운영자 : ${avo.l4Cnt} | 관리자 : ${avo.l5Cnt}<br/>
			신규회원 수 : ${avo.newMemberCnt}<br/>
			신규회원 정보(최근 5명까지 표시)<br/>
			<c:forEach var="vo" items="${anmvos}" varStatus="st">
			${vo.nmNickName}(${vo.nmMid})&nbsp;&nbsp;&nbsp;
			</c:forEach> 
		</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-sm-4">
			<h4><a href="${ctp}/TAMManagement.ad">출석 한마디 관리</a></h4>
		</div>
		<div class="col-sm-8">
			총 한마디 수 : ${tamavo.tamTCnt}<br/>
			오늘 한마디 게시 수: ${tamavo.tamTodaycCnt} | 이번 주 한마디 게시 수 : ${tamavo.tamToWeekCnt}<br/>
				최근 한마디 게시자(최근 10명까지 표시.)<br/>
			<c:forEach var="vo2" items="${vos2}" varStatus="st">
        ${vo2.twnNickName}(${vo2.twnMid})&nbsp;&nbsp;&nbsp;
			</c:forEach>
		</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-sm-4">
			<h4><a href="${ctp}/boardMangement.ad">게시판 관리</a></h4>
		</div>
		<div class="col-sm-8">
			총 게시글 수 : ${bavo.tbCnt}<br/>
			오늘 게시글 수 : ${bavo.nbDCnt} | 이번 주 게시글 수 : ${bavo.nbWCnt}<br/>
			최근 게시글<hr style="margin : 4px 0px 4px 0px"/><!-- 제목, 분류, 작성자 해서 5개정도만 띄우기 -->
			
			<c:forEach var="vo" items="${bavos}" varStatus="st">
				<div class="row">
					<div class="col-sm-3">${vo.aNickName}(${vo.aMid})</div>
					<div class="col-sm-6">${vo.title}</div>
					<div class="col-sm-3">${vo.category}</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-sm-4">
			<h4><a href="${ctp}/getheringManagement.ad">모임관리</a></h4>
		</div>
		<div class="col-sm-8">
			총 모임 횟수 : ${gavo.tgCnt}<br/>
			지난 30일간 모임 횟수 : ${gavo.mgCnt} | 지난 7일간 모임횟수 : ${gavo.wgCnt}<br> 
			향후 30일긴 모임 횟수 : ${gavo.nmgCnt} | 다음 7일간 모임횟수 : ${gavo.nwgCnt}<br> 
			오늘의 모임
			<hr style="margin : 4px 0px 4px 0px"/>
			<c:set var="flag" value="no"/>
			<c:forEach var="vo" items="${gavos}" varStatus="st">
				<span style="font-size:13px;">모임명 : ${vo.title} 모임시간 :${fn:substring(vo.getherTime,10,16)} 모임장 : ${vo.aName}(${vo.aMid}) 모임인원 : ${vo.getherJoinMember}/${vo.totalGetherMember}</span><br/>
			<c:set var="flag" value="yes"/>
			</c:forEach>
			<c:if test="${flag=='no'}">
				오늘은 모임이 없습니다.
			</c:if>
		</div>
	</div>
	<hr/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>