<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>게시판 관리</title>
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/include/cssMyStyle.jsp"/>
	<style>
			.msub{
			font-size:12px;
			font-weight:bolder;
		}
		.mm{
			font-size:12px;
		
		}
		body{
		 font-family : nanumBarunGothic;
		}
	</style>
	<script>
	'use strict'
	
	function boardAdminDelete(idx){
		let ans = confirm("선택하신 게시글을 삭제하시겠습니까?");
		if(!ans){
			return false
		}
		else{
			let ans = confirm("삭제하신 글은 복구되지 않습니다.\n삭제하시겠습니까?");
			if(!ans){
				return false
			}
			else{
				$.ajax({
					type:'post',
					url:'${ctp}/boardAdminDelete.ad',
					data : {idx:idx},
					success:function(){
						alert("선택하신 게시글을 삭제하였습니다.");
						location.reload();
					},
					error:function(){
						alert("전송오류가 발생하였습니다.")
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
	<h4>게시판 관리</h4>
	<hr style="margin : 6px 0px 6px 0px "/>
		<div><!-- 서브타이틀 div -->
			<div class="row text-center">
				<div class="col-sm-1 msub  p-0 m-0">글번호</div>
				<div class="col-sm-1 msub  p-0 m-0">작성자ID</div>
				<div class="col-sm-1 msub p-0 m-0">닉네임</div>
				<div class="col-sm-1 msub p-0 m-0">제목</div>
				<div class="col-sm-3 msub p-0 m-0">내용</div>
				<div class="col-sm-1 msub p-0 m-0">작성시간</div>
				<div class="col-sm-1 msub p-0 m-0">작성ip</div>
				<div class="col-sm-1 msub p-0 m-0">분류</div>
				<div class="col-sm-1 msub p-0 m-0">조회수</div>
				<div class="col-sm-1 msub p-0 m-0">추천수</div>
			</div>
		</div>
		<hr style="margin : 6px 0px 6px 0px "/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<div class="row text-center">
				<div class="col-sm-1 mm p-0 m-0">${vo.idx}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.aMid}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.aNickName}</div>
				<div class="col-sm-1 mm p-0 m-0"><a href="javascript:boardAdminDelete(${vo.idx})">${vo.title}</a></div>
				<div class="col-sm-3 mm p-0 m-0">${vo.article}</div>
				<div class="col-sm-1 mm p-0 m-0">${fn:substring(vo.wDate,0,16)}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.hostIp}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.category}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.viewCnt}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.recommend}</div>
			</div>
		<hr style="margin : 6px 0px 6px 0px "/>
		</c:forEach>
		<div class="row text-center">
					<div class="col">
						<ul class="pagination text-center justify-content-center border-secondary">	
							<c:if test="${nowPage>1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardManagement.ad?pageSize=${pageSize}&nowPage=1">첫페이지</a></li></c:if>
							<c:if test="${curBlock>0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardManagement.ad?pageSize=${pageSize}&nowPage=${(curBlock-1)*blockSize+1}">이전블록</a></li></c:if>
							<c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
								<c:if test="${i<=totalPage && i== nowPage}"><li class="page-item active bg-secondary"><a class="page-link bg-secondary" href="#">${i}</a></li></c:if>
								<c:if test="${i<=totalPage && i!= nowPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardManagement.ad?pageSize=${pageSize}&nowPage=${i}">${i}</a></li></c:if>
							</c:forEach>
							<c:if test="${curBlock<lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardManagement.ad?pageSize=${pageSize}&nowPage=${(curBlock+1)*blockSize+1}">다음블록</a></li></c:if>
							<c:if test="${nowPage<totalPage}"><li class="page-item"><a class="page-link  text-secondary" href="${ctp}/boardManagement.ad?pageSize=${pageSize}&nowPage=${totalPage}">마지막페이지</a></li></c:if>
						</ul>
					</div>
				</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>