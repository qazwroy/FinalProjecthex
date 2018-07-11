<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			table{
				border-top: 1px solid #444444;
				border-spacing: 20px;
				border-collapse: collapse;
				padding: 10 10;

				}
				td,th{
				border-bottom: 1px solid #444444;
				border-collapse: collapse;
				padding: 12px;
				font-size:13
				}

				#content{
				top:10%;
				margin:2%;
				margin-left: 15%;
				}
				#field{
				display: inline-block;
				}

		</style>
	</head>
<body>
<c:if test="${sessionScope.adminId != null}">
	<%@include file="./adminpage.jsp"%>
		
	<div id="content">
		<h4>회원관리</h4>
		<h5>슈마니커에 등록된 회원의 조회, 상태변경, 삭제가 가능합니다.</h5>
		<form action="search">
		<fieldset id="field">
			<legend align="center">회원 검색</legend>
				<select id="key" name = "keyField"> 
					<option value="0" >모든회원</option>
					<option value="1">일반회원</option>
					<option value="2">블랙회원</option>
					<option value="3">휴면회원</option>
				</select>
				<input type="text" name="keyWord" placeholder="검색어를 입력하시오 "/>
				<input type="submit" value="검색">
		</form>	
		<table id="membercontent">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>주소</th>
				<th>성별</th>
				<th>핸드폰번호</th>
				<th>회원상태</th>
				<th>상태변경</th>
				<th>삭제</th>
			</tr>
			
			<c:forEach items="${memberlist}" var="dto">
			
			<tr>
				<td>${dto.mem_id}</td>
				<td>${dto.mem_name}</td>
				<td>${dto.mem_addr}</td>
				<td>${dto.mem_gender}</td>
				<td>${dto.mem_phone}</td>
				<td>
					<c:if test="${dto.mem_state eq 0 }">일반회원</c:if>
					<c:if test="${dto.mem_state eq 1 }">블랙회원</c:if>
					<c:if test="${dto.mem_state eq 2 }">휴면회원</c:if>	
				</td>
				<td>
					<select id="${dto.mem_id}"   name = "skeyField">
					<c:if test="${dto.mem_state eq 0 }">
						<option value="1">블랙회원</option>
						<option value="2">휴면회원</option>
					</c:if>
					<c:if test="${dto.mem_state eq 1 }">
						<option value="0">일반회원</option>
						<option value="2">휴면회원</option>
					</c:if>
					<c:if test="${dto.mem_state eq 2 }">
						<option value="0">일반회원</option>
						<option value="1">블랙회원</option>
					</c:if>
					</select>
					<input id="${dto.mem_id}" type=button  class="memstate" value=변경 />
				</td>
				<td>
				<input id="${dto.mem_id}" type=button  class="memdel" value=삭제 />
				</td>
				</tr>
			</c:forEach>
		</table>
		</fieldset>
		</form>
	</div>
</c:if>
<c:if test="${sessionScope.adminId == null}">
<h3>관리자만 접근 가능합니다</h3>
</c:if>
</body>
<script>


 var obj = {};//초기화   
obj.type = "post";
obj.dataType = "json";
obj.enctype = "multipart/form-data";
obj.data={};
obj.error = function(e) {
	console.log(e)
};

$(".memdel").click(function(){
	var delmem;
	delmem = $(this).attr("id");
	console.log(delmem);
	obj.url="./memdel";
	obj.data.delmem = delmem;
	
	obj.success=function(data){
		if(data.success>0) {
			alert("삭제성공")
			location.reload();
			//location.href = "./adminpage";
		}else{
			alert("삭제실패")
		}
	}
	ajaxCall(obj);
});

$(".memstate").click(function(){
	var upstate;
	var upmemid;
	upstate= $(this).prev().val();
	upmemid=$(this).attr("id");
	obj.url="./memstate";
	obj.data.upstate=upstate;
	obj.data.upmemid=upmemid;
	
	obj.success=function(data){
		if(data.success>0){
			alert("상태변경 성공")
			location.reload();
			//location.href="./adminpage";
		}else{
			alert("상태변경 실패")
		}
	}
	ajaxCall(obj);
});

$("#key").change(function(){
	$("#key option:selected").val();
});

function ajaxCall(obj) {
	$.ajax(obj);
}



</script>
</html>