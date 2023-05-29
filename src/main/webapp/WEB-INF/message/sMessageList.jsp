<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>쪽지함</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	'use strict'
	
	function nickNameSearch(){
		let findNick = $("#findNickIn").val();
		$.ajax({
			type:"post",
			url:"${ctp}/findNick.cp",
			data:{fNick:findNick},
			success : function(res){
				if(res=="1"){
					let ans = confirm("검색하신 닉네임을 찾았습니다. 해당 사용자에게 쪽지를 보내십니까?");
					if(!ans){
						return false;
					}
					else{
						$("#sendNick").val(findNick);
						$("#sTarget").text(findNick);
					}
					
				}
				else{
					alert("검색하신 닉네임을 찾지 못하였습니다. 다시 확인해 주세요.");
				}
			},
			error : function(){
				alert("전송오류가 발생하였습니다.")
			}
		})
	}
	
	function messageSendOk(sIdx){
		let sNick = $("#sendNick").val();
		let content	= $("#content").val();
		let mType = $("#mType").val();
		let title = $("#title").val();
		
		$.ajax({
			type:"post",
			url:"${ctp}/sendMessageOk.cp",
			data:{sNick:sNick,content:content,mType:mType,sIdx:sIdx,title:title},
			success : function(res){
				alert("쪽지를 보냈습니다");
				location.reload();
			},
			error : function(){
				alert("전송오류가 발생하였습니다.")
			}
		})
		
	}
	
	function resetSend(){
		$("#findNickIn").val("");
		$("#sendNick").val("");
		$("#sTarget").text("");
		
	}
	
	function viewMessage(sNick,sMid,title,content,vrDate,idx){
		$("#vNN").text(sNick);
		$("#viewMid").text(sMid);
		$("#sDate").text(vrDate);
		$("#viewTitle").text(title)
		$("#viewContent").text(content)
		
		$('#messageViewModal').modal('show');
		
		
	}
		
		
		</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<div class="row text-center">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="row">
					<div class="col"></div>
					<div class="col">
						<h3>보낸 쪽지함</h3>
						<hr/>
					</div>
					<div class="col"></div>
				</div>
				<div class="text left">
				<a href="messageList.cp">받은 쪽지함</a> | 보낸 쪽지함
				</div>
				<div class="row text-right mb-2">
					<div class="col-sm-10"></div>
					<div class="col-sm-2 text-right">
					<input type="button" class="form-control" data-toggle="modal" data-target="#sendMessage" value="쪽지 보내기">
					</div>
				</div>
				<div class="row text-center">
					<div class="col-2">받은 이</div>
					<div class="col-5">제목</div>
					<div class="col-1">종류</div>
					<div class="col-2">보낸시간</div>
					<div class="col-2">읽음여부</div>
				</div>
				<hr/>
				<c:set var="sw" value="false"/>
				<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="row text-center">
					<div class="col-2">${vo.sNickName}(${vo.sMid})</div>
					<div class="col-4">
						<a href="javascript:viewMessage('${vo.sNickName}','${vo.sMid}','${vo.title}','${vo.content}','${vo.sDate}','${vo.idx}')">${vo.title}</a>
					</div>
					<div class="col-2">
						<c:if test="${vo.messageType==0}">공지</c:if>
						<c:if test="${vo.messageType==1}">알림</c:if>
						<c:if test="${vo.messageType==2}">친구신청</c:if>
						<c:if test="${vo.messageType==3}">잡담</c:if>
						<c:if test="${vo.messageType==4}">문의</c:if>
						<c:if test="${vo.messageType==5}">신고</c:if>
					</div>
					<div class="col-2">${fn:substring(vo.sDate,0,16)}</div>
					<div class="col-2">
						<c:if test="${vo.rCheck==0}">미확인</c:if>
						<c:if test="${vo.rCheck==1}">확인</c:if>
					</div>
				</div>
				<c:set var="sw" value="true"/>
				</c:forEach>
				<div class="row">
					<div class="col"><c:if test="${sw==false}">현재 보낸 쪽지가 없습니다</c:if></div>
				</div>
				<div class="row text-center">
					<div class="col">
						<ul class="pagination text-center justify-content-center border-secondary">	
							<c:if test="${nowPage>1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/sMessageList.cp?pageSize=${pageSize}&nowPage=1&category=${category}">첫페이지</a></li></c:if>
							<c:if test="${curBlock>0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/sMessageList.cp?pageSize=${pageSize}&nowPage=${(curBlock-1)*blockSize+1}&category=${category}">이전블록</a></li></c:if>
							<c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
								<c:if test="${i<=totalPage && i== nowPage}"><li class="page-item active bg-secondary"><a class="page-link bg-secondary" href="#">${i}</a></li></c:if>
								<c:if test="${i<=totalPage && i!= nowPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/sMessageList.cp?pageSize=${pageSize}&nowPage=${i}&category=${category}">${i}</a></li></c:if>
							</c:forEach>
							<c:if test="${curBlock<lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/sMessageList.cp?pageSize=${pageSize}&nowPage=${(curBlock+1)*blockSize+1}&category=${category}">다음블록</a></li></c:if>
							<c:if test="${nowPage<totalPage}"><li class="page-item"><a class="page-link  text-secondary" href="${ctp}/sMessageList.cp?pageSize=${pageSize}&nowPage=${totalPage}&category=${category}">마지막페이지</a></li></c:if>
						</ul>
					</div>
				</div>
			</div><!-- 쪽지 목록 전제부분 마지막  -->
			<div class="col-sm-1"></div>
		</div>
	</div>
	<!-- 쪽지 보내기 모달 -->
	<!-- The Modal -->
<div class="modal" id="sendMessage">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">쪽지 보내기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        닉네임 검색
        <div class="input-group mb-3">
				  <input type="text" class="form-control" id="findNickIn" placeholder="닉네임을 검색해주세요">
				  <div class="input-group-append">
				    <button class="btn btn-success" onclick="nickNameSearch()">찾기</button>
				  </div>
				</div>
				<div class="mb-2">
				대상 :<span id="sTarget"></span>
				</div>
				<div class="input-group mb-3">
					<input type="text" name="title" id="title" placeholder="제목을 입력해 주세요." class="form-control">
					<input type="hidden" id="sendNick" name="sendNick"/>				
					<div>
						<select id="mType" class="form-control input-group-append">
								<option value="3">잡담</option>
								<option value="2">친구신청</option>
								<option value="4">문의</option>
								<c:if test="${sLevel>3}">
									<option value="1">알림</option>
								</c:if>
						</select>
					</div>
				</div>
				<div>
				<textarea rows="6" id="content" name="content" style="width:100%"></textarea>
				</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="messageSendOk('${sMIdx}')" >전송</button>
        <button type="button" class="btn btn-danger" onclick="resetSend()" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
	
	<!-- 쪽지 확인부분 모달 -->
<!-- The Modal -->
<div class="modal" id="messageViewModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">쪽지 확인</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        보낸사람 :<span id="vNN"></span>(<span id="viewMid"></span>)<br/>
        제목 : <span id="viewTitle"></span><br/>
        보낸시간 : <span id="sDate"></span><br/>
        내용
        <textarea rows="6" id="viewContent" style="width:100%"></textarea>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>

    </div>
    <div class="col-sm-2"></div>
  </div>
</div>	
	
	
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>