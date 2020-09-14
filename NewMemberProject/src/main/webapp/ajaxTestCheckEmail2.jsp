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

    	  //$("#preEmail").val("none");
          
          $("#btn").click(function() {
		  	  
              var checkEmail = $("#checkEmail").val();
              alert("checkEmail = " + checkEmail);
	               
              $.ajax({
                  url : '/member/rest/checkEmailJson',
                  data : {
                      email : checkEmail
                  },
                  dataType : 'text', /*html, text, json, xml, script*/
                  method : 'get',
                  success : function(data) {
                      //alert("ajax 성공");

                      if ( data!=$("#preEmail").val() ) {
                          $("#result").val("중복되지 않았습니다.");
                      } else {
                    	  $("#result").val("중복되었습니다.");
                      }
                      
                      $("#preEmail").val(data);
                  },
                  error : function() {
                  	alert("ajax 에러");
                  }
               });
            
         });
            
      });
   </script>

</head>
<body>

     이메일 : <input type="text" name="email" id="checkEmail" placeholder="이메일 입력"><input type="hidden" id="preEmail">
   <button id="btn">중복 체크</button><br />
     중복 체크 : <input type="text" id="result" placeholder="중복 체크 결과">

</body>
</html>