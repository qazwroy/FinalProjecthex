<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
   <script src="./resources/js/paging.js" type="text/javascript"></script>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>테스트</title>
   <style>
      #container {
         width: 1000px;
         margin: auto;
      }
    
      table{
         width : 1000px;
         margin: 15px 0px;
         text-align: center;
         border-collapse: collapse;
         font-size: 13px;
      }
      th{
         background-color:#FDF5DC;
         height: 35px;
      }
      td{
         border-bottom: 1px solid #ffbf00;
         height: 35px;
      }
      .clubName {
         width: 500px;
      }
      .club {
         color: black;
         text-decoration: none;
      }
      .club:hover {
         text-decoration: underline;
      }
      
      
  	.paging-nav {
	  text-align: right;
	  padding-top: 2px;
	}
 
	.paging-nav a {
	  margin: auto 1px;
	  text-decoration: none;
	  display: inline-block;
	  padding: 1px 7px;
	  background: #91b9e6;
	  color: white;
	  border-radius: 3px;
	}
 
	.paging-nav .selected-page {
	  background: #187ed5;
	  font-weight: bold;
	}
      
   </style>
   </head>
   <body>
      <c:if test="${sessionScope.adminId != null}">
		 <%@include file="./adminpage.jsp"%> 
      <div id="container">
         <table id="listTable">
            <thead>
               <tr>
                <th class="clubName">공지사항</th>
                <th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>조회수</th> 
               </tr>
            </thead>
            <tbody class="tbo" >
            
            </tbody>
         </table>
      </div>
      </c:if>
   </body>
   <script>
   
      var obj = {};
      obj.error=function(e){console.log(e)};
      obj.type="POST";
      obj.dataType = "JSON";
      $(document).ready(function(){
         obj.url="./noticeList";
         obj.success = function(data){
            console.log(data);
            listPrint(data.list);

           $('#listTable').paging({
            	limit: 10,
            	rowDisplayStyle: 'block',
            	activePage: 0,
            	rows: data.list
            	});
      }
         ajaxCall(obj);
      });
      
      function listPrint(list){
         console.log(list);
         var content ="";
         list.forEach(function(item, idx){
        	 content += "<tr class ='tr1'>";
 			content += "<td class ='td1'>"+item.notice_idx+"</td>";
 			content += "<td class ='td2'><a href='./a_noticeDetail?notice_idx="+item.notice_idx+"'>"+item.notice_subject+"</a></td>";
 			content += "<td class ='td3'>"+item.notice_content+"</td>";
 			content += "<td class ='td4'>"+item.admin_id+"</td>";
 			var date = new Date(item.notice_date);
 			content += "<td class ='td5'>"+date.toLocaleDateString("ko-KR")+"</td>";
 			content += "<td class ='td6'>"+item.bHit+"</td>";
 			content += "</tr class ='tr2'>";
            content += "</tr>";
         });      
         $("#listTable").append(content);
         
      }
      
      
      function ajaxCall(param){
         $.ajax(param);
      }
   </script>
</html>