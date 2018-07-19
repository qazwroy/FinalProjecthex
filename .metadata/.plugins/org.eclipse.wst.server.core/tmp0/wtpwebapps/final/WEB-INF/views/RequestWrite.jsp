<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>구매요청 글쓰기</title>
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
             #mainimg2{
		      width: 97%;
		      height: 150px;
		      border: 1px solid black;
		      margin-left: 1%;
		      margin-top: 2%;
		   }
		   
		   #mainimg2:hover{
		      cursor:pointer;
		      background-color: #EAEAEA;
		   }
		   
		   .Btn{
		   	background-color: #FFFFFF;
		   	border : 1px none #000000;
		   }
            
            
		</style>
	</head>
	<body>
		<c:if test="${sessionScope.loginId != null}">
			<%@include file="./head.jsp"%>
			<div id="board">
				<table>
					<tr>
						<th>작성자</th>
						<td><span id="user_name">${sessionScope.loginId}</span></td>
					</tr>
	                <tr>
	                    <th>제목</th>
	                    <td colspan="3"><input type="text" id="req_subject"/></td>
	                </tr>
	                <tr>
	                	<th>
	                		<!-- <input id="mainUpBtn" type="button" onclick="mainUpload()" value="업로드"/> -->
	                		<button class="Btn" onclick="mainUpload()">업로드</button>
	                	</th>
	                	<td>
	                		<div id="mainParent"  align="center">
	                		<div id="mainimg2" contenteditable="false"></div>
	                	</div>	
	                	</td>
	                </tr>
	                <tr>
	                	<th>내용</th>
	                    <td colspan="4"><textarea rows="15" id="req_content"></textarea></td>
	                </tr>
				</table>
		            <button id="exit">목록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <button id="write">글쓰기</button>
			</div>	
		</c:if>
	</body>
	<script>
	var file = "${file}";
	console.log(file);
	$("#exit").click(function () {
		location.href="./Request"
	})
	
	
	$("#write").click(function () {
		$.ajax({
			type : "post",
			url : "./RequestWrite",
			data : {
				
				id : $("#user_name").html(),
				subject : $("#req_subject").val(),
				content : $("#req_content").val(),
				mainimg : $("#image").attr("src")
			},
			dataType : "json",
			success : function (data) {
				console.log(data);
				if(data.success>0){
					console.log(data.success);
					alert("글쓰기 성공");
					location.href="./RequestDetail?req_idx="+data.success  
				}else{
					alert("글쓰기 실패");
				}
			},
			error : function (error) {
				
			}
		});
	});
	
	//메인 DIV 클릭시 파일업로드 이벤트 실행
	function mainUpload(){
		//fileUpload 새창을 띄운다.
		var myWin = window.open("./RequestUploadFormPage","파일 업로드","width=400, height=100");
	}
	</script>
</html>