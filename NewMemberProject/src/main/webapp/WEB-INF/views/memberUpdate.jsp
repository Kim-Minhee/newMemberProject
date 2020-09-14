<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="include/header.jsp" />

<title>정보 수정</title>
</head>
<body>

	<div class="card">

		<div class="card-header">
			<div>
				<jsp:include page="include/loginHeader.jsp" />
				<div style="display: inline" class="col-auto">
					<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400" style="width: 24; height: 32;"></i>
				</div>
				<!-- <i class="fas fa-table mr-1"></i> -->
				<h1>회원 정보 수정</h1>
			</div>
			<div>이름, 이메일, 암호만 수정 가능합니다.</div>
		</div>

		<div class="container">
			<div class="card-body p-0">
			
				<section id="contact">
					<div class="container">
						<!-- Icon Divider-->
						<div class="divider-custom">
							<div class="divider-custom-line"></div>
							<div class="divider-custom-icon">
								<!-- 								<svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""> -->
								<!-- 						<path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path> -->
								<!-- 					</svg> -->
								<img src="/resources/img/update-icon.png" alt="">
							</div>
							<div class="divider-custom-line"></div>
						</div>
						<!-- Contact Section Form-->
						<div class="row">
							<div class="col-lg-8 mx-auto">
								
								<form action="update" method="post" name="update" novalidate="novalidate">
									<div class="control-group">
										<div class="form-group floating-label-form-group controls mb-0 pb-2">
											<label>Number</label>
											 회원 번호 <input type="number" name="mno" value="${selectedMember.mno}" readonly class="form-control" id="mno" aria-invalid="false">
											<p class="help-block text-danger"></p>
										</div>
									</div>
									<div class="control-group">
										<div class="form-group floating-label-form-group controls mb-0 pb-2">
											<label>Name</label>
											 이름 <input type="text" name="mname" value="${selectedMember.mname}" class="form-control" id="mname" aria-invalid="false">
											<p class="help-block text-danger"></p>
										</div>
									</div>
									<div class="control-group">
										<div class="form-group floating-label-form-group controls mb-0 pb-2">
											<label>Email</label>
											 이메일 <input type="email" name="email" value="${selectedMember.email}" class="form-control" id="email" aria-invalid="false">
											<p class="help-block text-danger"></p>
										</div>
									</div>
									<div class="control-group">
										<div
											class="form-group floating-label-form-group controls mb-0 pb-2">
											<label>Password</label>
											 암호 <input type="password" name="pwd" value="${selectedMember.pwd}" class="form-control" id="pwd" aria-invalid="false">
											<p class="help-block text-danger"></p>
										</div>
									</div>
									<div class="control-group">
										<div class="form-group floating-label-form-group controls mb-0 pb-2">
											<label>Created Date</label>
											 가입일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${selectedMember.cre_date}" />
											<p class="help-block text-danger"></p>
										</div>
									</div>
									<div class="control-group">
										<div class="form-group floating-label-form-group controls mb-0 pb-2">
											<label>Modified Date</label>
											 최종 수정일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${selectedMember.mod_date}" />
											<p class="help-block text-danger"></p>
										</div>
									</div>
									<br>
									<div class="form-group">
										<a href="#" onclick="document.update.submit()" class="btn btn-primary btn-user btn-block"> 수정 완료 </a>
									</div>
								</form>
								<hr>
								<div class="text-center">
									<a class="small" href="list">회원 목록 페이지로 돌아가기</a>
								</div>
								<div class="text-center">
									<a class="small" href="delete?mno=${selectedMember.mno}">회원 삭제하기</a>
								</div>
							</div>
						</div>
					</div>
				</section>
				
			</div>
		</div>
		
	</div>

<jsp:include page="include/footer.jsp" />