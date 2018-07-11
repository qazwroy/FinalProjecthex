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
		#wrapper {
			width: 1000px;
			margin-left: 15%;
			margin-top: 1%;
		}
		#mainImg {
			
			width: 1000px;
			height: 300px;
		}
		.newImg {
			
			width: 1200px;
			height: 200px;
			
		}
		.new {
			
			float: left;
			width: 200px;
			height: 200px;
			border: 1px solid black;
			margin: 1%;
		}
		.new:hover {
			cursor: pointer;
			background-color: black;
		}
	</style>
</head>
<body>
<%@include file="./head.jsp"%>
   
   <h1>메인 페이지 </h1>
      <div id="wrapper">

      <div id="mainImg" style="height: 200" class="cycle-slideshow" data-cycle-loader="wait"    data-cycle-timeout="1000">
         <img src="resources/img1.png" /> 
         <img src="resources/img2.jpg" />

      </div>
      <br />
   
      <h2>신상품</h2>
      <div class="newImg">
         <c:forEach items="${product}" var="product">
            <div class="new">
               <img width="200px" height="200px" src="resources/${product.img_main}"/><br/>
                 이름:${product.pro_name}<br/>
                 사이즈:${product.pro_size}<br/>
                 가격:${product.pro_price}<br/>
           </div>
         </c:forEach> <br />
      </div>
      </div>
</body>
<script>

	//메인페이지 이동시 함수실행
	$(document).ready(function(){
		getMemShopState();
		//상점이 있으면 상점인덱스 세션값 가져오기
		if('${sessionScope.shopState eq 1}'){
			getShopIdx();	
		}
	});
	
//상점개설상태 값 얻기
function getMemShopState(){
	$.ajax({
		type:"GET",
		url:"./getMemShopState",
		data:{
			id : '${sessionScope.loginId}'
		},
		dataType:"JSON",
		success:function(data){
			console.log(data);
			if(data.result != null){
				console.log(data.result);
				console.log('${sessionScope.shopState}');
			}
		},
		error : function(err){
			console.log(err);
		}
	});
}

	//상점idx 세션값 얻기
	function getShopIdx(){
		$.ajax({
			type:'GET',
			url:'./getShopIdx',
			data:{
				id: '${sessionScope.loginId}'
			},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				console.log(data.shopIdx);
				console.log('${sessionScope.shopIdx}');
			},
			error:function(err){console.log(err);}
		});	
	}

</script>
</html>
