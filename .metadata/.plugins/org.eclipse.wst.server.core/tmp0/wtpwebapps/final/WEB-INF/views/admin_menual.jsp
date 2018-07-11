<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
         <style>
            #main{
            position:absolute;
            width:50%;
            height:80%;
            left:20%;
            text-align: center;
            font-size: 14px; 
            margin-top: 2%;
            font-family: Arial Black;
            line-height:120%
            }   
            .title{
            font-size:18px;
            border: 2px;
            font-weight: bold;  
            }
            #filed{
            display: inline-block;
            }
         </style>
   </head>
   <body>
   <c:if test="${sessionScope.adminId != null}">
      <%@include file="./adminpage.jsp"%>
      <div id="main">
      
         <span class="title">-회원관리-</span><p>
      '슈마니커'에 등록된 회원의 정보 확인<p>
            회원 검색 <p>
            회원 상태변경 <p>
            회원 삭제 <p>
      
         <span class="title">-후기관리-</span><p>
      물품 구매자들이 구매한 상점에 대해 <p>
            작성한 후기들을 조회<p>
               후기 검색<p>
               후기 조회<p>
               후기 삭제<p>
      
         <span class="title">-공지사항-</span><p>
            '슈마니커' 공지사항 <p>
               공지사항 등록<p>
               공지사항 변경<p>
               공지사항 상세보기<p>
               공지사항 삭제<p>   
         </ul>
      </div>
      </c:if>
   </body>
   <script>

   </script>
</html>