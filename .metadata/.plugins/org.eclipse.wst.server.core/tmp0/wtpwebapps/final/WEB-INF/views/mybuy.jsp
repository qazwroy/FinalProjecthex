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
		td{
			text-align: center;
		}
</style>
</head>
<body>
	<%@include file="./mypage.jsp"%>
	<h3>구매내역 페이지</h3>
	
	<div id="tab">
		<table>
			<thead>
				<tr>
					<th>주문번호</th>
					<th>상품정보</th>
					<th>구매일</th>
				</tr>
												
			</thead>
			<tbody id="tr1">
			
				
				
			</tbody>		
		</table>
	
	
	</div>
	
	
</body>
<script>
var obj = {};
obj.dataType = "JSON";

obj.error = function(e) {
   console.log(e)
};

 $(document).ready(function() {
   listPrint();
});
 
 
 
 function listPrint(mybuy) {
	 obj.url = "./mybuy",
	obj.data = {
			id : '${sessionScope.loginId}'
	},	
    console.log(obj.data.id); 
	obj.success = function(data) {
		console.log(data);
		var content = "";
		data.mybuy.forEach(function(item) {
			  content += "<tr>";
	          content += "<td>"+item.wallet_idx+"</td>";
	          content += "<td>"+item.pro_name+"</td>";
	          var date = new Date(item.wallet_date);
	          content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
	          content += "</tr>";
			});

	$("#tr1").empty(mybuy);
	$("#tr1").append(content);
	}				
		
		ajaxCall(obj);
	}
 
 
 
 
 
 function ajaxCall(param) {
		console.log(param);
		$.ajax(param);
	}


</script>
</html>