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
<script src="resources/jquery-1.11.3.min.js"></script>
<script src="resources/star.js"></script>

<title>슈마니커~ ^^</title>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('resources/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
.star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover{background-image: none;}
.star-input>.input>label[for="1"]{width:30px;z-index:5;}
.star-input>.input>label[for="2"]{width:60px;z-index:4;}
.star-input>.input>label[for="3"]{width:90px;z-index:3;}
.star-input>.input>label[for="4"]{width:120px;z-index:2;}
.star-input>.input>label[for="5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

<style>
   #tab{
      margin-left: 5%; 
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
   /* #reviewDel{
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
   } */
   #rev1{
      margin-left: 20%; 
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
      margin-left: 70%;  
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
   .reviewdel{
      border: none;
      background: transparent;

   }
   #reviewcontent{
      border : none;
   }
   .reviewupdate{
   display:none;
   }
   #starRateup{
   display:none;
   }
   
</style>
</head>
<body>
   <%@include file="./mypage.jsp"%>
   
   <h3>상점후기 내역</h3>
   <button id="reviewWrite">글등록 </button>
   
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
               <th>구매자</th>
               <th>후기내용</th>
               <th>날짜</th>
               <th>평점</th>
               <th></th>
            </tr>
         </thead>
         <tbody id="myReview">
         </tbody>
      </table>      
   </div>
   
   
</body>
<script>
         var obj = {};//초기화   
         obj.type = "post";
         obj.dataType = "json";
         obj.enctype = "multipart/form-data";
         obj.data={};
         obj.error = function(e) {
            console.log(e)
         };
         $(document).ready(function() {
            listPrint();
         });
         //후기 리스트 출력
         function listPrint() {
            
            obj.url = "./reviewList";
            obj.data = {};
            obj.data.shop_idx = '${sessionScope.shopIdx}';
            obj.success = function(data) {
               console.log(data);
               var content = "";
               var totalscore = 0;
               var reviewcnt =0;
               var avgRate = 0
               data.reviewList.forEach(function(item, index) {
                    content += "<tr>";
                      content += "<td id='reviewWriter'>"+item.mem_id+"</td>";
                      content += "<td><input id ='reviewcontent'  type =text class="+item.sreply_idx+" value="+item.sreply_content+" readonly/></td>";
                      var date = new Date(item.sreply_date);
                      content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>";
                      content +="<td>"
                               +"<span class='star-input'>"
                              +"<span class='input'>"
                               +"<input type='radio' name="+item.sreply_idx+" id="+item.sreply_star+" checked>"
                               +"<label for="+item.sreply_star+">"+item.sreply_star+"</label>"
                               +"</span>"
                               +" <select id='starRateup' >"
                                 +"<option selected='selected'>5</option>"
                                +"<option>4</option>"
                                +"<option>3</option>"
                                +"<option>2</option>"
                                +"<option>1</option>"
                          +"</select>"
                                +"<output id='out' for='star-input'><b>"+item.sreply_star+"</b>점</output>"   
                              +"</span>"
                              +"</td>";
                           totalscore += item.sreply_star;
                           reviewcnt += 1;
                           
                      if(item.mem_id=='${sessionScope.loginId}'){
                         content += "<td><input id="+item.sreply_idx+" type=button class='reviewdel' value='삭제'/></td>"
                         content += "<td ><input id="+item.sreply_idx+" name=update"+item.sreply_idx+" type=button class='reviewupdate'  value='완료'/>"
                                        +"<input id="+item.sreply_idx+" name=form"+item.sreply_idx+" type=button class='reviewupdateform'  value='수정'/>"
                                           + "</td>";

                         
                         content += "</tr>";
                      }else{
                         content += "</tr>";
                      }
                      console.log(totalscore/reviewcnt);
                      avgRate=totalscore/reviewcnt;
                  });

            $("#myReview").empty();
            $("#myReview").append(content);
            $("#avgRate").empty();
            $("#avgRate").append(avgRate);
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
                     obj.data.mem_id = '${sessionScope.loginId}';
                     obj.data.sreply_content = $("#sreply_content").val();
                     obj.data.sreply_star=$("#starRate option:selected").val();
                     console.log($("#shop_idx").text()+"/"+obj.data.mem_id+"/"+$("#sreply_content").val());
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
            /*후기  삭제 */
            $(document).on('click','.reviewdel', function() {
               $.ajax({
                  type : "post",
                  url : "./reviewdel",
                  data : {
                     delreply : $(this).attr('id')
                  },
                  dataType : "json",
                  success : function(data) {//인자 값은 서버에서 주는 메세지
                     if (data.success) {
                        //listPrint(data.list)
                        alert("삭제 성공")
                        location.reload();
                     } else {
                        alert("삭제 실패")
                     }
                  }
               });
               ajaxCall(obj);
            });
            
            
            
            //후기 수정
              $(document).on('click', '.reviewupdateform', function() {   
                var upcomment = $(this).attr("id");
                console.log(upcomment);
                $("input[class=" + upcomment + "]").css("border","1px solid #004C63");
                $("input[class=" + upcomment + "]").attr("readonly",false);
                $(".input").css("display","none");
                $("#starRateup").css("display","inline");
                $("#out").css("display","none")
                
                 $("input[name= form"+upcomment+"]").css("display","none");
              $("input[name= update"+upcomment+"]").css("display","inline"); 

              
              
            $(document).on('click', '.reviewupdate', function() {
               console.log("수정");
                  var sreply_idx = $(this).attr('id');
                
                  var reviewcontent = $("input[class="+sreply_idx+"]").val();
                  //var time=$("inpput[class=" +upcomment+"]").id;
                  //var content= $(".edit").val();   

                  obj.url = "./reviewupdate";
                  obj.data = {};
                  obj.data.sreply_idx = sreply_idx;
                  obj.data.reviewcontent = reviewcontent;
                  obj.data.sreply_star=$("#starRateup option:selected").val();
                  console.log(obj.data.sreply_idx+"/"+obj.data.reviewcontent);
                  obj.success = function(data) {
                     console.log(data);
                     if (data.success) {
                        alert("수정에 성공하였습니다.")
                        location.reload();
                     } else {
                        alert("수정 실패")
                     }

                  };

                  ajaxCall(obj);
               
               });
            });

            
               function ajaxCall(param) {
                   console.log(param);
                   $.ajax(param);
                }

   
</script>
</html>