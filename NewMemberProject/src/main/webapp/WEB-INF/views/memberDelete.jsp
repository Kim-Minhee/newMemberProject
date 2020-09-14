<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp" />

<title>회원 삭제</title>
</head>
<body>

	<form action="delete" method="post">
		아래 회원의 정보를 완전히 삭제하시겠습니까?<br />
		번호: <input type="text" name="mno" value="${selectedMember.mno}" readonly><br />
		이름: <input type="text" name="mname" value="${selectedMember.mname}" readonly><br />
		이메일: <input type="email" name="email" value="${selectedMember.email}" readonly><br />
		<input type="submit" value="예">
		<input type="reset" value="아니오">
	</form>
	<a href="list">회원 목록으로 돌아가기</a>

<jsp:include page="include/footer.jsp" />