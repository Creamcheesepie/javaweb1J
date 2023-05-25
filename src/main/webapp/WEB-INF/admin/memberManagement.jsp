<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원 관리</title>
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
		font-family : 'nanumBarunGothic';
		}
	</style>
	<script>
		'use strict'
		
		function memberLevelChange(value,idx){
			let curlevel = $("#curlevel").val();
			let ans = confirm("회원의 등급을 변경하시겠습니까?");
			if(!ans){
				return false;
			}
			else{
				$.ajax({
					type:"post",
					url:"setUserlevelCahnge.ad",
					data:{idx:idx,level:value},
					success:function(){
						alert("대상 회원의 등급을 변경하였습니다.");
						location.reload();
					},
					error:function(){
						alert("전송오류가 발생하였습니다.");
					}
					
				})
			}
			
		}
		
	</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<jsp:include page="/include/adminTopMenu.jsp"/>		
	<div class="container">
		<h4>회원 관리</h4>
		<hr style="margin : 6px 0px 6px 0px "/>
		<div><!-- 서브타이틀 div -->
			<div class="row text-center">
				<div class="col-sm-1 msub  p-0 m-0">회원번호</div>
				<div class="col-sm-1 msub  p-0 m-0">아이디</div>
				<div class="col-sm-1 msub p-0 m-0">이름</div>
				<div class="col-sm-1 msub p-0 m-0">닉네임</div>
				<div class="col-sm-1 msub p-0 m-0">전화번호</div>
				<div class="col-sm-1 msub p-0 m-0">생일</div>
				<div class="col-sm-1 msub p-0 m-0">나이&nbsp;&nbsp;&nbsp;&nbsp;성별</div>
				<div class="col-sm-1 msub p-0 m-0">등급</div>
				<div class="col-sm-1 msub p-0 m-0">방문횟수</div>
				<div class="col-sm-1 msub p-0 m-0">오늘방문일수</div>
				<div class="col-sm-1 msub p-0 m-0">가입일자</div>
				<div class="col-sm-1 msub p-0 m-0">탈퇴여부</div>
			</div>
		</div>
		<hr style="margin : 6px 0px 6px 0px "/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<div class="row text-center">
				<div class="col-sm-1 mm p-0 m-0">${vo.idx}<input type="hidden" name="midx" id="midx" value='${vo.idx}'></div>
				<div class="col-sm-1 mm p-0 m-0">${vo.mid}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.name}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.nickName}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.tel}</div>
				<div class="col-sm-1 mm p-0 m-0">${fn:substring(vo.birthday,0,10)}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.age}&nbsp;&nbsp;&nbsp;&nbsp;${vo.gender}</div>
				<div class="col-sm-1 mm p-0 m-0">
					<input type="hidden" name="curlevel" id="curlevel" value='${vo.level}'>
					<c:if test="${vo.level!=5}">
					<select onchange="memberLevelChange(this.value,'${vo.idx}')" name="levelChange">
						<option value='0'<c:if test="${vo.level==0}">selected</c:if>>0:준회원</option>
						<option value='1'<c:if test="${vo.level==1}">selected</c:if>>1:정회원</option>
						<option value='2'<c:if test="${vo.level==2}">selected</c:if>>2:중급회원</option>
						<option value='3'<c:if test="${vo.level==3}">selected</c:if>>3:모임장</option>
						<option value='4'<c:if test="${vo.level==4}">selected</c:if>>4:운영자</option>
					</select>
					</c:if>
					<c:if test="${vo.level==5}">
						5:관리자
					</c:if>
				</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.totCnt}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.todayCnt}</div>
				<div class="col-sm-1 mm p-0 m-0">${fn:substring(vo.signInDate,0,16)}</div>
				<div class="col-sm-1 mm p-0 m-0">${vo.memberDel}</div>
			</div>
		</c:forEach>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>