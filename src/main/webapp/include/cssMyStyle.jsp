<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
/* css스타일 맹그는 존 */

.redHover:Hover{
	background-color : #dc3545;
		color : white;
		transition: all .3s;
}
.redHover{
		transition: all .3s;
}
.yellowHover:hover{
	background-color : #ffc107;
	color : black;
	transition: all .3s;
}
.yellowHover{
	transition: all .3s;
}
.greenHover:hover{
	background-color : #20c997;
	color : white;
	transition: all .3s;
}
.greenHover{
	transition: all .3s;
}
.grayHover:hover{
	background-color : #adb5bd;
	color : white;
	transition: all .3s;
}
.grayHover{
	transition: all .3s;
}
.grHover:hover{
	background-color : #efefef;
	
	transition: all .3s;
}
.grHover{
	transition: all .3s;
}
.skyblueHover:hover{
	background-color : #00BFFF;
	color : black;
	transition: all .3s;
}
.skyblueHover{
	transition: all .3s;
}
@font-face{
	font-family:'nanumBarunGothic';
	src : url('../fonts/nbg_n.ttf') format('truetype');
}
@font-face{
	font-family:'jejugothic';
	src : url('../fonts/JejuGothic.ttf') format('truetype');
}
.title-font{
	font-family : 'jejugothic';
}

</style>