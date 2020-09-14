<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 테스트</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
      integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
      crossorigin="anonymous">
</script>
<script>
	$().ready(function() {
    	  
		$("#email").change(function() {

			//$("#result").val("");   // 초기화
            
            var emailValue = $("#email").val();
            alert("변경된 emailValue = " + emailValue);
	               
            $.ajax({
                 url : '/member/rest/checkEmailJson',
                 data : {
                 	email : emailValue
                 },
                 dataType : 'text', /*html, text, json, xml, script*/
                 method : 'get',
                 success : function(data) {
				     alert("data = " + data);	// Controller에서 return한 값
                     alert("ajax 성공");

                     if ( data!=null ) {
                    	 $("#result").val("중복되지 않았습니다.");
                     } else {
                    	 $("#result").val("중복되었습니다.");
                     }
                     
                     // success 오는 조건? 200 ok... 값을 틀렸지만 200번으로 주면 무조건 여기?
                  },
                  error : function() {
                      alert("ajax 실패 - error");
                  }
               });
            
         });
            
      });
</script>

</head>
<body>
	
	이메일 : <input type="text" name="email" id="email" value="" placeholder="이메일 입력"><br />
	중복 체크 : <input type="text" id="result" placeholder="중복 체크 결과">

</body>
</html>