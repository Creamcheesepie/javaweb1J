<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>게시판</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
	hr{
		margin:8px 0px 8px 0px;
	}
	</style>
	<script>
	'use strict'
	
	function pageCheck(){
		let pageSize = document.getElementById("pageSize").value;
		location.href="${ctp}/boardList.cp?nowPage=${nowPage}&pageSize="+pageSize;
	}
	</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				뭐넣지?
			</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="col-sm-2"><h3>게시판</h3></div>
					<div class="col-sm-2"></div>
					<div class="col-sm-4"></div>
					<div class="col-sm-1"></div>
					<div class="col-sm-3 text-right">
					보기
					<select name="pageSize" id="pageSize" onchange="pageCheck()">
						<option <c:if test="${pageSize==10}">selected</c:if>>10</option>
						<option <c:if test="${pageSize==15}">selected</c:if>>15</option>
						<option <c:if test="${pageSize==25}">selected</c:if>>20</option>
						<option <c:if test="${pageSize==30}">selected</c:if>>30</option>
					</select>
					개
					<c:if test="${sLoginOK=='ok'}">
					<input type="button" value="글쓰기" onclick="location.href='${ctp}/boardWriteFrom.cp?nowPage=${nowPage}&pageSize=${pageSize}'" class="btn btn-success"/>
					</c:if>
					</div>
				</div>
				<div class="row text-center mt-1">
					<div class="col-sm-1">일상</div>
					<div class="col-sm-1">정보</div>
					<div class="col-sm-1">후기</div>
					<div class="col-sm-1">질문</div>
					<div class="col-sm-8"></div>
				</div>
				<hr/>
				<div class="row text-center">
					<div class="col-sm-1">번호</div>
					<div class="col-sm-1">분류</div>
					<div class="col-sm-2">작성자</div>
					<div class="col-sm-4">제목</div>
					<div class="col-sm-2">작성일자</div>
					<div class="col-sm-1">추천수</div>
					<div class="col-sm-1">조회수</div>
				</div>
				<hr/>
				<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="row text-center">
					<div class="col-sm-1 align-self-center">${vo.idx}</div>
					<div class="col-sm-1 align-self-center">${vo.category}</div>
					<div class="col-sm-2 align-self-center">${vo.aNickName}</div>
					<div class="col-sm-4 align-self-center"><a href="${ctp}/boardRead.cp?idx=${vo.idx}&pageSize=${pageSize}&nowPage=${nowPage}">${vo.title}</a></div>
					<div class="col-sm-2 align-self-center">${fn:substring(vo.wDate,0,10)}</div>
					<div class="col-sm-1 align-self-center">${vo.recommend}</div>
					<div class="col-sm-1 align-self-center">${vo.viewCnt}</div>
				</div>
				<hr/>
				</c:forEach>
				<div class="row text-center">
					<div class="col">
						<ul class="pagination text-center justify-content-center border-secondary">	
							<c:if test="${nowPage>1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardList.cp?pageSize=${pageSize}&nowPage=1">첫페이지</a></li></c:if>
							<c:if test="${curBlock>0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardList.cp?pageSize=${pageSize}&nowPage=${(curBlock-1)*blockSize+1}">이전블록</a></li></c:if>
							<c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
								<c:if test="${i<=totalPage && i== nowPage}"><li class="page-item active bg-secondary"><a class="page-link bg-secondary" href="#">${i}</a></li></c:if>
								<c:if test="${i<=totalPage && i!= nowPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardList.cp?pageSize=${pageSize}&nowPage=${i}">${i}</a></li></c:if>
							</c:forEach>
							<c:if test="${curBlock<lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardList.cp?pageSize=${pageSize}&nowPage=${(curBlock+1)*blockSize+1}">다음블록</a></li></c:if>
							<c:if test="${nowPage<totalPage}"><li class="page-item"><a class="page-link  text-secondary" href="${ctp}/boardList.cp?pageSize=${pageSize}&nowPage=${totalPage}">마지막페이지</a></li></c:if>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>