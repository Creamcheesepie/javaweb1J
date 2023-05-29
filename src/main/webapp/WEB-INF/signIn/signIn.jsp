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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${ctp}/js/postCodeFind.js"></script>
	<script>
	'use strict';
	//아이디와 중복버튼을 클릭햇는지의 여부를 확인하기위한 변수(버튼 클릭 후에는 내용 수정시 다시 중복 확인을 시키도록 만들기)
	let idCheckSw = 0;
	let nickCheckSw = 0;
	
	//이미지 1장 미리보기
	function imageCheck(input){
		//변수 안에 파일이 있으면 true값 반환
		if(input.files && input.files[0]){
			let reader = new FileReader();
			reader.onload = function(e){
				document.getElementById("demo").src = e.target.result;
			}
			reader.readAsDataURL(input.files[0]);
		}
		else{
			document.getElementById("demo").src="";
		}
	}
	
	//회원가입 체크
	function signInCheck(){
		let mid = signInForm.mid.value.trim();
		let pwd = signInForm.pwd.value.trim();
		let rePwd = signInForm.rePwd.value.trim();
		let nickName = signInForm.nickName.value.trim();
		let name = signInForm.name.value.trim();
		let email = signInForm.email.value.trim();
		let domain = signInForm.domain.value.trim();
		let tel = signInForm.tel.value.trim();
		let speed = signInForm.speed.value.trim(); 
		let duration = signInForm.duration.value.trim();
		let time = signInForm.time.value.trim();
		let power = signInForm.power.value.trim();
		
		signInForm.rideInfo.value = speed+"/"+duration+"/"+time+"/"+power;
		
		let midOk = "false";
		let pwdOk = "false";
		let rePwdOk = "false";
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
			signInForm.mid.focus();
			return false;
		}
		else if(!midRegEx.test(mid)){
			alert("아이디는 영문 대소문자에 숫자를 포함하여 4~12글자로 입력해주세요!");
			signInForm.mid.focus();
			return false;
		}else{
			midOk="true";
		}
		
		//비밀번호 검사
		if(pwd==""){
			alert("비밀번호를 입력하세요!");
			signInForm.pwd.focus();
			return false;
		}
		else if(!pwdRegEx.test(pwd)){
			alert("비밀번호는 영문 대소문자에 특수문자 1개 이상,8글자 이상으로 입력해주세요!");
			signInForm.pwd.focus();
			return false;
		}else{
			pwdOk="true";
		}
		
		if(rePwd==""){
			alert("비밀번호 확인창을 입력하세요!");
			signInForm.rePwd.focus();
			return false;
		}
		else if(pwd!=rePwd){
			alert("비밀번호와 비밀번호 확인창의 값은 같아야합니다!");
			signInForm.rePwd.focus();
			return false;
		}else{
			rePwdOk="true";
		}
		
		
		//닉네임 검사
		if(nickName==""){
			alert("닉네임을 입력하세요!");
			signInForm.nickName.focus();
			return false;
		}
		else if(!nickNameRegEx.test(nickName)){
			alert("닉네임은 한글, 영문, 숫자까지 입력할 수 있습니다.");
			signInForm.nickName.focus();
			return false;
		}else{
			nickNameOk="true";
		}
		
		//이름 검사
		if(name==""){
			alert("이름을 입력하세요!");
			signInForm.name.focus();
			return false;
		}
		else if(!nameRegEx.test(name)){
			alert("이름은 한글, 영문까지 입력할 수 있습니다.");
			signInForm.nickName.focus();
			return false;
		}else{
			nameOk="true";			
		}
		
		//사진 처리
		let photoName = document.getElementById("photo").value;
		
		let photoNameExe = photoName.substring(photoName.lastIndexOf(".")+1).toLowerCase();
		
		let maxSize = 1024*1024*15;
		
		
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
			signInForm.email.focus();
			return false;
		}
		else if(!emailRegEx.test(fullEmail)){
			alert("이메일 입력을 제대로 하셨는지 확인해 주세요. \n 우리 사이트는 @앞의 이름만 입력하시면 됩니다.");
			signInForm.email.focus();
			return false;
		}else{
			signInForm.fullEmail.value = fullEmail;
			emailOk="true";			
		}
		
		//전화번호 검사
		
		//주소 묶어주기.
		let postcode = signInForm.postcode.value + " ";
		let roadAddress = signInForm.roadAddress.value + " ";
		let detailAddress = signInForm.detailAddress.value + " ";
		let extraAddress = signInForm.extraAddress.value + " "; //공백을 넣어주는 이유? : 나중에 정보 수정시 값 불러오기 용이하게 하기 위함.
		signInForm.address.value  = postcode +"/"+ roadAddress +"/"+ detailAddress+"/"+ extraAddress +"/";
		
		if(idCheckSw == 0){
			alert("아이디 중복체크 버튼을 눌러주세요")
			document.getElementById("midBtn").focus();
		}
		else if(nickCheckSw == 0){
			alert("아이디 중복체크 버튼을 눌러주세요")
			document.getElementById("nickNameBtn").focus();
		}
		else if(midOk=="true" && pwdOk=="true" && rePwdOk=="true" && nickNameOk=="true" && nameOk=="true" && emailOk =="true" ){
			
			
			signInForm.submit();
		}
		
		
	}//회원가입 체크 함수 끝
	
	//아이디 중복검사
	let checkMid = "";
	function midCheck(){
		checkMid = signInForm.mid.value;
		
		if(checkMid.trim()==""){
			alert("아이디를 입력하세요!");
			signInForm.mid.focus();
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
						signInForm.pwd.focus();
						$("#idCheckIndicator").html('<font color="red">확인완료!</font>');
					}
					else{
						alert("중복된 아이디가 있습니다. 다른 아이디를 입력하여 주세요.");
					}
				},
				error : function(){
						alert("전송오류가 발생하였습니다. 잠시 후 다시 이용하여 주세요.");	
				}
			})
		}
	}//아이디 중복검사 끝
	
	//닉네임 중복검사
	let checkNick = "";
	function nickNameCheck(){
		checkNick = signInForm.nickName.value;
		let url = "${ctp}/memberNickNameCheck.cp?nickName="+nickName;
		
		
		if(checkNick.trim()==""){
			alert("닉네임을 입력하세요!");
			signInForm.nickName.focus();
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
						signInForm.email.focus();
						$("#nickCheckIndicator").html('<font color="red">확인완료!</font>');
					}
					else{
						alert("중복된 닉네임이 있습니다. 다른 닉네임을 입력하여 주세요.");
					}
				},
				error : function(){
						alert("전송오류가 발생하였습니다. 잠시 후 다시 이용하여 주세요.");	
				}
			})
		}
	}//닉네임 중복검사 끝
	
	//중복검사 후 내용 수정시 다시 검사하게 하기
	function midCheckReset(){
		let inputAgainMid = signInForm.mid.value;
		if(checkMid == inputAgainMid && checkMid.trim()!=""){
			$("#idCheckIndicator").html('<font color="red">확인완료!</font>');
			idCheckSw = "1";
		}
		else{
			$("#idCheckIndicator").html('중복확인');
			idCheckSw = "0";
		}
	}
	
	function nickCheckReset(){
		let inputAgainNick = signInForm.nickName.value;
		if(checkNick == inputAgainNick && checkNick.trim()!="" ){
			$("#nickCheckIndicator").html('<font color="red">확인완료!</font>');
			nickCheckSw = "1";
		}
		else{
			$("#nickCheckIndicator").html('중복확인');
			idCheckSw = "0";
		}
	}
	
	</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container">
	<form name="signInForm" id="signInForm" method="post" action="${ctp}/signInCheck.cp" enctype="multipart/form-data">
		<div class="row">
			<div class="col text-center mt-3"><h2>회원가입</h2></div>
		</div>
		<div class="row mt-5"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-4">
				&nbsp;아이디
				<input type="text" name="mid" id="mid" placeholder="아이디를 입력해주세요." onkeyup="midCheckReset()" class="form-control" />
			</div>
			<div class="col-sm-2 pl-0 pr-3">
				&nbsp;<span name="idCheckIndicator" id="idCheckIndicator"></span>
				<input type="button" value="중복확인" onclick="midCheck()" class="form-control btn btn-info"  style="align-self: bottom">
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;비밀번호
				<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요." class="form-control"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;비밀번호 확인
				<input type="password" name="rePwd" id="rePwd" placeholder="비밀번호를 다시 입력해주세요." class="form-control"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->		
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				&nbsp;성명
				<input type="text" name="name" id="name" placeholder="이름을 입력해주세요." class="form-control"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row mt-2"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-4">
				&nbsp;닉네임
				<input type="text" name="nickName" id="nickName" onkeyup="nickCheckReset()" placeholder="닉네임을 입력해주세요." class="form-control" />
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
				<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요." class="form-control"/>
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
				<input type="text" name="tel" id="tel" placeholder="전화번호를 -빼고 입력해 주세요" class="form-control"/>
			</div>
			<div class="col-sm-3"></div>
		</div><!-- div가로 한 덩어리 끝 -->
		<div class="row"><!-- div가로 한 덩어리 시작 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-2">
				&nbsp;생년월일
				<input type="date" name="birthday" class="form-control" value="<%=java.time.LocalDate.now()%>"/>
			</div>
			<div class="col-sm-2 pl-0 pr-3 ">
				&nbsp;나이
				<input type="number" name="age" id="age" value="20" class="form-control">
			</div>
			<div class="col-sm-2 pl-0 pr-3 ">
				&nbsp;성별
				<input type="text" name="gender" id="gender" placeholder="성별을 입력하세요" class="form-control">
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
		        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
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
	      	<input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
	      </div>
				<div class="col-sm-3"></div>
	     </div>
      <div class="row">
	     <div class="col-sm-3"></div>
				<div class="col-sm-6">
	      <div class="input-group ">
	        <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
	        <div class="input-group-append">
	          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
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
    <input type="number" name="speed" id="speed" value="25" style="width:75px"/>&nbsp;km/h
    <input type="number" name="duration" id="duration" value="50" style="width:75px"/>&nbsp;km    
    <input type="number" name="time" id="time" value="5" style="width:75px"/>&nbsp;시간
    <input type="number" name="power" id="power" value="100" style="width:75px"/>&nbsp;W
    <input type="hidden" name="rideInfo" id="rideInfo" />
    </div>
    <div class="col-sm-3"></div>
    </div>
    <div class="row">
    	<div class="col-sm-3"></div>
    	<div class="col-sm-6">
    	<div class="mb-1 input-group">자기소개</div>
    		<textarea name="inst" id="inst" rows="30" style="width:100%;height:7em; resize:none" placeholder="자기소개를 해주세요(필수는 아닙니다.)"></textarea>
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
				<input type="button" onclick="signInCheck()" value="회원가입" class="btn btn-success">
				<input type="reset"  value="다시입력" class="btn btn-warning">
			</div>
			<div class="col-sm-3"></div>
		</div><!-- 마지막 버튼 div 끝 -->
		</form><!-- 폼 닫기 -->
	</div><!-- 마지막 콘테이너 닫기 -->
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>