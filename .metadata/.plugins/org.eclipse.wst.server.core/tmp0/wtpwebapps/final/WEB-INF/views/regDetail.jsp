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
      width: 97%;
      height: 105%;
      border: 1px solid black;
      margin-left: 1%;
      margin-top: 2%;
   }
   

   #mainParent{
    margin-left: 12%;
    width: 37%;
    height: 200px;   
    margin-top: 7%; 
}
   
   
   #subParent{
      width: 40%;
      height: 300px;      
      margin-left: 30%;
      margin-top: 1%;
   }
   
   #subImg{
         position: absolute;
       width: 36%;
       height: 30%;
       margin-left: -0.4%;
       margin-top: 2%;
       border: 1px solid black;
   }
   
   
   
   #proname{
      margin-left: 1.65%;
      border: 0px;
   }
   #price{
      margin-left: 1%;
      border: 0px;
   }
   #size{
      margin-left: 1.65%;
      border: 0px;
   }
   
    #brand{
      margin-left: 1.7%;
      width: 7.4%;
      border: 0px;
   }
   
   #gender{
      margin-left: 2.4%;
      width: 7.4%;
      border: 0px;
   }
   
   #category{
      margin-left: 2.4%;
      width: 7.4%;
      border: 0px;
   }
  
   #memo{
         margin-left: 21%;
           margin-top: 3%;
   }
   
   #subimg2{
      width: 900px;
      height: 300px;
   }
   
   #proText{
         border-top: 2px solid black;
         border-bottom: 0px;
         border-left: 0px;
         border-right: 0px;
   }
   
   #addr{
        margin-left: 1%;
      border: 0px; 
   }
   
   #register{
    margin-top: 1%;
    margin-left: 73%;
    background-color: black;
    color: white;
    cursor: pointer;
    border: 0;
   }   
   #register:hover{
       background-color: white;
       color: black;
   } 
   #mainUpBtn{                
       position: absolute;
       margin-top: 1.88%;
       margin-left: -24.2%;
       width: 35.5%;
       height: 26.4%;
       background-color: white;
       border:0;
       cursor: pointer;
       font-size: 40px;
       border: 0;
   }
   #mainUpBtn:hover {
      background-color: black;
      color: white;
   } 
   #proText{
      margin-top: 2%;
      width: 900px;
      height: 250px;
   }
   #cart1{
      margin-top: -43%;  
      margin-left: 65%;   
      position: absolute; 
      width: 4%;
      height: 25px; 
      background-color: black;
      color: white;
      border:0;
      cursor: pointer;     
      border: 0;
   }
   #cart1:hover{
      background-color: white;
      color: black;
   }
   #mypage1{
      position: absolute;        
      width: 7%;
      background-color: black;
      
      color: white;
       border:0;
       cursor: pointer;   
       height: 35px;  
       border: 0;
   }
   #mypage1:hover{
      background-color: white;
      color: black;
   }
   #add1{
      position: absolute;
      margin-top: -43%;  
      margin-left: 71%;   
      width: 5%;
      height: 25px; 
      background-color: black;
      color: white;
       border:0;
       cursor: pointer;     
       border: 0;
   } 
   #add1:hover{
      background-color: white;
      color: black;
   }
   #proid{
      margin-top: 6.5%;
      margin-left: 20.7%;
      position: absolute;      
      width: 300%;
   }
   
</style>
</head>
<body>

   <c:if test="${sessionScope.pathSession ne null}">
      <c:remove var="pathSession" scope="session"/>
   </c:if>

   <jsp:include page="./head.jsp"/>
   
   <div id="mainParent" align="center">           
         <img width="300px" height="300px" src="resources/upload/${product.img_main}"/>      
   </div>
   
   <div id="proid">
         <input type="button" value="${product.mem_id}님의 상점가기" id="mypage1" 
            onclick="location.href = './myproduct?shopIdx=${product.shop_idx}'">
   </div>

   <div id="proInfo">
      상품명<input id="proname" type="text" value="${product.pro_name}" readonly="readonly"/><br/><br/>    
      판매가격<input id="price" type="text" value="${product.pro_price}" readonly="readonly"/><br/><br/>
      
      
    <c:if test="${product.brand_idx eq 1}">
       브랜드<input id="brand" type="text" value="NIKE" readonly="readonly"/><br/><br/> 
    </c:if>
    <c:if test="${product.brand_idx eq 2}">
       브랜드<input id="brand" type="text" value="Adidas" readonly="readonly"/><br/><br/> 
    </c:if>         
    <c:if test="${product.brand_idx eq 3}">
       브랜드<input id="brand" type="text" value="FILA" readonly="readonly"/><br/><br/> 
    </c:if>
    
    <c:if test="${product.gender_idx eq 1}">
       성별<input id="gender" type="text" value="남성화" readonly="readonly"/><br/><br/>
    </c:if>
    <c:if test="${product.gender_idx eq 2}">
       성별<input id="gender" type="text" value="여성화" readonly="readonly"/><br/><br/>
    </c:if>
    
    <c:if test="${product.shoes_idx eq 1}">
       종류<input id="category" type="text" value="운동화" readonly="readonly"/><br/><br/>
    </c:if>
    <c:if test="${product.shoes_idx eq 2}">
       종류<input id="category" type="text" value="구두" readonly="readonly"/><br/><br/>
    </c:if> 
    <c:if test="${product.shoes_idx eq 3}">
       종류<input id="category" type="text" value="샌들" readonly="readonly"/><br/><br/>
    </c:if>
    <c:if test="${product.shoes_idx eq 4}">
       종류<input id="category" type="text" value="단화" readonly="readonly"/><br/><br/>
    </c:if>
                                               
      사이즈<input id="size" type="text" value="${product.pro_size}" readonly="readonly"/><br/><br/> 
      
       거래지역<input id="addr" type="text" value="${addr}" readonly="readonly"/><br/><br/> 
   </div>
   
  
   
  
    
    <div id="memo">
    <br/>
          <div id="subimg2">
          <c:if test="${subImg['0'] ne null}">
             <c:forEach items="${subImg}" var="sub">
                   <img width="290px" height="290px" src="resources/upload/${sub}"/> 
             </c:forEach>
          </c:if>
          <c:if test="${subImg['0'] eq null }">
                <h3>서브이미지가 없는 상품.</h3>
          </c:if>
           </div>   
           <h4 style="height: 0px">상품내용</h4>
          <textarea id="proText" rows="10" cols="60" readonly="readonly">${product.pro_memo}</textarea>  
    </div>
    
            <input type="button" value="찜" id="cart1">   
           <input type="button" value="연락하기" id="add1">
</body>

<script>

  
</script>
</html>