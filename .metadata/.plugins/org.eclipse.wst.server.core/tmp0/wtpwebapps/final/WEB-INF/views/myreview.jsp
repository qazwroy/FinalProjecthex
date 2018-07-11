<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<style>
	#tab{
		margin-left: 10%; 
		margin-left: 0%;
		margin-top: 1%;
	}
	#tab table{
		width: 80%;
	} 
	#myReview tr{
		cursor: pointer;
	}
	#myReview tr:hover {
		background-color: #EAEAEA;
	}
	#reviewDel{
		margin-left: 85.5%;  
		margin-top: 15%;      
		position: absolute;
		background-color: white;
		outline: 0;
		border: 0;
		font-size: 15px;  
	}
	#reviewDel:hover {
		background-color: black;
		color: white;
		outline: 0;
		border: 0;
	}
	#rev1{
		margin-left: 50%; 
		word-spacing: 10px; 
	}
	#sreply_content{
		width: 50%;
	}
	#selrev{
		width: 5%;
		text-align: center;
	}
	
	#reviewWrite{
		margin-left: 85.5%;  
		margin-top: 0%;      
		position: absolute;
		background-color: white;
		outline: 0;
		border: 0;
		font-size: 15px;  
	}
	#reviewWrite:hover{
		background-color: black;
		color: white;
		outline: 0;
		border: 0;
	}
	#myReview{
		text-align: center;
	}
	
</style>
</head>
<body>
	<%@include file="./mypage.jsp"%>
	
	<h3>상점후기 내역</h3>
	<button id="reviewWrite">글등록 </button>
	<button id="reviewDel">후기 삭제 </button>
	
	<div id="rev1">
		후기  <input type="text" id="sreply_content"/> 
		평점  <select id="starRate">
				<option selected="selected">5</option>
				<option>4</option>
				<option>3</option>
				<option>2</option>
				<option>1</option>
			</select>
		
	</div>
	
	<div id=tab>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>구매자</th>
					<th>후기내용</th>
					<th>날짜</th>
					<th>평점</th>
				</tr>
			</thead>
			<tbody id="myReview">
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
	      //댓글리스트 출력
			function listPrint() {
	    	  
				obj.url = "./reviewList";
				obj.data = {};
				obj.data.shop_idx = '${sessionScope.shopIdx}';
				console.log(obj.data.shop_idx);
				obj.success = function(data) {
					console.log(data);
					var content = "";
					data.reviewList.forEach(function(item, index) {
						  content += "<tr>";
						  content += "<td><input type='checkbox' id='review1'/></td>"
				          content += "<td>"+item.mem_id+"</td>";
				          content += "<td>"+item.sreply_content+"</td>";
				          var date = new Date(item.sreply_date);
				          content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
				          content += "<td>"+item.sreply_star+"</td>";
				          content += "</tr>";
						});

				$("#myReview").empty();
				$("#myReview").append(content);
				}				
					
          		ajaxCall(obj); 
				}
	      //후기 작성
				 $("#reviewWrite").click(function() {
					 if($("#sreply_content").val()==""){
						alert("댓글 내용을 입력해주세요");
					}
					else{
						obj.url = "./reviewWrite";
					
									obj.data = {};
									obj.data.shop_idx = $("#shop_idx").text();
									obj.data.mem_id = $("#mem_id").text();
									obj.data.reviewContent = $("#sreply_content").val();
									console.log($("#shop_idx").text()+"/"+$("#mem_id").text()+"/"+$("#sreply_content").val());
									obj.success = function(data) {
										if (data.success > 0) {
											alert("댓글쓰기에 성공 했습니다.");
											listPrint();
											} else {
											alert("댓글쓰기에 실패 했습니다.");
										}
									}
					}
									ajaxCall(obj); 
				}); 
				 
			
				 function redel() {
						$('#review1:checked').each(function() { 
					        console.log($(this).val());	        
					   });
					} 


					$("#redel").click(function(){
					    $.ajax({
					        type:"post",
					        url:"./reviewDel",
					        data:{
					        	reviewdel : $('#review1').val()
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