<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	'use strict'
	let pwdChecked="no";
	
	
		
		function resetPwdOk(){ //비밀번호 변경
		
			let femail = $("#femail").val();
			let fmid = $("#fmid").val();
			let resetPwd = $("#resetPwd").val();
			let resetPwdCheck = $("#resetPwdCheck").val();
			
			const pwdRegEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/g;
			
			if(resetPwd.trim()==""){
				alert("비밀번호를 입력해주세요.");
				$("#resetPwd").focus();
				return false;
			}
			else if(!pwdRegEx.test(resetPwd)){
				alert("비밀번호는 영문 대소문자에 특수문자 1개 이상,8글자 이상으로 입력해주세요!");
				$("#resetPwd").focus();
				return false;
			}
			else if(resetPwdCheck.trim()==""){
				alert("비밀번호 확인 창에 다시 입력해주세요.");
				$("#resetPwdCheck").focus();
				return false;
			}
			else if(resetPwd!=resetPwdCheck){
				alert("비밀번호가 서로 다릅니다. 다시 확인해주세요.");
				$("#resetPwdCheck").focus();
				return false;
			}
			else if(pwdChecked=="ok" && resetPwd==resetPwdCheck){
			
				$.ajax({
					type:"post",
					url:"${ctp}/memberPwdResetOk.cp",
					data:{mid:fmid,resetPwd:resetPwd},
					success:function(res){
						if(res=="1"){
							alert=("비밀번호를 새로 설정하는데 성공하였습니다. \n새로운 비밀번호로 로그인해주세요.");
							location.href="${ctp}/";
						}
						else if(res=="2"){
							alert("이전에 입력하신 비밀번호와 동일한 비밀번호입니다. \n새로운 비밀번호를 입력하세요.");
							return false;
						}
						else{
							alert("오류가 발생하여 비밀번호가 수정되지 않았습니다.");
							return false;
						}
					},
					error:function(res){
						alert("전송오류가 발생하였습니다.")
					}
				})
			}
		}
		

		function pwdResetCheck(){
			let femail = $("#femail").val();
			let fmid = $("#fmid").val();
			
			if(femail==""){
				alert("이메일을 입력해주세요.");
				$("#femail").focus();
			}
			else if(fmid==""){
				alert("아이디를 입력해주세요");
				$("#mid").focus();
			}
			else{
				$.ajax({
					type:"post",
					url:"${ctp}/memberPwdResetCheck.cp",
					data:{email:femail,mid:fmid},
					success:function(res){
						if(res=="1"){
							let ans = confirm("해당 이메일과 아이디로 가입된 계정을 찾았습니다.\n보안을 위해 비밀번호를 변경해야합니다.\n비밀번호를 초기화 하시겠습니까?");
							if(!ans){
								return false;
							}
							else{
								pwdChecked="ok";
								//jQuery.noConflict();
								$('#pwdResetModal').modal('show');
							}
						}
						else{
							alert("해당 이메일과 아이디로 회원가입된 계정이 없습니다.\n다시 한 번 확인해주세요.");
						}
					},
					error:function(){
						alert("전송오류가 발생하였습니다.\n잠시 후 시도해주세요.\n같은 오류가 지속되면 운영자나 관리자에게 연락해주세요.");
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
		<div class="row mt-3 text-center">
			<div class="col-sm-3"></div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
			<h4>비밀번호 찾기</h4>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row text-center mt-3 mb-3">
			<div class="col-sm-3"></div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
			<hr/>
			<h5>아이디 입력</h5>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row mt-3 mb-3 text-center">
			<div class="col-sm-3"></div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
			<input type="text" name="fmid" id="fmid" placeholder="아이디를 정확하게 입력해 주세요." value="${mid}" class="form-control"/>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row text-center mt-3 mb-3">
			<div class="col-sm-3"></div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
			<h5>이메일 입력</h5>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row mt-3 mb-3 text-center">
			<div class="col-sm-3"></div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
			<input type="text" name="femail" id="femail" placeholder="이메일을 정확하게 입력해 주세요." class="form-control"/>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row mt-3 text-center">
			<div class="col-sm-3"></div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
			<input type="button" value="찾기" onclick="pwdResetCheck()" class="btn btn-success"/>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
	</div>
<p><br/></p>

<div><!-- 모달 영역 div -->
<div class="modal fade" id="pwdResetModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- 모달 헤더 -->
      <div class="modal-header">
        <h4 class="modal-title">비밀번호 초기화</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- 모달 바디 -->
      <div class="modal-body">
      	저희는 회원님의 비밀번호를 알 수 없게 보관합니다.<br/>
      	상기한 이유로 비밀번호를 초기화 하여야 합니다.<br/>
      	<div class="mt-2">
	        비밀번호 <br/>
	        <input type="password" name="resetPwd" id="resetPwd" placeholder="비밀번호를 입력하세요." class="form-control mt-2 mb-2"/>
	        비밀번호 확인<br/>
	        <input type="password" name="resetPwdCheck" id="resetPwdCheck" placeholder="비밀번호를 다시 입력하세요." class="form-control mt-2 mb-2"/>
				</div>
      </div>

      <!-- 모달 푸터 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="resetPwdOk()">초기화</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
</div><!-- 모달 영역 div 끝 -->

<jsp:include page="/include/footer.jsp"/>
</body>
</html>