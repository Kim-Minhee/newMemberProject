<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" />

<!-- <meta equiv="refresh"...> -->
<title>안녕하세요!</title>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/loginHeader.jsp" />
	환영합니다!<br />
	10초 후, 회원 목록 페이지로 이동합니다.<br /><br />
	<a href="/member/list">바로 이동하기</a>
	
	<!-- setTimeout 이용하여 자동으로 넘어가게.. -->


<script>
 	setTimeout( function() { window.location='/member/list'; }, 10000 );
</script>


<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp" />