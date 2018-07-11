<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>공지사항 글쓰기</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			div#board{
				position: relative; 
				top: 100px; 
				left: 400px; 
				/* border: 1px solid black; */ 
				width: 500px; 
				height: 500px;
			}
            table, th, td{
	            border: 1px solid black; 
	            border-collapse: collapse;
            }
            table{
	            position: absolute; 
	            top: 60px; 
	            left: 10px;
            }
            th{
	            width: 117px; 
	            height: 30px; 
	           
            }
            td{
	            width: 210px; 
	            height: 30px;
	            text-align: center;
             }
            
            span#user_name{
            	text-align: center;
            }
            input#notice_subject{
	            width: 100%; 
	            height: 100%;
            }
            textarea#notice_content{
	            resize: none; 
	            width: 100%; 
	            height: 100%;
            }
            
            #exit{
	             position: absolute;
	             border: none; 
	             background-color: white; 
	             color: black; 
	             border-radius: 2px; 
	             font-size: 15px; 
	             top: 440px; 
	             left: 277px;
             } 
            #write{
	            position: absolute; 
	            border: none; 
	            background-color: white; 
	            color: black;  
	            border-radius: 2px; 
	            font-size: 15px; 
	            top: 440px; 
	            left: 333px;
            }
		</style>
	</head>
	<body>
		<c:if test="${sessionScope.adminId != null}">
			<%@include file="./adminpage.jsp"%>
			<div id="board">
				<table>
					<tr>
						<th>작성자</th>
						<td><span id="user_name">test</span></td>
					</tr>
	                <tr>
	                    <th>제목</th>
	                    <td colspan="3"><input type="text" id="notice_subject"/></td>
	                </tr>
	                <tr>
	                    <td colspan="4"><textarea rows="15" id="notice_content"></textarea></td>
	                </tr>
				</table>
	            <button id="exit">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <button id="write">글쓰기</button>
			</div>	
		</c:if>
	</body>
	<script>
	$("#write").click(function () {
		$.ajax({
			type : "post",
			url : "./noticeWrite",
			data : {
				
				id : $("#user_name").html(),
				subject : $("#notice_subject").val(),
				content : $("#notice_content").val()
			},
			dataType : "json",
			success : function (data) {
				console.log(data);
				if(data.success>0){
					console.log(data.success);
					alert("글쓰기 성공");
					location.href="./a_noticeDetail?notice_idx="+data.success  
				}else{
					alert("글쓰기 실패");
				}
			},
			error : function (error) {
				
			}
		});
	});
	</script>
</html>