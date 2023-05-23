<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>게시글 조회</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	'use strict'
	
	function repleCheck(){
		let mIdx = ${sMIdx};
		let bIdx = $("#boardIdx").val();
		let reple = $("#repleArticle").val();
		if(reple.trim()==""){
			alert("댓글 내용을 작성해 주세요.")
			return false;
		}
		
			
		$.ajax({
			type:'post',
			url:'${ctp}/repleWriteOk.cp',
			data : {bIdx:bIdx,mIdx:mIdx,reple:reple},
			success : function(res){
				if(res=="1"){
				alert("댓글 작성에 성공하였습니다.");
				location.reload();
				}
				else{
					alert("오류가 발생하여 댓글 작성에 실패하였습니다.");
				}
			},
			error : function(){
				alert("전송오류가 발생하였습니다.");
			}

		})	
	}
	
	
	</script>
	<style>
	
	</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<div class="row">
			<div class="col-sm-2"><!-- 사이드바 시작 -->
				사이드바
			</div><!-- 사이드바 마지막 -->
			<div class="col-sm-10"><!-- 본문부 시작 -->
				<div class="row">
					<div class="col-sm-4"><h3>게시글 조회</h3></div>
					<div class="col-sm-4"></div>
					<div class="col-sm-1"></div>
					<div class="col-sm-3 text-right">
					</div>
				</div>
				<hr/>
				<div class="row text-center"><!-- 상단 타이틀 -->
					<div class="col-sm-1 align-self-center p-0">작성자</div>
					<div class="col-sm-2 align-self-center p-0 m-0">${vo.aNickName}</div>
					<div class="col-sm-1 align-self-center p-0"><b>제목</b></div>
					<div class="col-sm-6 align-self-center p-0 m-0 text-left"><b>${vo.title}</b></div>
					<div class="col-sm-2  align-self-center text-right">분류&nbsp;:&nbsp;${vo.category}</div>
				</div><!-- 상단 타이틀 끝 -->
				<div class="row text-center mt-2"><!-- 추가정보 -->
					<div class="col-sm-1 align-self-center p-0" style="font-size:14px;">작성자 IP</div>
					<div class="col-sm-2 align-self-center p-0 m-0" style="font-size:14px;">${vo.hostIp}</div>
					<div class="col-sm-1 align-self-center p-0"></div>
					<div class="col-sm-1  p-0 m-0"></div>
					<div class="col-sm-7 align-self-center m-0 text-right" style="font-size:14px;">작성시간&nbsp;:&nbsp;${fn:substring(vo.wDate,0,16)}&nbsp;&nbsp;조회수&nbsp;&nbsp;:&nbsp;&nbsp;${vo.viewCnt}&nbsp;&nbsp;&nbsp;추천수&nbsp;&nbsp;:&nbsp;&nbsp;${vo.recommend} </div>
				</div><!-- 추가정보 끝 -->
				<hr/>
				<div class="row text-center">
					<div class="col-sm-1 p-0">내용</div>
					<div class="col-sm-10 p-0">
						<textarea rows="10" name="article" id="article" class="form-control" style="resize:none;" readonly>${vo.article}</textarea>
					</div>
					<input type="hidden" name="hostIp" id="hostIp" value="${pageContext.request.remoteAddr}"/>
				</div>
				<hr style="margin: 8px 0px 8px 0px"/>
				<div class="row text-center">
					<div class="col">
						<c:if test="${sMIdx!=vo.mIdx}">
							<input type="button" value="추천" onclick="boardRecommend()" class="btn">
						<input type="button" value="돌아가기" onclick="location.href='${ctp}/boardList.cp?pageSize=${pageSize}&nowPage=${nowPage}'" class="btn btn-info">
						</c:if>
						<c:if test="${sMIdx==vo.mIdx}">
							<form name="boardChangeIdx" method="post" action="${ctp}/boardChagneForm.cp">
							<input type="submit" value="수정" class="btn btn-success">
							<input type="hidden" name="idx" id="idx" value="${vo.idx}"/>
						<input type="button" value="돌아가기" onclick="location.href='${ctp}/boardList.cp?pageSize=${pageSize}&nowPage=${nowPage}'" class="btn btn-info">
							</form>
						</c:if>
					</div>
				</div>
				<div>
				<hr style="margin: 8px 0px 8px 0px"/>
				<h4>댓글</h4>
				<hr style="margin: 8px 0px 8px 0px"/>
				</div>
				<div class="row text-center"><!-- 댓글타이틀 영역 -->
					<div class="col"></div>
				</div><!--댓글 타이틀 끝 -->
				<c:forEach var="vo" items="${vos}" varStatus="st"><!-- 댓글 리스트 부분 -->
				<div class="row">
					<hr style="margin: 8px 0px 8px 0px">
					<div class="col">
						<div class="row mt-1 mb-2"><!-- 닉네임/작성시간 영역 -->
							<div class="col-sm-2" ><b>${vo.aNickName}</b></div>
							<div class="col-sm-10 text-right" style="font-size:12px;">${vo.wTime}</div>
						</div>
						<div class="row mb-3">
							
							<div class="col" style="font-size:14px;">${vo.reple}</div>
						</div>
					</div>
				</div>
				</c:forEach>
				<div class="row"><!-- 댓글 작성부 -->
					<div class="col-sm-10 m-0 pr-0 pl=1"><textarea rows="4.5" name="repleArticle" id="repleArticle" class="form-control" style="resize:none;"></textarea></div>
					<input type="hidden" name="boardIdx" id="boardIdx" value="${vo.idx}"/>
					<div class="col-sm-2 m-0 p-0"><input type="button" onclick="repleCheck()" value="댓글달기" class="form-control" style="height:100%"></div>
				</div>
				<div>
					<ul class="pagination text-center justify-content-center border-secondary">	
						<c:if test="${r_nowPage>1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardRead.cp?pageSize=${pageSize}&nowPage=${nowPage}&idx=${vo.idx}&r_pageSize=${r_pageSize}&r_nowPage=1">첫페이지</a></li></c:if>
						<c:if test="${r_curBlock>0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardRead.cp?pageSize=${pageSize}&nowPage=${nowPage}&idx=${vo.idx}&r_pageSize=${r_pageSize}&r_nowPage=${(r_curBlock-1)*r_blockSize+1}">이전블록</a></li></c:if>
						<c:forEach var="i" begin="${r_curBlock*r_blockSize+1}" end="${r_curBlock*r_blockSize + r_blockSize}" varStatus="st">
							<c:if test="${i<=r_totalPage && i== r_nowPage}"><li class="page-item active bg-secondary"><a class="page-link bg-secondary" href="#">${i}</a></li></c:if>
							<c:if test="${i<=r_totalPage && i!= r_nowPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardRead.cp?pageSize=${pageSize}&nowPage=${nowPage}&idx=${vo.idx}&r_pageSize=${r_pageSize}&r_nowPage=${i}">${i}</a></li></c:if>
						</c:forEach>
						<c:if test="${r_curBlock<r_lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/boardRead.cp?pageSize=${pageSize}&nowPage=${nowPage}&idx=${vo.idx}&r_pageSize=${r_pageSize}&r_nowPage=${(r_curBlock+1)*r_blockSize+1}">다음블록</a></li></c:if>
						<c:if test="${r_nowPage<r_totalPage}"><li class="page-item"><a class="page-link  text-secondary" href="${ctp}/boardRead.cp?pageSize=${pageSize}&nowPage=${nowPage}&idx=${vo.idx}&r_pageSize=${r_pageSize}&r_nowPage=${r_totalPage}">마지막페이지</a></li></c:if>
					</ul>
				</div>
			</div><!-- 본문부 바닥 -->
		</div><!-- 그리드 전체부분 마지막 -->
	</div><!-- 전체 컨테이너 마지막 -->
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>