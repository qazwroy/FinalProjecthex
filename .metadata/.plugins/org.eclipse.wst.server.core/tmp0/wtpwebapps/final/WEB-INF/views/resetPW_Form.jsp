<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h2>비밀번호 재설정</h2>
	<input type="hidden" name="mem_id" value="${mem_id}" /> 새로운 비밀번호
	<input type="password" name="restet_pw" placeholder="새로운 비밀번호를 입력하세요." />
	새로운 비밀번호 확인
	<input type="password" name="reset_pw_check" placeholder="새로운 비밀번호 확인." />

	<input type="button" id="reset_pw" value="비밀번호 재설정" />
</body>
<script type="text/javascript">
	var pwReg = /^[a-z]+[a-z0-9]{7,15}$/g;

	var obj = {};//초기화   
	obj.type = "post";
	obj.dataType = "json";
	obj.enctype = "multipart/form-data";
	obj.data={};
	obj.error = function(e) {
		console.log(e)
	};

	var mem_id = "${mem_id}"; 
	
	$("#reset_pw").click(
			function() {
				if (!pwReg.test($("input[name='restet_pw']").val())) {
					alert("비밀번호는 영문자로 시작하는 8~16자 영문자 또는 숫자이어야 합니다.");
					$("input[name='restet_pw']").focus();
					$("input[name='restet_pw']").val("");
					$("input[name='reset_pw_check']").val("");
				} else if ($("input[name='reset_pw_check']").val() == "") {//이름 입력 확인
					alert("비밀번호확인을  확인 해 주세요!");
					$("input[name='reset_pw_check']").focus();//포커스 이동
				} else if ($("input[name='restet_pw']").val() != $(
						"input[name='reset_pw_check']").val()) {//이름 입력 확인
					alert("비밀번호가 일치하지 않습니다.");
					$("input[name='restet_pw']").focus();//포커스 이동
				} else {
					obj.url = "./reset_pw";
					obj.data.mem_id = mem_id;
					obj.data.mem_pw = $("input[name='restet_pw']").val();

					obj.success = function(data) {
						if (data.success == 1) {
							alert("비밀번호가 재 설정 되었습니다.");
							window.open('about:blank','_self').self.close(); 
						} else {
							alert("비밀번호 재설정 실패");
						}
					}
					console.log(obj);
					ajaxCall(obj);
				}
			});

	function ajaxCall(obj) {
		$.ajax(obj);
	}
</script>

</html>