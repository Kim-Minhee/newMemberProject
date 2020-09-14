<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp" />

<title>회원 삭제 완료</title>
</head>
<body>

	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="/resources/img/delete.jpg" alt="">
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">삭제 완료</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
						<path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path>
					</svg>
					<!-- <i class="fas fa-star"></i> -->
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">" ${deleteMname} "님의 회원 정보가 모두 삭제되었습니다! 
				<br />( 10초 후, 회원 목록 페이지로 이동합니다. )
			</p>
			<hr>
			<div class="text-center">
				<a class="small" href="list" style="color:#fff;">회원 목록 페이지로 돌아가기</a>
			</div>
		</div>
	</header>
	
<script>
 	setTimeout( function() { window.location='list'; }, 10000 );
</script>

<jsp:include page="include/footer.jsp" />