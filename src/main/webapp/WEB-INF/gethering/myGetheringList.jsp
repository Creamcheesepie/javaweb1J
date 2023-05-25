<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>내 모임</title>
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/include/cssMyStyle.jsp"/>
	<style>
			#td1, #td8,#td15,#td22,#td29,#td36 {color:red}
		#td7,#td14,#td21,#td28,#td35{color:blue}
		.today{
			background-color:coral;
			color:white;
			font-weight:bolder;
		}
		.calDefault{
			background-color:#efefef;
		}
		.temp{
		 background-color:#0dcaf0; 
		 color:white;
		}
	</style>
	<script>
	'use strict';
	                      //title,content,getheringType,location,totalGetherMember,getherJoinMember,gpxFileName,distance,getHeight,detailCourse,getherTime,aName}','${vo.aNickName}')
	function getherChange(title,content,getheringType,location,totalGetherMember,getherJoinMember,gpxFileName,distance,getHeight,detailCourse,getherTime,aName,aNickName,idx){
		alert("원활한 모임 운영을 위해 모임 내용중 변경 가능한 내용이 많지 않습니다. 이 점 유의해 주세요.")
		
		$("#joinTitle").text(title);
		$("#GRName").text(aName);
		$("#GRNickName").text(aNickName);
		$("#getType").text(getheringType);
		$("#gjm").text(getherJoinMember);
		$("#gtm").text(totalGetherMember);
		$("#gTime").text(getherTime);
		$("#gLocation").val(location);
		$("#gDistance").val(distance);
		$("#gHeight").val(getHeight);
		$("#gDetail").val(detailCourse);
		$("#gjIdx").val(idx);
		
		$("#getherJoin").modal(open);
	}
	
	function setChangeGether(){
		let gjMIdx = $("#gjMIdx").val();
		let gjIdx = $("#gjIdx").val();
		let gLocation = $("#gLocation").val();
		let gDistance = $("#gDistance").val();
		let gHeight = $("#gHeight").val();
		let gDetail = $("#gDetail").val();
		
		$.ajax({
			type:"post",
			url:"${ctp}/getherChangeOk.cp",
			data:{gIdx:gjIdx,mIdx:gjMIdx,location:gLocation,distance:gDistance,getHeight:gHeight,detailCourse:gDetail},
			success : function(res){
					alert("수정되었습니다.")
					location.reload();
			},
			error : function(){
				alert("전송오류가 발생하였습니다.")
			}
			
		})
		
	}
	
	function getherMemberCheck(gIdx){
		$.ajax({
			type:"post",
			url:"${ctp}/getherMemberCheckList.cp",
			data:{gIdx:gIdx},
			//dataType:'json',
			success : function(str){
					$("#getherMemberList").modal(open);
				let jarray = JSON.parse(str);
				let str2="";
				for(let j of jarray){
					str2 += "이름 : "+j.jName+"("+j.jNickName+")<br/>";
				}
					$("#getherMemberlistOutput").html(str2);
			},
			error : function(){
				
			}
		})
	}
	

	</script>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>	
	<div class="container ">
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
				<hr/>
				<div class="row">
					<div class="col p-0 m-0">
					일정요약
					</div>
				</div>
				<hr style="margin: 3px 0px 3px 0px; padding : 0px;">
				<div class="row">
					<div class="col ml-0 pl-0">
					
						<div class="row text-center">
							<div class="col p-0 m-0" style="font-size:12px;color:red;background-color:#e2e2e2;">일</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">월</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">화</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">수</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">목</div>
							<div class="col p-0 m-0" style="font-size:12px;background-color:#e2e2e2;">금</div>
							<div class="col p-0 m-0" style="font-size:12px;color:blue;background-color:#e2e2e2;">토</div>
						</div>
						
						<div class="row"> <!-- 7주일 가로 줄맞춤 시작 -->
						
						<!-- 1주일 칸 중 표시되는 달의 처음 날짜 이전의 요일은 공백으로 처리한다. -->
						<c:set var="gap" value="1"/>
						
							<c:forEach begin="1" end="${startWeek-1}" >
								<div class="col p-0 m-0"  style="font-size:12px;background-color:#efefef">&nbsp;</div>
								<c:set var="gap" value="${gap+1}"/>
							</c:forEach>
							
							 <!-- 해당 월의ㅡ 첫째 주 날짜부터 출력하되 gap가 7이되면 줄바꿈하기 -->
							<c:forEach begin="1" end="${lastDay}" varStatus="st">
									
								<div class="col p-0 m-0 calDefault"  style="font-size:12px;height:36px" id="td${gap}" >
								${st.count}
								<c:set var="flag" value="true"/>
								<c:forEach var="vo" items="${vos}" >
									<c:if test="${flag}">
										<c:if test="${fn:substring(vo.getherTime,8,10)==st.count}"> 
										 &nbsp; <p style="margin:0px;padding:0px">🚲</p>
										<c:set var="flag" value="false"/>  
										</c:if>
									</c:if>
										
								</c:forEach>
								</div>
								
								
								<c:if test="${gap%7==0}">
								</div><div class="row"> <!-- 7주일 가로 줄맞춤 끝 -->
								</c:if>
								
								
								<c:set var="lastgapEnd" value="${gap%7}"/>
								<c:set var="gap" value="${gap+1}"/>
								
							</c:forEach>
							 <c:forEach begin="2" end="${lastgapEnd}">
							<div class="col p-0 m-0" style="font-size:12px;background-color:#efefef">&nbsp;</div>
							</c:forEach> 
						
						</div>
						
						</div>
						
					</div>

				
			</div><!-- 사이드바 영역끝 -->
			<div class="col-sm-10"><!-- 오른쪽 모임정보 영역 -->
				<div class="row">
					<div class="col-sm-8 text-left"><h3>모임일정</h3></div>
					<div class="col-sm-4 text-right align-self-center">
						<c:if test="${sLevel>3}">
							<input type="button" onclick="location.href='${ctp}/setGetheringPlan.cp'" class="btn grHover" value="모임등록">
							<input type="button" onclick="location.href='${ctp}/getheringList.cp'" class="btn grHover" value="전체모임">
						</c:if>
					</div>
				</div>
				<hr/>
				<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="row">
					<div class="col-sm-4 " style="font-size:12px;"><b>${vo.location}</b></div>
					<div class="col-sm-3 " style="font-size:12px;"></div>
				</div>
				<div class="row">
					<div class="col-sm-10 text-left align-self-center" style="font-size:20px;">${fn:substring(vo.getherTime,0,16)}&nbsp;&nbsp;<b>(${vo.getheringType})&nbsp;${vo.title}</b></div>
					<div class="col-sm-2 text-right ml-0 pl-0">${vo.aNickName}(${vo.aName})</div>
				</div>
				<div class="row mt-2">
					<div class="col" style="font-size:16px;">${vo.content}</div>
				</div>
				<div class="row text-right mt-2">
					<div class="col align-self-center">
					획득고도:${vo.getHeight}m 거리:${vo.distance}km 인원수 :${vo.getherJoinMember}/${vo.totalGetherMember} </div>
				</div>
				<div class="row text-left" style="font-size:12px;">
					<div class="col-sm-4 align-self-end">
					작성시간 : ${fn:substring(vo.wDate,0,10)} 작성자IP:${vo.hostIp}
					</div>
					<div class="col-sm-8 text-right">
					<c:if test="${sMIdx!=null}">
					<input type="button" value="gpx파일 다운로드" class="btn btn-primary">
					</c:if>
					<c:if test="${sMIdx==vo.mIdx}">
         		 <input type="button" value="수정" onclick="getherChange('${vo.title}','${vo.content}','${vo.getheringType}','${vo.location}','${vo.totalGetherMember}','${vo.getherJoinMember}','${vo.gpxFileName}','${vo.distance}','${vo.getHeight}','${vo.detailCourse}','${vo.getherTime}','${vo.aName}','${vo.aNickName}','${vo.idx}')" class="btn btn-success">
						<input type="button" value="인원확인" onclick="getherMemberCheck('${vo.idx}')" class="btn btn-info"/>
					</c:if>
					</div>
				</div>
				<hr/>
				</c:forEach>
				<!-- 페이지 처리 선택자 -->
				<div class="row text-center">
					<div class="col">
						<ul class="pagination text-center justify-content-center border-secondary">	
							<c:if test="${nowPage>1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/getheringList.cp?pageSize=${pageSize}&nowPage=1">첫페이지</a></li></c:if>
							<c:if test="${curBlock>0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/getheringList.cp?pageSize=${pageSize}&nowPage=${(curBlock-1)*blockSize+1}">이전블록</a></li></c:if>
							<c:forEach var="i" begin="${curBlock*blockSize+1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
								<c:if test="${i<=totalPage && i== nowPage}"><li class="page-item active bg-secondary"><a class="page-link bg-secondary" href="#">${i}</a></li></c:if>
								<c:if test="${i<=totalPage && i!= nowPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/getheringList.cp?pageSize=${pageSize}&nowPage=${i}">${i}</a></li></c:if>
							</c:forEach>
							<c:if test="${curBlock<lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/getheringList.cp?pageSize=${pageSize}&nowPage=${(curBlock+1)*blockSize+1}">다음블록</a></li></c:if>
							<c:if test="${nowPage<totalPage}"><li class="page-item"><a class="page-link  text-secondary" href="${ctp}/getheringList.cp?pageSize=${pageSize}&nowPage=${totalPage}">마지막페이지</a></li></c:if>
						</ul>
					</div>
				</div>
			</div><!--오른쪽 모임정보 영역 끝 -->
		</div><!-- 가로로 크게 두 공간을 나누기위한 영역 -->
	</div><!-- 전체 컨테이너 끝 -->
	
	 <!-- The Modal -->
  <div class="modal fade" id="getherJoin">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">모임정보수정</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          <div>모임장 : <span name="GRName" id="GRName"></span>(<span name="GRNickName" id="GRNickName"></span>)</div>
          <div>모임명 : <span name="joinTitle" id="joinTitle"></span></div>
          <div>모임형태 : <span name="getType" id="getType"></span></div>
          <div>인원수 : <span name="gjm" id="gjm"></span>/<span name="gtm" id="gtm"></span></div>
          <div>모임시간 : <span name="gTime" id="gTime"></span></div>
           수정사항
          <hr style="margin: 4px 0px 4px 0px">
          <div>지역 : 
          <input type="text" name="gLocation" id="gLocation" class="form-control"/>
          </div>
          <div>
          거리 : 
          <input type="text" name="gDistance" id="gDistance" class="form-control"/>
          </div>
          <div>
          획득고도 :
          <input type="text" name="gHeight" id="gHeight" class="form-control"/>
          </div>
          <div>
          구간상세 : 
          <input type="text" name="gDetail" id="gDetail" class="form-control"/>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="hidden" name="gjMIdx" id="gjMIdx" value="${sMIdx}">
          <input type="hidden" name="gjIdx" id="gjIdx" />
          <button type="button" onclick="setChangeGether()" class="btn btn-success" >수정</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
	 <!-- The Modal -->
  <div class="modal fade" id="getherMemberList">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">인원확인</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
        <div id="getherMemberlistOutput">
        </div> 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
		

	
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>