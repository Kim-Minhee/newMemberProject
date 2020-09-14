<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<jsp:include page="include/header.jsp" />

<title>회원 가입</title>
</head>
<body class="gradient-primary">

	<div class="card mb-4">
	
		<div class="card-header">
			<div>
				<div style="display: inline" class="col-auto">
<!-- 					<img src="/resources/img/register-icon.png" alt="" width="24" height="32"> -->
					<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400" style="width:24; height:32;"></i>
				</div>
				<!-- <i class="fas fa-table mr-1"></i> -->
				<h1>회원 가입</h1>
			</div>
			<div>아래 빈 칸을 모두 입력해주세요!</div>
		</div>

		<div class="container">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회원 정보 입력</h1>
							</div>
							
							<form action="register" method="post" name="register" class="user">
								<div class="form-group">
									<input name="mname" type="text" class="form-control form-control-user" placeholder="이름을 입력하세요." required="required" data-validation-required-message="이름을 입력해주세요!">
								</div>
								<div class="form-group">
									<input name="email" type="email" class="form-control form-control-user" placeholder="이메일을 입력하세요." required="required" data-validation-required-message="이메일을 입력해주세요!">
								</div>
								<div class="form-group">
									<input name="pwd" type="password" class="form-control form-control-user" placeholder="암호를 입력하세요." required="required" data-validation-required-message="암호을 입력해주세요!">
								</div>
								<a href="#" onclick="document.register.submit()" class="btn btn-primary btn-user btn-block">가입하기 </a>
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="list">회원 목록 페이지로 돌아가기</a>
							</div>
							<div class="text-center">
								<a class="small" href="../auth/login">이미 회원이시라면, 로그인을 해주세요!</a>
							</div>
						</div>
					</div>
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
				</div>
			</div>
		</div>
		
	</div>

<jsp:include page="include/footer.jsp" />