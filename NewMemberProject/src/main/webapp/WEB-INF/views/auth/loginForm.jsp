<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="login" method="post">
		이메일 : <input type="text" name="email"><br />
		암호 : <input type="password" name="pwd"><br />
		<input type="submit" value="로그인">
	</form>
	<!-- 회원 가입하는 url은... 인터셉터 적용에서 빼야됨... -->
	<div class="card-header">
		<div>
			아직 회원이 아니신가요? 그렇다면 <a href="../register">회원 가입</a>을 해주세요!
		</div>
	</div>
</body>
</html>