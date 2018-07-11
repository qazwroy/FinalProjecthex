<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>공지사항 상세보기</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			div#board{
				position: relative; 
				top: 100px; 
				left: 400px; 
				/* border: 1px solid black;  */
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
	            background-color: white;
            }
            
            td{
	            width: 116px; 
	            height: 30px;
	            text-align: center;
             }
            
            input#board_category{
	            width: 100%; 
	            height: 100%;
            }
            
            span#user_id{
            	text-align: center;
            }
            
            input#board_subject{
	            width: 100%;
	            height: 100%;
            }
            
            textarea#board_content{
	            resize: none; 
	            width: 100%; 
	            height: 100%;
            }
            
            button#delete{
	            position: absolute; 
	            border: none; 
	            background-color: white; 
	            color:black; 
	            border-radius: 2px; 
	            font-size: 15px; 
	            top: 406px; 
	            left: 458px;
            } 
            
            button#update{
	            position: absolute; 
	            border: none; 
	            background-color: white; 
	            color:black; 
	            border-radius: 2px; 
	            font-size: 15px; 
	            top: 406px; 
	            left: 405px;
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
						<td>
							<span id="user_name">${dto.admin_id }</span>
						</td>
						<th>작성날짜</th>
						<td>
							<span id="board_date">${dto.notice_date }</span>
						</td>
					</tr>
	                <tr>
	                    <th>제목</th>
	                    <td colspan="5">${dto.notice_subject }</td>
	                </tr>
	                <tr>
	                    <td colspan="6"><textarea rows="15" id="board_content" readonly="readonly">${dto.notice_content }</textarea></td>
	                </tr>
				</table>
	            <button id="delete">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <button id="update" onclick="update()">수정</button>   
			</div>
		</c:if>
	</body>
	<script>
		 function update() {
			location.href="a_updateForm?notice_idx="+${dto.notice_idx};
		}
		
		 var idx = ${dto.notice_idx};
		
		$("#delete").click(function () {
			$.ajax({
				type : "post",
				url : "./a_noticeDelete",
				data : {
					idx : idx
				},
				dataType : "json",
				success : function (data) {
					if(data.success>0){
						console.log(data.success);
						alert("삭제 성공");
						location.href="./a_notice";
					}else{
						alert("삭제 실패");
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		});  
	</script>
</html>