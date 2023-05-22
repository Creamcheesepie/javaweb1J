<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	let curMid = "${vo.mid}";
	let curNickName = "${vo.nickName}";
	$(document).ready(function() {
	$("#mid").val(curMid);
	$("#nickName").val(curNickName);
	});

	let idCheckSw = "1";
	let nickCheckSw = "";
	
	//회원정보 수정체크
	function myInfoUpdateOk(){
		let mid = myInfoUpdateForm.mid.value.trim();

		let nickName = myInfoUpdateForm.nickName.value.trim();
		let name = myInfoUpdateForm.name.value.trim();
		let email = myInfoUpdateForm.email.value.trim();
		let domain = myInfoUpdateForm.domain.value.trim();
		let tel = myInfoUpdateForm.tel.value.trim();
		let speed = myInfoUpdateForm.speed.value.trim(); 
		let duration = myInfoUpdateForm.duration.value.trim();
		let time = myInfoUpdateForm.time.value.trim();
		let power = myInfoUpdateForm.power.value.trim();
		
		myInfoUpdateForm.rideInfo.value = speed+"/"+duration+"/"+time+"/"+power;
		
		let midOk = "false";

		let nickNameOk = "false";
		let nameOk = "false";
		let emailOk = "false";
		let telOk = "false";

		const midRegEx = /^[a-zA-Z0-9]{4,20}[^\W]/; //아이디 정규식
		const pwdRegEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/g; //비밀번호 정규식
		const nickNameRegEx = /^[a-zA-Z0-9가-힣]{2,19}[a-zA-Z0-9가-힣]*$/g; //닉네임 정규식
		const nameRegEx = /^[a-zA-Z가-힣]{1,19}[a-zA-Z가-힣]*$/g; //이름 정규식
		const emailRegEx = /[\w]+@[\w]+[.]{1}[\w]/g; //이메일 정규식
		const telRegEx = /\d{2,3}-\d{3,4}-\d{4}$/g;
		
		//아이디 검사
		if(mid==""){
			alert("아이디를 입력하세요!");
			myInfoUpdateForm.mid.focus();
			return false;
		}
		else if(!midRegEx.test(mid)){
			alert("아이디는 영문 대소문자에 숫자를 포함하여 4~12글자로 입력해주세요!");
			myInfoUpdateForm.mid.focus();
			return false;
		}else{
			midOk="true";
		}
		
		
		//닉네임 검사
		if(nickName==""){
			alert("닉네임을 입력하세요!");
			myInfoUpdateForm.nickName.focus();
			return false;
		}
		else if(!nickNameRegEx.test(nickName)){
			alert("닉네임은 한글, 영문, 숫자까지 입력할 수 있습니다.");
			myInfoUpdateForm.nickName.focus();
			return false;
		}else{
			nickNameOk="true";
		}
		
		//이름 검사
		if(name==""){
			alert("이름을 입력하세요!");
			myInfoUpdateForm.name.focus();
			return false;
		}
		else if(!nameRegEx.test(name)){
			alert("이름은 한글, 영문까지 입력할 수 있습니다.");
			myInfoUpdateForm.nickName.focus();
			return false;
		}else{
			nameOk="true";			
		}
		
		//사진 처리
		let photoName = document.getElementById("photo").value;
		
		let photoNameExe = photoName.substring(photoName.lastIndexOf(".")+1).toLowerCase();
		
		let maxSize = 1024*1024*10;
		
		
		if(photoName.trim()==""){
			photoName="noimage.jpg";
		}
		else if(photoName.trim()!=""){
			let fileSize = document.getElementById("photoFile").files[0].size;
			
			if(photoNameExe!="jpg" && photoNameExe!="png" && photoNameExe!="gif" ){
				alert("프로필 사진으로 업로드 가능한 이미지는 jpg,png,gif 확장자를 가진 이미지 파일입니다.");
				return false;
			}
			
			if(fileSize>maxSize){
				alert("프로필 사진으로 업로드 가능한 이미지의 크기는 10mb까지입니다.");
				return false;
			}
		
		}
		
		//이메일 검사
		let fullEmail = email+domain;
		
		if(email==""){
			alert("이메일을 입력하세요!");
			myInfoUpdateForm.email.focus();
			return false;
		}
		else if(!emailRegEx.test(fullEmail)){
			alert("이메일 입력을 제대로 하셨는지 확인해 주세요. \n 우리 사이트는 @앞의 이름만 입력하시면 됩니다.");
			myInfoUpdateForm.email.focus();
			return false;
		}else{
			myInfoUpdateForm.fullEmail.value = fullEmail;
			emailOk="true";			
		}
		
		//전화번호 검사
		
		//주소 묶어주기.
		let postcode = myInfoUpdateForm.postcode.value + " ";
		let roadAddress = myInfoUpdateForm.roadAddress.value + " ";
		let detailAddress = myInfoUpdateForm.detailAddress.value + " ";
		let extraAddress = myInfoUpdateForm.extraAddress.value + " "; //공백을 넣어주는 이유? : 나중에 정보 수정시 값 불러오기 용이하게 하기 위함.
		myInfoUpdateForm.address.value  = postcode +"/"+ roadAddress +"/"+ detailAddress+"/"+ extraAddress +"/";
		
		if(nickCheckSw == 0){
			alert("닉네임 중복체크 버튼을 눌러주세요")
			document.getElementById("nickNameBtn").focus();
		}
		else if( nickNameOk=="true" && nameOk=="true" && emailOk =="true" ){
			
			
			myInfoUpdateForm.submit();
		}
	}
		
	
	//아이디 중복검사
	let checkMid = "";
	function midCheck(){
		checkMid = $("#mid").val();
		
		if(curMid == checkMid){
			alert("기존 아이디를 유지합니다.");
			idCheckSw = "1";
			return false;
		};

		if(checkMid.trim()==""){
			alert("아이디를 입력하세요!");
			myInfoUpdateForm.mid.focus();
		}
		else{
			$.ajax({
				type:"post",
				url:"${ctp}/memberIdCheck.cp",
				data :{mid:checkMid},
				success : function(res){
					if(res=="1"){
						alert("중복된 아이디가 없습니다.");
						idCheckSw = "1";
						myInfoUpdateForm.pwd.focus();
						$("#idCheckIndicator").html('<font color="red">확인완료!</font>');
					}
					else{
						alert("중복된 아이디가 있습니다. 다른 아이디를 입력하여 주세요.");
						let checkMid = "0";
					}
				},
				error : function(){
						alert("전송오류가 발생하였습니다. 잠시 후 다시 이용하여 주세요.");	
				}
			})
		}
	}//아이디 중복검사 끝
	
	//닉네임 중복검사
	let checkNick = "1";
	function nickNameCheck(){
		checkNick = $("#nickName").val();
		let url = "${ctp}/memberNickNameCheck.cp?nickName="+nickName;
		
		if(curNickName == checkNick){
			alert("기존 닉네임을 유지합니다.");
			nickCheckSw = "1";
			return false;
		}
		
		if(checkNick.trim()==""){
			alert("닉네임을 입력하세요!");
			myInfoUpdateForm.nickName.focus();
		}
		else{
			$.ajax({
				type:"post",
				url:"${ctp}/memberNickNameCheck.cp",
				data :{nickName:checkNick},
				success : function(res){
					if(res=="1"){
						alert("중복된 닉네임이 없습니다.");
						nickCheckSw = "1";
						myInfoUpdateForm.email.focus();
						$("#nickCheckIndicator").html('<font color="red">확인완료!</font>');
					}
					else{
						alert("중복된 닉네임이 있습니다. 다른 닉네임을 입력하여 주세요.");
						nickCheckSw = "0";
					}
				},
				error : function(){
						alert("전송오류가 발생하였습니다. 잠시 후 다시 이용하여 주세요.");	
				}
			})
		}
	}//닉네임 중복검사 끝
	
	
	//중복검사 후 내용 수정시 다시 검사하게 하기
	
	
	function nickCheckReset(){
		let inputAgainNick = myInfoUpdateForm.nickName.value;
		if(checkNick == inputAgainNick && checkNick.trim()!="" ){
			$("#nickCheckIndicator").html('<font color="red">확인완료!</font>');
			nickCheckSw = "1";
		}
		else if(curNickName==inputAgainNick){
			$("#idCheckIndicator").html('<font color="red">기존 닉네임입니다</font>');
			nickCheckSw = "1";
		}
		else{
			$("#nickCheckIndicator").html('중복확인');
			nickCheckSw = "0";
		}
	}
	
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
	<c:if test="${updateFlag=='ok'}">
	<form name="myInfoUpdateForm" id="myInfoUpdateForm" method="post" action="${ctp}/memberMyInfoUpdate.cp" enctype="multipart/form-data">
		<div class="row">
			<div class="col text-center mt-3"><h2>회원정보수정</h2></div>
		</div>
		<div class="row mt-5"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;아이디
				<input type="text" name="mid" id="mid" placeholder="아이디를 입력해주세요." readonly class="form-control" />
			</div>

			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;성명
				<input type="text" name="name" id="name" placeholder="이름을 입력해주세요." value="${vo.name}" class="form-control"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-4">
				&nbsp;닉네임
				<input type="text" name="nickName" id="nickName" onkeyup="nickCheckReset()"  placeholder="닉네임을 입력해주세요." class="form-control" />
			</div>
			<div class="col-sm-2 pl-0 pr-3">
			&nbsp;<span name="nickCheckIndicator" id="nickCheckIndicator"></span>
				<input type="button" value="중복확인" onclick="nickNameCheck()" class="form-control btn btn-info"  style="align-self: bottom">
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-4">
				&nbsp;이메일을 입력해 주세요. 
				<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요." value="${curEmail}" class="form-control"/>
			</div>
			<div class="col-sm-2 pl-0 pr-3">
				도메인 선택
				<select name="domain" class="custom-select ">
					<option>@naver.com</option>
					<option>@gmail.com</option>
					<option>@hanmail.net</option>
					<option>@yahoo.com</option>
				</select>
				<input type="hidden" name="fullEmail" id="fullEmail"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;전화번호
				<input type="text" name="tel" id="tel" placeholder="전화번호를 -빼고 입력해 주세요" value="${vo.tel}" class="form-control"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-2">
				&nbsp;생년월일
				<input type="date" name="birthday" class="form-control" value="${fn:substring(vo.birthday,0,10)}"/>
			</div>
			<div class="col-sm-2 pl-0 pr-3 ">
				&nbsp;나이
				<input type="number" name="age" id="age" value="${vo.age}" class="form-control">
			</div>
			<div class="col-sm-2 pl-0 pr-3 ">
				&nbsp;성별
				<input type="text" name="gender" id="gender" placeholder="성별을 입력하세요" value="${vo.gender}" class="form-control">
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
		        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" value="${postcode}" class="form-control">
		        <div class="input-group-append">
		          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
		        </div>
		      </div>
		     </div>
		    <div class="col-sm-3"></div> 
      </div>
      <div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
	      	<input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소"  value="${roadAddress}" class="form-control mb-1">
	      </div>
				<div class="col-sm-3"></div>
	     </div>
      <div class="row">
	     <div class="col-sm-3"></div>
				<div class="col-sm-6">
	      <div class="input-group ">
	        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" value="${detailAddress}" class="form-control"> &nbsp;&nbsp;
	        <div class="input-group-append">
	          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" value="${extraAddress}" class="form-control">
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
    <input type="number" name="speed" id="speed" value="${speed}" style="width:75px"/>&nbsp;km/h
    <input type="number" name="duration" id="duration" value="${duration}" style="width:75px"/>&nbsp;km    
    <input type="number" name="time" id="time" value="${time}" style="width:75px"/>&nbsp;시간
    <input type="number" name="power" id="power" value="${power}" style="width:75px"/>&nbsp;W
    <input type="hidden" name="rideInfo" id="rideInfo" />
    </div>
    <div class="col-sm-3"></div>
    </div>
    <div class="row">
    	<div class="col-sm-3"></div>
    	<div class="col-sm-6">
    	<div class="mb-1 input-group">자기소개</div>
    		<textarea name="inst" id="inst" rows="30" style="width:100%;height:7em; resize:none" placeholder="자기소개를 해주세요(필수는 아닙니다.)">${vo.inst}</textarea>
    	</div>
    	<div class="col-sm-3"></div>
    </div>

    <div class="row">
    	<div class="col-sm-3"></div>
    	<div class="col-sm-6">
    	<div class="mb-1">프로필 사진</div>
    		<input type="file" id="photo" name="photo" onchange="imageCheck(this)" class="form-control-file">
    		<img id="demo" width="150px"/>
    	</div>
    	<div class="col-sm-3"></div>
    </div>
		<div class="row mt-2 text-center"> <!-- 마지막 버튼 div -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<input type="button" onclick="myInfoUpdateOk()" value="정보수정" class="btn btn-success">
				<input type="reset"  value="다시입력" class="btn btn-warning">
			</div>
			<div class="col-sm-3"></div>
		</div><!-- 마지막 버튼 div 끝 -->
		</form><!-- 폼 닫기 -->		
		</c:if>
		
		
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>