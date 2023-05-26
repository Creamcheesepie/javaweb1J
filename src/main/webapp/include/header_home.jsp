<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Pangolin&display=swap" rel="stylesheet">
</head>

<style>
	@font-face{
		font-family:'dodamdodam';
		src : url('../fonts/KCCDodamdodam.ttf') format('truetype');
	}
	.subtitle{
	 	font-size:25px;
		font-family: 'Gamja Flower', cursive;
		margin : 10px 0px 5px  55px;
		color:white;
	}
	.title{
	 font-size:55px;
	 font-family: 'Pangolin', cursive;
	 margin : 50px 0px 5px  50px;
	 color:white;
	}
</style>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<img src="${ctp}/images/headerImg/headerImg.png" style="position:relative;">
<div style="margin-bottom:0;position:absolute ">
	  <h1 class="title" >Ride together</h1>
	  <p class="subtitle" >함께 타면 더 즐겁다</p> 
</div>
