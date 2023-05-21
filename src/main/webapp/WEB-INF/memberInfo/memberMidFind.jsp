<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>아이디 찾기</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	'use strict'
	
	function emailMidFind(){
		const emailRegEx = /[\w]+@[\w]+[.]{1}[\w]/g; //이메일 정규식
		
		let email = $("#email").val();
		
		if(email.trim()==""){
			alert("이메일을 입력해 주세요");
			$("#email").focus();
		}
		else if(!emailRegEx.test(email)){
			alert("이메일을 양식에 맞게 입력해 주세요.");
			$("#email").focus();
		}
		else{
			$.ajax({
				type:"post",
				url:"${ctp}/midFinder.cp",
				data:{email:email},
				success : function(res) {
					if(res!=""){
						alert("회원님의 아이디는 "+res+"입니다.");
						
						let ans = confirm("비밀번호를 찾으러 가시겠습니까?");
						if(!ans){
							return false;
						}
						else{
							location.href="memberPwdFind.cp?mid="+res;
						}
					}
					else{
						alert("입력하신 이메일로 가입된 계정이 없습니다. \n이메일을 다시 확인해주시거나\n회원가입해주시기 바랍니다.")
					}
				},
				error : function() {
					alert("전송오류 발생");					
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
			<h3>아이디 찾기</h3>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row text-center mt-3 mb-3">
			<div class="col-sm-3"></div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
			<hr/>
			<h5>이메일 입력</h5>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row mt-3 mb-3 text-center">
			<div class="col-sm-3"></div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
			<form name="midFind">
			<input type="text" name="email" id="email" placeholder="이메일을 정확하게 입력해 주세요." class="form-control"/>
			</form>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row mt-3 text-center">
			<div class="col-sm-3"></div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
			<input type="button" value="찾기" onclick="emailMidFind()" class="btn btn-success"/>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-3"></div>
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>