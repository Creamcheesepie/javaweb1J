<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>${vo.nickName}님 정보</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
		'use strict'
	
		function myInfoUpdatePwdCheck(){
			let mid = $("#mid").val();
			let pwd = $("#upCheckPwd").val();
			
			if(pwd.trim()==""){
				alert("비밀번호를 입력해주세요.")
				return false;
			}
			
			$.ajax({
				type:"post",
				url:"${ctp}/myInfoUpdatePwdCheck.cp",
				data:{mid:mid,pwd:pwd},
				success : function(res){
					if(res=="1"){
						alert("비밀번호를 확인하였습니다.\n회원정보 수정화면으로 이동합니다.")
						updateForm.submit();
					}
					else{
						alert("비밀번호가 맞지 않습니다.\n다시 확인해주세요.")
					}
				},
				error:function(){
					alert("전송오류가 발생하였습니다.")
				}
			})
		}
	</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<div class="row">
			<div class="col text-center mt-3"><h2>${vo.nickName}님 정보</h2></div>
		</div>
		<form name="updateForm" method="post" action="${ctp}/memberMyInfoUpdateForm.cp">
		<div class="row mt-5"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;아이디
				<input type="text" name="mid" id="mid" value="${vo.mid}" readonly class="form-control" />
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;성명
				<input type="text" name="name" id="name" value="${vo.name}" readonly class="form-control"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;닉네임
				<input type="text" name="nickName" id="nickName" value="${vo.nickName}" readonly class="form-control" />
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;이메일
				<input type="text" name="email" id="email" value="${vo.email}" readonly class="form-control"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;전화번호
				<input type="text" name="tel" id="tel" value="${vo.tel}" readonly class="form-control"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-2">
				&nbsp;생년월일
				<input type="date" name="birthday" class="form-control" value="${fn:substring(vo.birthday,0,10)}" readonly/>
			</div>
			<div class="col-sm-2 pl-0 pr-3 ">
				&nbsp;나이
				<input type="number" name="age" id="age" value="${vo.age}" readonly class="form-control">
			</div>
			<div class="col-sm-2 pl-0 pr-3 ">
				&nbsp;성별
				<input type="text" name="gender" id="gender" value="${vo.gender}" readonly class="form-control">
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="form-group"> <!-- 주소 div 시작 -->
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
		      <label for="address">&nbsp;주소</label>
		      <input type="hidden" name="address" id="address">
		      <div class="input-group mb-1">
		        <input type="text" name="postcode" id="sample6_postcode" value="${postcode}" readonly class="form-control">
		      </div>
		     </div>
		    <div class="col-sm-3"></div> 
      </div>
      <div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
	      	<input type="text" name="roadAddress" id="sample6_address" size="50" value="${roadAddress}" readonly class="form-control mb-1">
	      </div>
				<div class="col-sm-3"></div>
	     </div>
      <div class="row">
	     <div class="col-sm-3"></div>
				<div class="col-sm-6">
	      <div class="input-group ">
	        <input type="text" name="detailAddress" id="sample6_detailAddress" value="${detailAddress}" readonly class="form-control"> &nbsp;&nbsp;
	        <div class="input-group-append">
	          <input type="text" name="extraAddress" id="sample6_extraAddress" value="${extraAddress}" readonly class="form-control">
	        </div>
	       </div>
	     <div class="col-sm-3"></div>
	    </div>
      </div>
    </div><!-- 주소 div 끝 -->
    <div class="row mt-0">
    <div class="col-sm-3"></div><div class="col-sm-6">
    라이딩 정보
    </div><div class="col-sm-3"></div>
    </div>
    <div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 input-group ">
    <input type="number" name="speed" id="speed" value="${speed}" readonly style="width:75px"/>&nbsp;km/h
    <input type="number" name="duration" id="duration" value="${duration}" readonly style="width:75px"/>&nbsp;km    
    <input type="number" name="time" id="time" value="${time}" readonly style="width:75px"/>&nbsp;시간
    <input type="number" name="power" id="power" value="${power}" readonly style="width:75px"/>&nbsp;W
    <input type="hidden" name="rideInfo" id="rideInfo" />
    </div>
    <div class="col-sm-3"></div>
    </div>
    <div class="row">
    	<div class="col-sm-3"></div>
    	<div class="col-sm-6">
    	<div class="mb-1 input-group">자기소개</div>
    		<textarea name="inst" id="inst" rows="30" style="width:100%;height:7em; resize:none" readonly> ${vo.inst}</textarea>
    	</div>
    	<div class="col-sm-3"></div>
    </div>

    <div class="row mb-2">
    	<div class="col-sm-3"></div>
    	<div class="col-sm-6">
    	<div class="mb-1">프로필 사진</div>
    		<input type="text" value="${vo.photo}" readonly><br/>
    		<img src="${ctp}/images/memberProfile/${vo.photo}" width="150px"/>
    	</div>
    	<div class="col-sm-3"></div>
    </div>
		<div class="row mt-2 text-center"> <!-- 마지막 버튼 div -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<input type="button" data-toggle="modal" data-target="#infoUpdatePwdCheckModal" value="정보수정" class="btn btn-success">
				<a href="${ctp}/" class="btn btn-warning">메인으로</a>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- 마지막 버튼 div 끝 -->
		<input type="hidden" name="updateFlag" id="updateFalg" value="ok"/> 
		</form>
		<div><!-- 모달 영역 div -->
			<div class="modal fade" id="infoUpdatePwdCheckModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- 모달 헤더 -->
			      <div class="modal-header">
			        <h4 class="modal-title">비밀번호 확인</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- 모달 바디 -->
			      <div class="modal-body">
			      	회원정보 수정 전에 다시 한번 비밀번호를 확인합니다
			      	<br/><br/>
			        비밀번호<br/>
			        <input type="password" name="upCheckPwd" id="upCheckPwd" placeholder="비밀번호를 입력하세요." class="form-control mt-2 mb-2"/>
			        <div>
			        </div>
			      </div>
		      <!-- 모달 푸터 -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-success" onclick="myInfoUpdatePwdCheck()">정보수정</button>
		        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		</div><!-- 모달 영역 div 끝 -->
		
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>