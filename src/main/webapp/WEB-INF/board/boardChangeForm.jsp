<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>게시글 수정하기</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script>
	
	function boardChangeCheck(){
		
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
			boardChangeOkForm.submit();
		}
		
	}
	
	function boardDeleteCheck(){
		let idx = $("#idx").val();
		let ans = confirm("정말로 이 게시글을 삭제하시겠습니까?");
		if(!ans)return false;
		else{
			let ans = confirm("삭제한 글은 복구되지 않습니다!");
			if(!ans)return false;
			else{
				$.ajax({
					type:"post",
					url:"${ctp}/boardAticleDelete.cp",
					data:{idx:idx},
					success:function(){
						alert("현재 글이 삭제되었습니다.");
						location.href="${ctp}/boardList.cp?pageSize=${pageSize}&nowPage=${nowPage}";
					},
					error : function(){
						alert("전송 오류가 발생하였습니다.")
					}
				})
			}
		}
	}
	
	</script>
	<style>
	#changer:hover{
		background-color : #ffc107;
		color : black;
		transition: all .3s;
	}
	#changer{
		transition: all .3s;
	}
	#delete:hover{
		background-color : #dc3545;
		color : white;
		transition: all .3s;
	}
	#delete{
		transition: all .3s;
	}
	#goBack:hover{
		background-color : #20c997;
		color : white;
		transition: all .3s;
	}
	#goBack{
		transition: all .3s;
	}
	</style>
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
					<div class="col-sm-4"><h3>게시글 수정</h3></div>
					<div class="col-sm-4"></div>
					<div class="col-sm-1"></div>
					<div class="col-sm-3 text-right">
					</div>
				</div>
				<hr/>
				<form name="boardChangeOkForm" id="boardChangeOkForm" method="post" action="${ctp}/boardChangeOk.cp?nowPage=${nowPage}&pageSize=${pageSize}">
				<div class="row text-center"><!-- 상단 타이틀 입력 -->
					<div class="col-sm-1 align-self-center p-0">작성자</div>
					<div class="col-sm-2 align-self-center p-0 m-0"><input type="text" name="nickName" id="nickName" value="${sNickName}" readonly class="form-control"></div>
					<div class="col-sm-1 align-self-center p-0">제목</div>
					<div class="col-sm-5  p-0 m-0"><input type="text" name="title" id="title" placeholder="제목을 입력해주세요." value="${vo.title}" class="form-control"></div>
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
						<textarea rows="10" name="article" id="article" class="form-control" style="resize:none;" placeholder="내용을 입력해주세요">${vo.article}</textarea>
					</div>
					<input type="hidden" name="hostIp" id="hostIp" value="${pageContext.request.remoteAddr}"/>
					<input type="hidden" name="idx" id="idx" value="${idx}"/>
				</div>
				</form>
				<hr/>
				<div class="row text-center">
					<div class="col-sm-4 p-0 m-0"></div>
					<div class="col-sm-1 p-0 m-1">
						<input name="changer" id="changer" type="button" value="수정" onclick="boardChangeCheck()" class="form-control" >
					</div>
					<div class="col-sm-1 p-0 m-1">	
						<input name="delete" id="delete" type="button" value="삭제" onclick="boardDeleteCheck()"  class="form-control" >
					</div>
					<div class="col-sm-1 p-0 m-1">	
						<input name="goBack" id="goBack" type="button" value="이전" onclick="location.href='${ctp}/boardRead.cp?idx=${idx}&pageSize=${pageSize}&nowPage=${nowPage}'" class="form-control" >
					</div>
					<div class="col-sm-4 p-0 m-0"></div>
				</div>
			</div>
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>