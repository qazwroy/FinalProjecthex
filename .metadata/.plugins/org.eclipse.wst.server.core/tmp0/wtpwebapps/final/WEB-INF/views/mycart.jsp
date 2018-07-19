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
		width: 80%;
	} 
	#tr1 tr{
		cursor: pointer;
	}
	#tr1 tr:hover {
		background-color: #EAEAEA;
	}
	#buydel{
		margin-left: 85.5%;  
		margin-top: 15%;      
		position: absolute;
		background-color: white;
		outline: 0;
		border: 0;
		font-size: 15px;  
	}
	#buydel:hover {
		background-color: black;
		color: white;
		outline: 0;
		border: 0;
	}
	td{
		text-align: center;
	}
</style>

</head>
<body>
	<%@include file="./mypage.jsp"%>

	<h3>찜 목록</h3>
	
	<input type="button" class="cartdel" id="buydel" value="찜 삭제" onclick="buydel()"/>
	
	
	<div id=tab>
<form action="./mycart">
	<table>
			<thead>
				<tr>
					<th></th>
					<th>사진</th>
					<th>상품종류</th>
					<th>상품금액</th>
					<th>찜 날짜</th>
				</tr>
			</thead>
			<tbody id="tr1">
				
				
				
			</tbody>
		</table>
		
</form>

	</div>

</body>
<script>


function buydel() {
	$('#cart1:checked').each(function() { 
        console.log($(this).val());	        
   });
} 

var obj = {};
obj.dataType = "JSON";

obj.error = function(e) {
   console.log(e)
};

 $(document).ready(function() {
   listPrint();
});
 


/* //댓글리스트 출력
function listPrint() {
	obj.url = "./mycart",
	obj.data = {
			id : '${sessionScope.loginId}'
	},	
    console.log(obj.data.id); 
	obj.success = function(data) {
		console.log(data);
		var content = "";
		data.mycart.forEach(function(item, index) {
			  content += "<tr>";
			  content += "<td><input type='checkbox' id='cart1' value="+item.cart_idx+" '/></td>'"
	          content += "<td>"+item.pro_idx+"</td>";
	          content += "<td>"+item.pro_name+"</td>";
	          content += "<td>"+item.pro_price+"</td>";
	          var date = new Date(item.cart_date);
	          content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
	          content += "</tr>";
			});

	$("#tr1").empty();
	$("#tr1").append(content);
	}				
		
		ajaxCall(obj);
	} */

 
 function listPrint(mycart) {
    	 obj.url = "./mycart",
		obj.data = {
				id : '${sessionScope.loginId}'
		},	
	    console.log(obj.data.id); 
		obj.success = function(data) {
			console.log(data);
			var content = "";
			data.mycart.forEach(function(item) {
				  content += "<tr>";
				  content += "<td><input type='checkbox' id='check' value='"+item.cart_idx+"'/></td>"
		          content += "<td>"+item.pro_idx+"</td>";
		          content += "<td>"+item.pro_name+"</td>";
		          content += "<td>"+item.pro_price+"</td>";
		          var date = new Date(item.cart_date);
		          content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
		          content += "</tr>";
				});

		$("#tr1").empty(mycart);
		$("#tr1").append(content);
		}				
			
			ajaxCall(obj);
		}

 
 
 
var cartdel;
$("#buydel").click(function(){
    $.ajax({
        type:"post",
        url:"./cartdel",
        data:{
        	cartdel : $("#check:checked").val()
        },
        dataType:"JSON",
        success:function(data){
           console.log(data);
           if(data.success > 0){
        	   console.log(data.success); 
        	   location.reload();
           }
        },
        error : function(err){
           console.log(err);
        }
     });
});

function ajaxCall(param) {
	console.log(param);
	$.ajax(param);
}


</script>
</html>