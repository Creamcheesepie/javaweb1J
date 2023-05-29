<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>모임관리</title>
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
	<script>
	'use strict'
	
	function getherDelete(idx,file){
		let ans = confirm("정말로 지우시겠습니까?")
		if(!ans){
			return false;
		}
		else{
			let ans = confirm("지운 모임글은 복구되지 않습니다! \n정말로 지우십니까??");
			if(!ans){
				return false;
			}
			else{
				$.ajax({
					type:"post",
					url:"${ctp}/setGetheringDelete.ad",
					data:{idx:idx,file:file},
					success:function(){
						alert("선택한 모임글을 삭제하였습니다.");
						location.reload();
					},
					error : function(){
						alert("전송오류가 발생하였습니다.");
					}
				})
			}
		}
		
	}
	</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<jsp:include page="/include/adminTopMenu.jsp"/>	
	<div class="container">
		<div class="row ">
			<div class="col">
				<h3>모임 관리</h3>	삭제하실 모임의 제목을 클릭해 주세요.		
			</div>
		</div>
		<hr style="margin : 4px 0px 4px 0px"/>
		<div class="row text-center">
			<div class="col-sm-1 msub  p-0 m-0">이름</div>		
			<div class="col-sm-1 msub  p-0 m-0">제목</div>		
			<div class="col-sm-1 msub  p-0 m-0">내용</div>		
			<div class="col-sm-1 msub  p-0 m-0">타입</div>		
			<div class="col-sm-1 msub  p-0 m-0">지역</div>		
			<div class="col-sm-1 msub  p-0 m-0">인원수</div>		
			<div class="col-sm-1 msub  p-0 m-0">gpx파일</div>		
			<div class="col-sm-1 msub  p-0 m-0">거리/획득고도</div>		
			<div class="col-sm-1 msub  p-0 m-0">상세코스</div>		
			<div class="col-sm-1 msub  p-0 m-0">모임날짜</div>		
			<div class="col-sm-1 msub  p-0 m-0">작성일</div>		
			<div class="col-sm-1 msub  p-0 m-0">작성자아이피</div>		
		</div>
		<hr style="margin : 4px 0px 4px 0px"/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<div class="row text-center">
				<div class="col-sm-1 mm  p-0 m-0">${vo.aName}(${vo.aMid})</div>		
				<div class="col-sm-1 mm  p-0 m-0"><a href="javascript:getherDelete('${vo.idx}','${vo.gpxFileName}');">${vo.title}</a></div>		
				<div class="col-sm-1 mm  p-0 m-0">${vo.content}</div>		
				<div class="col-sm-1 mm  p-0 m-0">${vo.getheringType}</div>		
				<div class="col-sm-1 mm  p-0 m-0">${vo.location}</div>		
				<div class="col-sm-1 mm  p-0 m-0">${vo.getherJoinMember}/${vo.totalGetherMember}</div>		
				<div class="col-sm-1 mm  p-0 m-0">${vo.gpxFileName}</div>		
				<div class="col-sm-1 mm  p-0 m-0">${vo.distance}km/${vo.getHeight}m</div>		
				<div class="col-sm-1 mm  p-0 m-0">${vo.detailCourse}</div>		
				<div class="col-sm-1 mm  p-0 m-0">${fn:substring(vo.getherTime,0,16)}</div>		
				<div class="col-sm-1 mm  p-0 m-0">${fn:substring(vo.wDate,0,10)}</div>		
				<div class="col-sm-1 mm  p-0 m-0">${vo.hostIp}</div>		
			</div>
			<hr style="margin : 4px 0px 4px 0px"/>
		</c:forEach>
		<!-- 페이지 처리 선택자 -->
				<div class="row text-center mt-3">
					<div class="col">
						<ul class="pagination text-center justify-content-center border-secondary">	
							<c:if test="${nowPage>1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/getheringManagement.ad?pageSize=${pageSize}&nowPage=1">첫페이지</a></li></c:if>
							<c:if test="${curBlock>0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/getheringManagement.ad?pageSize=${pageSize}&nowPage=${(curBlock-1)*blockSize+1}">이전블록</a></li></c:if>
							<c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
								<c:if test="${i<=totalPage && i== nowPage}"><li class="page-item active bg-secondary"><a class="page-link bg-secondary" href="#">${i}</a></li></c:if>
								<c:if test="${i<=totalPage && i!= nowPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/getheringManagement.ad?pageSize=${pageSize}&nowPage=${i}">${i}</a></li></c:if>
							</c:forEach>
							<c:if test="${curBlock<lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/getheringManagement.ad?pageSize=${pageSize}&nowPage=${(curBlock+1)*blockSize+1}">다음블록</a></li></c:if>
							<c:if test="${nowPage<totalPage}"><li class="page-item"><a class="page-link  text-secondary" href="${ctp}/getheringManagement.ad?pageSize=${pageSize}&nowPage=${totalPage}">마지막페이지</a></li></c:if>
						</ul>
					</div>
				</div>
		<!-- 페이지 처리부 끝 -->
		
		
		
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>