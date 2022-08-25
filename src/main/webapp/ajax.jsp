<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 실습</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

<div id="box">
	<input type="text" name="mid" id="mid">
	<button class="btn" onclick="check();">중복검사</button>
	<div id="result"></div>
</div>

<script type="text/javascript">
	function check(){
		var mid=$("#mid").val();
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/check.do',
			data: {mid:mid},
			success: function(result){
					console.log("로그1 ["+result+"]");
					if(result==1){
						$("#result").text("사용가능한 아이디입니다!");
						$("#result").css("color","blue");
					}
					else{
						$("#result").text("이미 사용중인 아이디입니다...");
						$("#result").css("color","red");
					}
				},
			error: function(request, status, error){
					console.log("code: "+request.status);
					console.log("message: "+request.responseText);
					console.log("error: "+error);
				}
		});
	}
</script>
<!-- 
	mid(V에서 입력한 값)라는 변수만들어서 사용자가 입력한 값을 확보한 상태
	DB한테 물어볼예정 "mid라는 값이 DB에 이미 있어?" => DAO(M)
	C가 작업을 할 차례구나...!! "서블릿"
 -->

</body>
</html>