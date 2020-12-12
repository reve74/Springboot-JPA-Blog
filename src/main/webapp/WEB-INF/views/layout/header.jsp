<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">Home</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
			
			<c:choose>
				<c:when test="${empty principal}">
					<ul class="nav navbar-nav">
						<li class="nav-item"><a href="/auth/loginForm">로그인</a></li>
						<li class="nav-item"><a href="/auth/joinForm">회원가입</a></li>
					</ul>				
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav">
						<li class="nav-item"><a href="/board/form">글쓰기</a></li>
						<li class="nav-item"><a href="/user/Form">회원정보</a></li>
						<li class="nav-item"><a href="/logout">로그아웃</a></li>
					</ul>		
				</c:otherwise>
			</c:choose>
			


				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>