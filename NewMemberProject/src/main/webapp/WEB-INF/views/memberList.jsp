<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="include/header.jsp" />

<title>회원 목록</title>
</head>
<body>

	<div class="card mb-4">
		<div class="card-header">
			
			<div>
				<jsp:include page="include/loginHeader.jsp" />
<!-- 				<svg class="svg-inline--fa fa-table fa-w-16 mr-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""> -->
<!-- 					<path fill="currentColor" d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path> -->
<!-- 				</svg> -->
				<div style="display:inline" class="col-auto">
                	<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                </div>
				<!-- <i class="fas fa-table mr-1"></i> -->
				<h1>전체 회원 조회</h1>
			</div>
			<div>
				<a href="../register">신규 회원 등록</a>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr role="row" align="center">
										<th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">
											회원 번호</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending">
											이름</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending">
											이메일</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending">
											가입일</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending">
											수정 / 삭제</th>
									</tr>
								</thead>
								<tfoot>
									<tr align="center">
										<th rowspan="1" colspan="1">회원 번호</th>
										<th rowspan="1" colspan="1">이름</th>
										<th rowspan="1" colspan="1">이메일</th>
										<th rowspan="1" colspan="1">가입일</th>
										<th rowspan="1" colspan="1">수정 / 삭제</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="member" items="${members}">
										<tr role="row" align="center">
											<td class="sorting_1">${member.mno}</td>
											<td>${member.mname}</td>
											<td>${member.email}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.cre_date}" /></td>
											<td>
												<a href="update?mno=${member.mno}">수정</a> / 
												<a href="delete?mno=${member.mno}">삭제</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-7">
							<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
								<ul class="pagination"></ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="include/footer.jsp" />