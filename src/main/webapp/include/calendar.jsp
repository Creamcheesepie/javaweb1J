<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<style >
			#td1, #td8,#td15,#td22,#td29,#td36 {color:red}
		#td7,#td14,#td21,#td28,#td35{color:blue}
		.today{
			background-color:coral;
			color:white;
			font-weight:bolder;
		}
	</style>

			<hr style="margin: 3px 0px 3px 0px; padding : 0px;">
				<div class="row">
					<div class="col ml-0 pl-0">
					
						<div class="row text-center">
							<div class="col p-0 m-0" style="font-size:12px;color:red;background-color:#e2e2e2;">일</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">월</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">화</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">수</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">목</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">금</div>
							<div class="col p-0 m-0" style="font-size:12px;color:blue;background-color:#e2e2e2;">토</div>
						</div>
						
						<div class="row"> <!-- 7주일 가로 줄맞춤 시작 -->
						
						<!-- 1주일 칸 중 표시되는 달의 처음 날짜 이전의 요일은 공백으로 처리한다. -->
						<c:set var="gap" value="1"/>
						
							<c:forEach begin="1" end="${startWeek-1}" >
								<div class="col p-0 m-0"  style="font-size:12px;background-color:#efefef">&nbsp;</div>
								<c:set var="gap" value="${gap+1}"/>
							</c:forEach>
							
							 <!-- 해당 월의ㅡ 첫째 주 날짜부터 출력하되 gap가 7이되면 줄바꿈하기 -->
							<c:forEach begin="1" end="${lastDay}" varStatus="st">
										<c:set var="sw" value="0"/>
								<c:forEach var="vo" items="${vos}">
									<c:if test="${fn:substring(vo.getherTime,8,10)==st.count && sw!='1'}}">
										<div class="col p-0 m-0"  style="font-size:12px; background-color:#0dcaf0; color:white;" id="td${gap}" >	
										<c:set var="sw" value="1"/>
									</c:if>
									<c:if test="${fn:substring(vo.getherTime,8,10)!=st.count && sw!='1'}">
										<div class="col p-0 m-0"  style="font-size:12px;background-color:#efefef" id="td${gap}" >	
										<c:set var="sw" value="1"/>
									</c:if>
								</c:forEach>
								${st.count}
								</div>
								
								
								<c:if test="${gap%7==0}">
								</div><div class="row"> <!-- 7주일 가로 줄맞춤 끝 -->
								</c:if>
								
								
								<c:set var="lastgapEnd" value="${gap%7}"/>
								<c:set var="gap" value="${gap+1}"/>
								
							</c:forEach>
							 <c:forEach begin="2" end="${lastgapEnd}">
							<div class="col p-0 m-0" style="font-size:12px;background-color:#efefef">&nbsp;</div>
							</c:forEach> 
							</div>
						</div>
					</div>
	
	