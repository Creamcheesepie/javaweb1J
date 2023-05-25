<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<style>
	.ad_topmenu{
		float : left
		
	}
</style>
<div class="text-center">
<h4>관리자 페이지</h4>
</div>
<div class="ad_topmenu text-center">
<a href="${ctp}/memberManagement.ad">회원관리</a> | 
<a href="${ctp}/TAMManagement.ad">출석 한마디 관리</a> | 
<a href="${ctp}/boardMangement.ad">게시판 관리</a> | 
모임관리

</div>