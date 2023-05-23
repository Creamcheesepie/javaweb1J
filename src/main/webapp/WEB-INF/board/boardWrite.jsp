<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>게시글 작성</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	
	function boardWriteCheck(){
		
		let title = $("#title").val();
		let article = $("#article").val();
		
		if(title.trim()==""){
			alert("제목을 작성해 주세요.")
			$("#title").focus();
			return false;
		}
		if(article.trim()==""){
			alert("내용을 작성해 주세요.")
			$("#article").focus();
			return false;
		}
		
		
		else{
			boardWriteForm.submit();
		}
		
	}
	</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				사이드바
			</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="col-sm-4"><h3>게시글 작성</h3></div>
					<div class="col-sm-4"></div>
					<div class="col-sm-1"></div>
					<div class="col-sm-3 text-right">
					</div>
				</div>
				<hr/>
				<form name="boardWriteForm" id="boardWriteForm" method="post" action="${ctp}/boardWriteOk.cp?nowPage=${nowPage}&pageSize=${pageSize}">
				<div class="row text-center"><!-- 상단 타이틀 입력 -->
					<div class="col-sm-1 align-self-center p-0">작성자</div>
					<div class="col-sm-2 align-self-center p-0 m-0"><input type="text" name="nickName" id="nickName" value="${sNickName}" readonly class="form-control"></div>
					<div class="col-sm-1 align-self-center p-0">제목</div>
					<div class="col-sm-5  p-0 m-0"><input type="text" name="title" id="title" placeholder="제목을 입력해주세요." class="form-control"></div>
					<div class="col-sm-1 align-self-center p-0">분류</div>
					<div class="col-sm-1  p-0 m-0">
						<select name="category" id="category" class="custom-select">
							<option value="일상" <c:if test="${category=='일상' || category==null}">selected</c:if>>일상</option>
							<option value="정보" <c:if test="${category=='정보'}">selected</c:if>>정보</option>
							<option value="후기" <c:if test="${category=='후기'}">selected</c:if>>후기</option>
							<option value="질문" <c:if test="${category=='후기'}">selected</c:if>>질문</option>
						</select>
					</div>
				</div><!-- 상단 타이틀 입력 끝 -->
				<hr/>
				<div class="row text-center">
					<div class="col-sm-1 p-0">내용</div>
					<div class="col-sm-10 p-0">
						<textarea rows="10" name="article" id="article" class="form-control" style="resize:none;" placeholder="내용을 입력해주세요"></textarea>
					</div>
					<input type="hidden" name="hostIp" id="hostIp" value="${pageContext.request.remoteAddr}"/>
				</div>
				</form>
				<hr/>
				<div class="row text-center">
					<div class="col">
						<input type="button" value="작성" onclick="boardWriteCheck()" class="btn btn-primary">
						<input type="reset" value="비우기"  class="btn btn-warning">
						<input type="button" value="돌아가기" onclick="location.href='${ctp}/boardList.cp?pageSize=${pageSize}&nowPage=${nowPage}'" class="btn btn-success">
					</div>
				</div>
				
			</div>
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>