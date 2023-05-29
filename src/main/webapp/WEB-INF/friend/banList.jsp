<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>차단목록</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	'use strict'
	function banCancleOk(fIdx,mIdx){
		let ans = confirm("차단을 해제하시겠습니까?");
		
		if(!ans){
			return false;
		}
		else{
			$.ajax({
				type:"post",
				url:"${ctp}/banCancleOk.cp",
				data:{fIdx:fIdx,mIdx:mIdx},
				success:function(){
					alert("정상적으로 차단해제하였습니다.")
					location.reload();
				},
				error : function(){
					alert("전송오류가 발생하였습니다.")
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
		<div class="row">
			<div class="col-2">
				<div><a href="${ctp}/friendList.cp">친구목록</a></div>
				<div>차단목록</div>
			</div>
			<div class="col-10"><!-- 리스트 부분 -->
				<div class="row">
					<div class="col">
						<h3>차단목록</h3>				
					</div>
				</div>
				<div class="row">
					<div class="col-2">닉네임(아이디) </div>
					<div class="col-4">차단사유</div>
					<div class="col-2">차단해제</div>					
				</div>
				<div class="row">
					<div class="col-8">
					<hr style="margin:4px 0px 4px 0px"/>
					</div>
				</div>
				<c:set var="sw" value="false"/>
				<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="row">
					<div class="col-2">${vo.nickName}(${vo.mid})</div>
					<div class="col-4"></div>
					<div class="col-2"><input type="button" name="banCancle" id="banCancle" onclick="banCancleOk('${vo.idx}','${sMIdx}')" value="해제"></div>
				<c:set var="sw" value="true"/>
				</div>
				<div class="row">
					<div class="col-8">
					<hr style="margin:4px 0px 4px 0px"/>
					</div>
				</div>
				</c:forEach>
				<div class="row">
					<div class="col">
					<c:if test="${sw==false}">
					차단하신 유저가 없습니다.
					</c:if>
					</div>
				</div>
			</div><!-- 리스트 부분 끝 -->
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>