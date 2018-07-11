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
   #proInfo{
      width: 150%;
      height: 50%;
      margin-left: 60%;
      margin-top: -13%;
   }
   
   #mainimg2{
      width: 20%;
      height: 200px;
      border: 1px solid black;
      margin-left: 27%;
      margin-top: 7%;
   }
   
   #mainimg2:hover{
      cursor:pointer;
      background-color: #EAEAEA;
   }
   
   #subParent{
      width: 35%;
      height: 300px;
      border: 1px solid black;
      margin-left: 20%;
      margin-top: 1%;
   }
   
   #subImg{
      width: 97%;
      height: 250px;
      border: 1px solid black;
      margin-left: 1%;
      margin-top: 2%;
   }
   
   #subImg:hover{
      cursor:pointer;
      background-color: #EAEAEA;
   }
   
   #proname{
      margin-left: 1.7%;
   }
   #price{
      margin-left: 1%;
   }
   #size{
      margin-left: 1.7%;
   }
   
   #brand{
      margin-left: 1.7%;
   }
   
   #gender{
      margin-left: 2.3%;
   }
   
   #category{
      margin-left: 2.3%;
   }
  
   #memo{
   	margin-left: 60%;
   	margin-top: -20%; 
   }
   
   #register{
    margin-top: 1%;
    margin-left: 73%;
   }   
</style>
</head>
<body>
   <jsp:include page="./head.jsp"/>
   
   <h4>상품등록</h4>
   
   <div id="mainimg2" contenteditable="true">
	   메인이미지를 업로드 하려면 여기를 클릭<br/>*메인이미지 삽입은 필수 사항입니다
	   <input id="mainImgForm" type="hidden" name="mainContent"/>
   </div>
  
   
   <div id="proInfo">
      상품명<input id="proname" type="text"/><br/><br/>
     
      판매가격<input id="price" type="text"/><br/><br/>
           
     브랜드<select id="brand">
               <option value="0">종류를 선택해주세요</option>
               <option value="1">NIKE</option>
               <option value="2">ADIDAS</option>
               <option value="3">FILA</option>
       	     </select><br/><br/>
     
      성별<select id="gender">
               <option value="0">성별을 선택해주세요</option>
               <option value="1">남자</option>
               <option value="2">여자</option>
       	     </select><br/><br/> 
       	     
      종류<select id="category">
               <option value="0">종류를 선택해주세요</option>
               <option value="1">운동화</option>
               <option value="2">구두</option>
               <option value="3" >샌들</option>
               <option value="4">단화</option>
       	     </select><br/><br/>  	      	     
       	     
      사이즈<select id="size">
               <option value="0">신발 사이즈를 선택하세요</option>
               <option>210mm</option>
               <option>215mm</option>
               <option>220mm</option>
               <option>225mm</option>
               <option>230mm</option>
               <option>235mm</option>
               <option>240mm</option>
               <option>245mm</option>
               <option>250mm</option>
               <option>255mm</option>
               <option>260mm</option>
               <option>265mm</option>
               <option>270mm</option>
               <option>275mm</option>
               <option>280mm</option>
               <option>285mm</option>
               <option>290mm</option>
               <option>295mm</option>
               <option>300mm</option>
         </select><br/><br/>        
   </div>
   
    <div id ="subParent">
  		  서브이미지를 업로드 하세요 (*선택사항)
		  <input type="button" onclick="subFileUp()" value="업로드"/>
	      	<div id="subImg" contenteditable="true">
		   		<input id="subImgForm" type="hidden" name="subContent"/>
		 	</div>
	</div>
    
    <div id="memo">
    		상품설명<br/><textarea id="proText" rows="10" cols="60"></textarea>
    </div>
    
    <button id="register">등록</button>
    
    

</body>

<script>

	$('#register').click(function(e){
	 	$.ajax({
			type:"GET",
			url:"./proInsert",
			data:{
				pro_name: $('#proname').val(),
				pro_price: $('#price').val(),
				brand_idx: $('#brand').val(),
				gender_idx: $('#gender').val(),
				shoes_idx: $('#category').val(),
				pro_size: $('#size option:selected').text(),
				pro_memo:$('#proText').val(),
				shop_idx: '${sessionScope.shopIdx}',
				mem_id:'${sessionScope.loginId}'			
			},
			dataType:"JSON",
			success:function(data){
				  console.log(data);
		          console.log(data.success);
		          console.log(data.proIdx);
		          $("#img").attr("src",data.mainImg)
		          alert('삽입성공');
			},
			error : function(err){
				console.log(err);
			}
		}); 
	});
</script>
</html>