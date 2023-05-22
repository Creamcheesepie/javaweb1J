<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>출석 한마디</title>
	<style>
	.col{
	 padding-right: 0px;
    padding-left: 0px;
	}
	</style>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	'use strict'
	
	function pageCheck(){
		let pageSize = document.getElementById("pageSize").value;
		location.href="${ctp}/todayAttendMentList.cp?nowPage=${nowPage}&pageSize="+pageSize;
	}
	
	
	function TAM_writeCheck(){
		let title = $("#TAM_title").val();
		let article = $("#TAM_article").val();
		let hostIp = $("#hostIp").val();
		$.ajax({
			type:"post",
			url:"${ctp}/todayArticleWrite.cp",
			data : {title:title,article:article,hostIp:hostIp},
			success : function(res){
				if(res=="1"){
					alert("글이 등록되었습니다.");
					location.reload();
				}
				else if(res=="2"){
					alert("출석 한마디는 하루에 한 번씩 쓰실 수 있습니다.\n내일 방문하셔서 작성해 주세요!");
				}
				else{
					alert("오류가 발생하여 글이 등록되지 않았습니다.\n잠시 후 재시도 해도 오류가 반복될 경우 관리자에게 문의해주세요.")
				}
			},
			error : function(){
				alert("전송오류가 발생하였습니다.\n잠시 후 재시도 해도 오류가 반복될 경우 관리자에게 문의해주세요. ")
			}
		})
	}
	
	function openChangeModal(idx,title,article){
		$("#TAM_change_idx").val(idx);
		$("#TAM_change_title").val(title);
		$("#TAM_change_article").val(article);
		
		$('#TAM_changeModal').modal('show');
	}
	
	function TAM_changeCheck(){
		let midx = ${sMIdx};
		let	idx = $("#TAM_change_idx").val();
		let title = $("#TAM_change_title").val();
		let article = $("#TAM_change_article").val();
		
		let query={midx:midx,idx:idx,title:title,article:article};
		
		$.ajax({
			type:"post",
			url:"${ctp}/todayAttendMentChange.cp",
			data:query,
			success:function(res){
				if(res=="1"){
					alert("수정하였습니다.");
					location.reload();
				}
				else{
					alert("오류가 발생하여 수정되지 않았습니다.")
				}
			},
			error : function(){
				alert("전송오류가 발생하였습니다.\n잠시 후 재시도 해도 오류가 반복될 경우 관리자에게 문의해주세요.")
			}
		})
	} 
	
	function TAM_deleteCheck(){
		let	idx = $("#TAM_change_idx").val();
		
		let ans = confirm("정말로 삭제하시겠습니까?\n되돌릴 수 없습니다.")
		
		if(!ans){
			return false;
		}
		else{
			$.ajax({
				type:"post",
				url:"${ctp}/todayAttendMentDelete.cp",
				data:{idx:idx},
				success:function(res){
					if(res=="1"){
						alert("삭제하였습니다.");
						location.reload();
					}
					else{
						alert("오류가 발생하여 삭제되지 않았습니다.")
					}
				},
				error : function(){
					alert("전송오류가 발생하였습니다.\n잠시 후 재시도 해도 오류가 반복될 경우 관리자에게 문의해주세요.")
				}
				
			})
		}
	}
	
	
	</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<div class="text-center mt-3 mb-3" style="height:70px"><h4>출석 한마디</h4></div>
		<div class="row "><!-- 큰 한 덩어리 시작 -->			
			<div class="col-sm-2"><!-- 내 정보 표시창 -->
				<c:if test="${sMid==null}">
				<h5>로그인 하셔야</h5>
				<h5>출석하실 수 있습니다.</h5>
				</c:if>
				<c:if test="${sMid!=null}">
				<h4>내 정보</h4>
				아이디 : ${sMid}<br/>
				닉네임 : ${sNickName}<br/>
				등급 : ${sMemberGrade}<br/> <!-- 회원 등급 표시시에는 sMembergrade로, 다른 기타 함수에서 사용시에는 sLevel 사용 -->
				출석일수 : ${sTotCnt}<br/>
				</c:if>
			</div>
			<div class="col-sm-10 p-0"><!-- 게시판리스트 보여주는 공간 -->
				<div class="row mb-0 p-0 text-center"><!-- 서브 타이틀 공간 -->
					<div class="col-sm-1 align-self-center p-0"> 
					
						<select name="pageSize" id="pageSize" onchange="pageCheck()">
							<option <c:if test="${pageSize==5}">selected</c:if>>5</option>
							<option <c:if test="${pageSize==10}">selected</c:if>>10</option>
							<option <c:if test="${pageSize==15}">selected</c:if>>15</option>
							<option <c:if test="${pageSize==20}">selected</c:if>>20</option>
						</select>	
					</div>
					<div class="col-sm-2 align-self-center p-0">작성자</div>
					<div class="col-sm-2 align-self-center p-0">글제목</div>
					<div class="col-sm-4 align-self-center p-0">글내용</div>
					<div class="col-sm-2 align-self-center p-0">작성일자</div>
					<div class="col-sm-1 align-self-center p-0">
						<input type="button" value="작성" data-toggle="modal" data-target="#TAM_Modal" class="btn btn-success">
					</div>
				</div>
				<hr/>
				<c:forEach var="vo" items="${vos}" varStatus="st">
					
					<div class="row p-0 text-center">
						<div class="col-sm-1 align-self-center p-0">${vo.idx}</div>
						<div class="col-sm-2 align-self-center p-0">${vo.aNickName}(${vo.aMid})</div>
						<div class="col-sm-2 align-self-center p-0">${vo.title}</div>
						<div class="col-sm-4 align-self-center p-0"><input type="text" value="${vo.article}" readonly class="form-control"/></div>
						<div class="col-sm-2 align-self-center p-0">${fn:substring(vo.wDate,0,10)}</div>
						<div class="col-sm-1 align-self-center p-0"><c:if test="${sMid==vo.aMid}"><input type="button" value="수정" onclick="openChangeModal('${vo.idx}','${vo.title}','${vo.article}')" class="btn btn-warning"></c:if></div>
					</div>
					<hr/>
				</c:forEach>
				<div class="text-center p-0">
						<ul class="pagination text-center justify-content-center border-secondary">	
							<c:if test="${nowPage>1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/todayAttendMentList.cp?pageSize=${pageSize}&nowPage=1">첫페이지</a></li></c:if>
							<c:if test="${curBlock>0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/todayAttendMentList.cp?pageSize=${pageSize}&nowPage=${(curBlock-1)*blockSize+1}">이전블록</a></li></c:if>
							<c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
								<c:if test="${i<=totalPage && i== nowPage}"><li class="page-item active bg-secondary"><a class="page-link bg-secondary" href="#">${i}</a></li></c:if>
								<c:if test="${i<=totalPage && i!= nowPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/todayAttendMentList.cp?pageSize=${pageSize}&nowPage=${i}">${i}</a></li></c:if>
							</c:forEach>
							<c:if test="${curBlock<lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/todayAttendMentList.cp?pageSize=${pageSize}&nowPage=${(curBlock+1)*blockSize+1}">다음블록</a></li></c:if>
							<c:if test="${nowPage<totalPage}"><li class="page-item"><a class="page-link  text-secondary" href="${ctp}/todayAttendMentList.cp?pageSize=${pageSize}&nowPage=${totalPage}">마지막페이지</a></li></c:if>
						</ul>
					</div>
  			</div>
				
			</div><!-- 게시판리스트 보여주는 공간 끝 -->
			
			
		</div><!-- 회원정보+게시판리스트 덩어리 끝 -->
	</div><!-- 여기 컨테이너 끝 -->
<p><br/></p>
<div><!-- 모달 영역 div -->
<div class="modal fade" id="TAM_Modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- 모달 헤더 -->
      <div class="modal-header">
        <h4 class="modal-title">한마디 작성</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- 모달 바디 -->
      <div class="modal-body">
      	<div class="mt-2 mb-2">&nbsp;제목</div>
      	<input type="text" name="TAM_title" id="TAM_title" placeholder="제목을 입력해주세요." class="form-control">
      	<div  class="mt-2 mb-2" >&nbsp;내용</div>
        <textarea rows="5" name="TAM_article" id="TAM_article" class="form-control" style="resize:none;" placeholder="내용을 입력해주세요"></textarea>
        <input type="hidden" name="hostIp" id="hostIp" value="${pageContext.request.remoteAddr}"/>
      </div>
      <!-- 모달 푸터 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="TAM_writeCheck()">작성</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</div><!-- 모달 영역 div 끝 -->
<!-- 수정영역 모달 -->
<div><!-- 모달 영역 div -->
<div class="modal fade" id="TAM_changeModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- 모달 헤더 -->
      <div class="modal-header">
        <h4 class="modal-title">출석 한마디 수정 작성</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- 모달 바디 -->
      <div class="modal-body">
      	<div class="mt-2 mb-2">&nbsp;제목</div>
      	<input type="text" name="TAM_change_title" id="TAM_change_title" placeholder="제목을 입력해주세요." class="form-control">
      	<div  class="mt-2 mb-2" >&nbsp;내용</div>
        <textarea rows="5" name="TAM_change_article" id="TAM_change_article" class="form-control" style="resize:none;" placeholder="내용을 입력해주세요"></textarea>
        <input type="hidden" name="hostIp" id="hostIp" value="${pageContext.request.remoteAddr}"/>
        <input type="hidden" name="TAM_change_idx" id="TAM_change_idx"/>
      </div>
      <!-- 모달 푸터 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="TAM_changeCheck()">수정</button>
        <button type="button" class="btn btn-danger" onclick="TAM_deleteCheck()">삭제</button>
        <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</div><!-- 모달 영역 div 끝 -->


<jsp:include page="/include/footer.jsp"/>
</body>
</html>