<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
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
		<h4>후기관리</h4>
		<h5>슈마니커에 등록된 상점의 후기를 조회, 삭제하실 수 있습니다.</h5>
		<form action="replysearch">
		<fieldset id="field">
			<legend align="center">후기 관리</legend>
			<select id="key" name = "keyField"> 
					<option value="mem_id" >회원이름</option>
					<option value="sreply_content">내용</option>
				</select>
				<input type="text" name="keyWord" placeholder="검색어를 입력하시오"/>
				<input type="submit" value="검색">
		</form>	
		<table id="membercontent">
			<tr>
				<th>후기번호</th>
				<th>작성회원</th>
				<th>내용</th>
				<th>작성날짜</th>			
				<th>작성된상점</th>
				<th>별점</th>
				<th>삭제</th>
			</tr>
			
			<c:forEach items="${adminreply}" var="dto">
			
			<tr>
				<td>${dto.sreply_idx}</td>
				<td>${dto.mem_id}</td>
				<td>${dto.sreply_content}</td>
				<td>${dto.sreply_date}</td>
				<td>${dto.shop_idx}</td>
				<td>${dto.sreply_star }</td>
				<td><input id="${dto.sreply_idx}" type=button  class="replydel" value=삭제 /></td>
			</tr>
			</c:forEach>
		</table>
		</fieldset>
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

$(".replydel").click(function(){
	var delreply;
	delreply = $(this).attr("id");
	console.log(delreply);
	obj.url="./replydel";
	obj.data.delreply = delreply;
	
	obj.success=function(data){
		if(data.success>0) {
			alert("삭제성공")
			location.reload();
		}else{
			alert("삭제실패")
		}
	}
	ajaxCall(obj);
});

function ajaxCall(obj) {
	$.ajax(obj);
}

</script>
</html>