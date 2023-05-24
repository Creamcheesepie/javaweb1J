<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<style >
			#td1, #td8,#td15,#td22,#td29,#td36 {color:red}
		#td7,#td14,#td21,#td28,#td35{color:blue}
		.today{
			background-color:coral;
			color:white;
			font-weight:bolder;
		}
	</style>

	<div class="row">
		<div class="col">일</div>
		<div class="col">월</div>
		<div class="col">화</div>
		<div class="col">수</div>
		<div class="col">목</div>
		<div class="col">금</div>
		<div class="col">토</div>
	</div>
	<div class="row">
	<!-- 1주일 칸 중 표시되는 달의 처음 날짜 이전의 요일은 공백으로 처리한다. -->
	<c:set var="gap" value="1"/>
		<c:forEach begin="1" end="${startWeek-1}" >
			<div class="col">&nbsp;</div>
			<c:set var="gap" value="${gap+1}"/>
		</c:forEach>
		 <!-- 해당 월의ㅡ 첫째 주 날짜부터 출력하되 gap가 7이되면 줄바꿈하기 -->
		<c:forEach begin="1" end="${lastDay}" varStatus="st">
			<c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}"/>
			<div class="col" id="td${gap}" ${todaySw==1?'class=today':''}>
			${st.count}
			</div>
			<c:if test="${gap%7==0}">
			</div><div class="row">
			</c:if>
			<c:set var="gap" value="${gap+1}"/>
		</c:forEach>
	</div>
