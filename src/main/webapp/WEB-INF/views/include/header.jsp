<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<!--- basic page needs
    ================================================== -->
<meta charset="utf-8">
<title>MyBlog</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- mobile specific metas
    ================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
    ================================================== -->
<link rel="stylesheet" href="/css/base.css">
<link rel="stylesheet" href="/css/vendor.css">
<link rel="stylesheet" href="/css/main.css">

<!-- script
    ================================================== -->
<script src="/js/modernizr.js"></script>
<script src="/js/pace.min.js"></script>

<!-- favicons
    ================================================== -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

</head>

<body id="top">

	<!-- pageheader
    ================================================== -->
	<section class="s-pageheader s-pageheader--home">

		<header class="header">
			<div class="header__content row">

				<div class="header__logo">
					<a class="logo" href="/home"> <img src="/images/mylogo.png" alt="Homepage">
					</a>
				</div>
				<!-- end header__logo -->

				<ul class="header__social">
					
					<c:if test="${not empty sessionScope}">
						<a href="/user/profileForm">
							<img src="/images/userprofile/${sessionScope.user.userProfile}" alt="" style="width: 8rem; height: 8rem; border-radius: 50%;">
						</a>
						<br/>
						${sessionScope.user.username}
					</c:if>
					
				</ul>
				<!-- end header__social -->

<!-- 
 			=========	검색기능=============
				<a class="header__search-trigger" href="#0"></a>

 
 
				<div class="header__search">

					<form role="search" method="get" class="header__search-form"
						action="#">
						<label> <span class="hide-content">Search for:</span> <input
							type="search" class="search-field" placeholder="Type Keywords"
							value="" name="s" title="Search for:" autocomplete="off">
						</label> <input type="submit" class="search-submit" value="Search">
					</form>

					<a href="#0" title="Close Search" class="header__overlay-close">Close</a>

				</div>
				end header__search
  -->

				<a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>

				<nav class="header__nav-wrap">

					<h2 class="header__nav-heading h6">Site Navigation</h2>

					<ul class="header__nav">
						<li><a href="/home" title="">Home</a></li>
						<li><a href="/writeForm" title="">Posting</a></li>
						
						<c:choose>
							<c:when test="${empty sessionScope}">
								<li><a href="/user/loginForm" title="">Login</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/user/logout" title="">Logout</a></li>
							</c:otherwise>
						</c:choose>
						
						<li><a href="/user/joinForm" title="">Join</a></li>
					</ul>
					<!-- end header__nav -->

					<a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>

				</nav>
				<!-- end header__nav-wrap -->

			</div>
			<!-- header-content -->
		</header>
		<!-- header -->


	</section>
	<!-- end s-pageheader -->