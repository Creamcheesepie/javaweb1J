<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>모임일정</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<div class="row"><!-- 가로로 크게 두 공간을 나누기 위한 영역 -->
			<div class="col-sm-2"><!-- 왼쪽 사이드바 영역 -->
				<div class="row">
					<div class="col">
						회원정보 영역
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col">
					일정표 영역
					</div>
				</div>
			</div><!-- 사이드바 영역끝 -->
			<div class="col-sm-10"><!-- 오른쪽 모임정보 영역 -->
				<div class="row">
					<div class="col text-left"><h3>모임일정</h3></div>
				</div>
				<hr/>
				<%-- <c:forEach var="vo" items="vos" > --%>
				<div class="row">
					<div class="col-sm-1 p-0" style="font-size:12px;">충청북도 청주</div>
					<div class="col-sm-3 p-0" style="font-size:12px;"></div>
				</div>
				<div class="row">
					<div class="col-sm-10 text-left m-0 p-0" style="font-size:20px;">2023-04-15 15:00&nbsp;&nbsp;<b>(친목)&nbsp;봄의 절정기 라이딩</b></div>
					<div class="col-sm-2 text-right m-0 p-0">모임장 : 모임장 명</div>
				</div>
				<div class="row">
					<div class="col" style="font-size:18px;">봄의 절정이라는 4월, 꽃과 함께 가벼운 친목 라이딩 하실 분 구합니다.</div>
				</div>
				<div class="row text-right">
					<div class="col align-self-center">
					거리:100km 인원수 :n/n </div>
				</div>
				<div class="row text-left" style="font-size:12px;">
					<div class="col-sm-4 align-self-end">
					작성시간 : 2023-04-01 작성자IP:192.127.0.1
					</div>
					<div class="col-sm-8 text-right">
					<input type="button" value="gpx파일 다운로드" class="btn btn-primary">
					<input type="button" value="참여" class="btn btn-success">
					</div>
				</div>
				<hr/>
				<%-- </c:forEach> --%>
			</div><!--오른쪽 모임정보 영역 끝 -->
		</div><!-- 가로로 크게 두 공간을 나누기위한 영역 -->
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>