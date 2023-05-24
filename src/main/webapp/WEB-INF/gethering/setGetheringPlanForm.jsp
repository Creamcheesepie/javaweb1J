<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>모임 일정 등록</title>
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/include/cssMyStyle.jsp"/>
<script>
	'use strict';
	
	function getheringInputSubmit(){
		let title = $("#title").val();
		let getheringType = $("#getheringType").val();
		let location = $("#loaction").val();
		let getheringDate1 = $("#getheringDate1").val();
		let getheringTime1 = $("#getheringTime1").val();
		let totalGetheringMember =$("#totalGetheringMember").val();
		let getHeight = $("#getHeight").val();
		let detailCourse = $("#detailCourse").val();

		let gpxFileName = document.getElementById("gpxFile").value;
		
		let gpxFileNameExe = gpxFileName.substring(gpxFileName.lastIndexOf(".")+1).toLowerCase();
		
		let maxSize = 1024*1024*15;
		
		
		if(title.trim()==""){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if(location.trim()==""){
			alert("모임지역을 입력해주세요.");
			return false;
		}
		
		if(getheringDate1.trim()==""){
			alert("모임날짜를 입력해주세요.");
			return false;
		}
		
		if(getheringTime1.trim()==""){
			alert("모임시간을 입력해주세요.");
			return false;
		}
		
		let getheringDate =  getheringDate1+getheringTime1;
		
		$("#getheringDate").val(getheringDate);
		
		if(totalGetheringMember.trim()==""){
			alert("모임 인원수를 설정해주세요.");
			return false;
		}
		
		if(distance.trim()==""){
			alert("라이딩 거리를 설정해주세요.");
			return false;
		}
		
		if(getHeight.trim()==""){
			alert("획득고도를 설정해주세요.");
			return false;
		}
		
		if(detailCourse.trim()==""){
			alert("상세코스를 입력해 주세요.")
			return false;
		}
		
		if(content.trim()==""){
			alert("내용을 입력해 주세요.")
			return false;
		}
		
		if(gpxFileName.trim()==""){
			alert("gpx파일을 저장해주세요.")
		}
		else if(gpxFileName.trim()!=""){
			let fileSize = document.getElementById("gpxFileName").files[0].size;
			
			if(gpxFileNameEXE!="gpx" ){
				alert(".gpx 확장자의 gpx파일만 업로드 가능합니다.");
				return false;
			}
			
			if(fileSize>maxSize){
				alert("업로드 가능한 gpx 파일의 크기는 15mb까지입니다.");
				return false;
			}
		
		}
		
		getheringInput.submit();
		

		
	}
</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
		<div class="row"><!-- 가로로 크게 두 공간을 나누기 위한 영역 -->
			<div class="col-sm-2"><!-- 왼쪽 사이드바 영역 -->
				<div class="row">
					<div class="col">
						<b>내 정보</b>
					</div>
				</div>
				<hr style="margin : 4px 0px 4px 0px;"/>
				<div class="row">
					<div class="col " style="font-size:14px;">아이디 : ${sMid}</div>
				</div>
				<div class="row">
					<div class="col" style="font-size:14px;">닉네임 : ${sNickName}</div>
				</div>
				<div class="row">
					<div class="col" style="font-size:14px;">등급 : ${sMemberGrade}</div>
				</div>
			</div>
			<div class="col-sm-10"><!-- 오른쪽 큰 영역 -->
				<div class="row"><!-- 타이틀 영역 -->
					<div class="col"><h3>모임일정작성</h3></div>
				</div><!-- 타이틀 영역 끝 -->
				<hr/>
				<form name="getheringInput" method="post" action="${ctp}/getheringInputOk.cp" enctype="multipart/form-data">
				<div class="row text-center"><!-- 상단 타이틀 입력 -->
					<div class="col-sm-1 align-self-center p-0">작성자</div>
					<div class="col-sm-2 align-self-center p-0 m-0"><input type="text" name="nickName" id="nickName" value="${sNickName}" readonly class="form-control"></div>
					<div class="col-sm-1 align-self-center p-0">제목</div>
					<div class="col-sm-5  p-0 m-0"><input type="text" name="title" id="title" placeholder="제목을 입력해주세요." class="form-control"></div>
					<div class="col-sm-1 align-self-center p-0">분류</div>
					<div class="col-sm-1  p-0 m-0">
						<select name="getheringType" id="getheringType" class="custom-select">
							<option value="연습" <c:if test="${getheringType=='연습' || category==null}">selected</c:if>>연습</option>
							<option value="대회" <c:if test="${getheringType=='대회'}">selected</c:if>>대회</option>
							<option value="훈련" <c:if test="${getheringType=='훈련'}">selected</c:if>>훈련</option>
							<option value="친목" <c:if test="${getheringType=='친목'}">selected</c:if>>친목</option>
							<option value="미식" <c:if test="${getheringType=='미식'}">selected</c:if>>미식</option>
						</select>
					</div>
				</div><!-- 상단 타이틀 입력 끝 -->
				<div class="row mt-2 text-center">
					<div class="col-sm-1 align-self-center p-0">지역</div>
					<div class="col-sm-5 align-self-center p-0"><input type="text" name="location" id="location" class="form-control" placeholder="시작할 장소를 면,리,동 단위까지 적어주세요."/></div>
					<div class="col-sm-1 align-self-center p-0">모임시간</div>
					<div class="col-sm-2 align-self-center p-0 mr-1"><input type="date" name="gethringDate1" class="form-control" value="<%=java.time.LocalDate.now()%>"/></div>
					<div class="col-sm-2 align-self-center p-0"><input type="time" name="gethringTime1" class="form-control" value="<%=java.time.LocalDate.now()%>"/></div>
				</div>
				<div class="row text-center mt-2">
					<div class="col-sm-1 align-self-center p-0">총원</div>
					<div class="col-sm-1 align-self-center p-0"><input type="number" name="totalGetheringMember" id="totalGetheringMember" class="form-control" min="2" max="300"/></div>
					<div class="col-sm-1 align-self-center p-0 text-left">&nbsp;명</div>
					<div class="col-sm-1 align-self-center p-0">코스길이</div>
					<div class="col-sm-1 align-self-center p-0"><input type="text" name="distance" id="distance" class="form-control"/></div>
					<div class="col-sm-1 align-self-center p-0 text-left">&nbsp;km</div>
					<div class="col-sm-1 align-self-center p-0">획득고도</div>
					<div class="col-sm-1 align-self-center p-0"><input type="text" name="getHeight" id="getHeight" class="form-control"/></div>
					<div class="col-sm-1 align-self-center p-0 text-left">&nbsp;m</div>
				</div>
					<div class="row text-center mt-2">
						<div class="col-sm-1 align-self-center p-0">세부코스</div>
						<div class="col-sm-5 align-self-center p-0"><input type="text" name="detailcourse" id="detailcourse" class="form-control" placeholder="갈림길이나 특정 기점을 기준으로 작성해주세요."/></div>
						<div class="col-sm-1 align-self-center p-0">gpx파일</div>
						<div class="col-sm-4 align-self-center p-0"><input type="file" id="gpxFile" name="gpxFile" onchange="imageCheck(this)" class="form-control-file"></div>
					</div>
				<hr/>
					<div class="row text-center mt-2">
						<div class="col-sm-1 align-self-center">내용</div>
						<div class="col-sm-10 m-0 p-0"><textarea rows="8" name="content" id="content" class="form-control" style="resize:none;" placeholder="내용을 입력해주세요"></textarea></div>
					</div>
					<hr/>
						<input type="hidden" name="hostIp" id="hostIp" value="${pageContext.request.remoteAddr}"/>
						<input type="hidden" name="mIdx" id="mIdx" value="${sMIdx}"/>
						<input type="hidden" name="getheringDate" id="getheringDate" />
					</form>
					<div class="row text-center mt-2" style="height:100px">
						<div class="col align-self-start">
						
							<input type="button" value="등록" onclick="getheringInputSubmit()" class="btn skyblueHover">
							<input type="reset" value="재작성" class="btn yellowHover">
							<input type="button" value="돌아가기" class="btn greenHover">
						</div>
					</div>
			</div>
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>