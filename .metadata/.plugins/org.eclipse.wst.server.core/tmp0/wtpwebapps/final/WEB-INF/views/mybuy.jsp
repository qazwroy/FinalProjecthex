<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<style>
		#tab{
			margin-left: 10%;
			margin-left: 0%;
			
		}
		#tab table{
			width: 70%;
		}
		
		#review{
			margin-left: 85.5%;  
			margin-top: 0%;      
			position: absolute;
			background-color: white;
			outline: 0;
			border: 0;
		}
		#review:hover{
			background-color: black;
			color: white;
			outline: 0;
			border: 0;
		}
		
		#tr1 tr{
			cursor: pointer;
		}
		#tr1 tr:hover {
			background-color: #EAEAEA;
		}
</style>
</head>
<body>
	<%@include file="./mypage.jsp"%>
	<h3>구매내역 페이지</h3>
	
	<div id="tab">
		<table>
			<thead>
				<tr id="tr1">
					<th>주문번호</th>
					<th>상품정보</th>
					<th>구매일</th>
				</tr>
												
			</thead>
			<tbody id="tr1">
			
				<c:forEach items="${product}">
					<tr>
						<th><input type="checkbox"/></th>
						<th>1번</th>
						<th>나이키</th>
						<th>${pro.xxx}</th>
						<th>
							<button id="review">후기작성</button>
						</th>
					</tr>
				</c:forEach>
				
				<tr>
						<th>1번</th>
						<th>나이키</th>
						<th>21313</th>
						<th>
							<button id="review">후기작성</button>
						</th>
					</tr>
				
			</tbody>		
		</table>
	
	
	</div>
	
	
</body>
</html>