<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<fieldset>
		<legend>비밀번호 찾기 선택</legend>
		<input type="radio" name="search_option" value="email"
			checked="checked" />이메일 인증 <input type="radio" name="search_option"
			value="question" />질문 & 답변
	</fieldset>
	<input id="searchPW_btn" type="button" value="확인" />
	
</body>
<script type="text/javascript">
	
	


	$("#searchPW_btn").click(function(){
		if($("input[name='search_option']:checked").val()=="email"){
			location.href = "./searchPW_email";
		}else{
			location.href = "./searchPW_question";
		}
	});
</script>
</html>