<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복체크</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous">
   </script>
<script>
      $().ready(function() {

          //$("#checkEmail").change(function() {
          $("#btn").click(function() {
		  	  
              var checkEmail = $("#checkEmail").val();
              //alert("checkEmail = " + checkEmail);
	               
              $.ajax({
                  url : '/member/rest/checkEmailJson',
                  data : {
                      email : checkEmail
                  },
                  dataType : 'text', /*html, text, json, xml, script*/
                  method : 'post',
                  success : function(data) {
                      //alert("ajax 성공");

                      if ( data==0 ) {
                          alert("중복되지 않은 이메일");
                          $("#result").attr("style", "color:green;");
                          $("#result").val("사용가능한 이메일입니다.");
                      } else if ( data==1 ){
                    	  alert("중복된 이메일");
                    	  $("#result").attr("style", "color:red;");
                    	  $("#result").val("이미 사용중인 이메일입니다.");
                      } else {
                    	  alert("에러");
                    	  $("#result").val("관리자에게 문의하세요.");
                      }
                  },
                  error : function() {
                  	alert("ajax 에러");
                  }
               });
            
         });

         $.ajax({
   		 	url : '/member/rest/listJson',
            dataType : 'json', /*html, text, json, xml, script*/
            method : 'get',
            success : function(data) {
               $.each( data, function( key, value ) {
                    var tdValue = "";
                     $.each(value, function(k1, v1) {
                         //alert(k1 + ' ' + v1);
                         // TD 에 합치기
                         tdValue += v1 + ",";
                     });
                     // TR
                     $('#memberList').append("<tr><td>" + tdValue + "</td></tr>");
                  })

            },
            error : function(xhr, status, error) {
               alert(xhr.status); // 에러코드(404, 500 등)
               alert(xhr.responseText); // html 포맷의 에러 메시지
               alert(status); // 'error'
               alert(error); // 'Not Found'
            }
         });
            
      });
   </script>

</head>
<body>

	<div>
	이메일 : <input type="text" name="email" id="checkEmail" placeholder="이메일 입력">
	<button id="btn">중복 체크</button><br />
	<input type="text" id="result">
	</div>
	<br />
    <div>
      <table id="memberList">
      </table>
    </div>

</body>
</html>