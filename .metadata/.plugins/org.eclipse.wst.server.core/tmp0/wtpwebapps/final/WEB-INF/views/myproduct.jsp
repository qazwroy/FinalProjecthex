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
	#sel{
		margin-top: -1%;   
	}
	#tab{
		margin-left: 10%; 		
		margin-left: 0%;
		
	}
	#tab table{
		width: 80%;
	}
	#buybtn{
		margin-left: 85.5%;  
		margin-top: 0%;      
		position: absolute;
		background-color: white;
		color: black;
		outline: 0;
		border: 0;
		font-size: 15px;  
		text-decoration: none;
		cursor: pointer;
	}
	#buybtn:hover{
		background-color: black;
		color: white;
		outline: 0;
		border: 0;
	}
	#buydel{
		margin-left: 85.5%;  
		margin-top: 15%;      
		position: absolute;
		background-color: white;
		outline: 0;
		border: 0;
		font-size: 15px;  
	}
	#buydel:hover {
		background-color: black;
		color: white;
		outline: 0;
		border: 0;
	}
	#sel2{
		cursor: pointer;		
	}
	#tr1 tr{
		cursor: pointer;
	}
	#tr1 tr:hover {
		background-color: #EAEAEA;
	}
	
	.pop-layer1 .pop-container1 {
	  padding: 20px 25px;
	}
	
	.pop-layer1 p.ctxt {
	  color: #666;
	  line-height: 25px;
	}
	
	.pop-layer1 .btn-r {
	  width: 100%;
	  margin: 10px 0 20px;
	  padding-top: 10px;
	  border-top: 1px solid #DDD;
	  text-align: right;
	}
	
	.pop-layer1 {
	  display: none;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 410px;
	  height: auto;
	  background-color: #fff;
	  border: 5px solid black;
	  z-index: 10;
	}
	
	.dim-layer1 {
	  display: none;
	  position: fixed;
	  _position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 100;
	}
	
	.dim-layer1 .dimBg1 {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: #000;
	  opacity: .5;
	  filter: alpha(opacity=50);
	}
	
	.dim-layer1 .pop-layer1 {
	  display: block;
	}
	
	a.btn-layerClose {
	  display: inline-block;
	  height: 25px;
	  padding: 0 14px 0;	  
	  background-color: black;
	  color: white;
	  font-size: 13px;
	  color: #fff;
	  line-height: 25px;
	  text-decoration: none;
	}
	
	a.btn-layerClose:hover {
	  background-color: white;
	  color: black;
	}
	#ok{
		background-color: black;
		color: white;
		border: 0;
		outline: 0;
		margin-left: 80%;
		margin-top: -6%;
	}
	#ok:hover {
		background-color: white;
		color: black;
	}
	.btn-example1{
		color: black;
		text-decoration: none;
	}
	.btn-example1:hover{
		background-color: black;
		color: white;
	}
	

	
}
</style>
</head>
<body>
	<%@include file="./mypage.jsp"%>


	<h3>상품리스트</h3>
	<div>
		<select id="sel">
			<option>최신등록순</option>
			<option>오래된순</option>
		</select>	
	</div>  	<!-- <a > -->
	<button id="buybtn" onclick='location.href = "./regProduct"'>상품등록</button>
	<button id="buydel">상품삭제 </button>
	<div id=tab>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>번호</th>
					<th>상품정보</th>
					<th>등록날짜</th>
					<th>상품상태</th>
					<th>상태 변경</th>
				</tr>
			</thead>
			<tbody  id="tr1">
			
					<c:forEach items="${product}">
						<tr>
							<th><input type="checkbox"/></th>
							<th>1번</th>
							<th>나이키</th>
							<th>${pro.xxx}</th>
							<th>
								<select id="sel2">
									<option selected="selected">판매중</option>
									<option onclick="location.href='#layer3'" class="btn-example1">판매완료</option>
								</select>
							</th>
						</tr>
					</c:forEach>
				
				<tr>
					<th><input type="checkbox"/></th>
					<th>2번</th>
					<th>아디다스</th>
					<th>2018-06-03</th>
					<th>판매중</th>
					<th><a href="#layer3" class="btn-example1">변경</a></th> 
				</tr>
				<tr>
					<th><input type="checkbox"/></th>
					<th>3번</th>
					<th>리복</th>
					<th>2018-05-03</th>
					<th>
						<select>
							<option>판매중</option>
							<option>판매완료</option>
						</select>
					</th>
				</tr>
				<tr>
					<th><input type="checkbox"/></th>
					<th>3번</th>
					<th>리복</th>
					<th>2018-05-03</th>
					<th>
						<select>
							<option>판매중</option>
							<option>판매완료</option>
						</select>
					</th>
				</tr>
				<tr>
					<th><input type="checkbox"/></th>
					<th>3번</th>
					<th>리복</th>
					<th>2018-05-03</th>
					<th>
						<select>
							<option>판매중</option>
							<option>판매완료</option>
						</select>
					</th>
				</tr>
			
			</tbody>
			
		
		</table>
		
		<div class="dim-layer1">
    <div class="dimBg1"></div>
    <div id="layer3" class="pop-layer1">
        <div class="pop-container1">
            <div class="pop-conts">
                <!--content //-->
                <h4 class="ctxt mb20">구매자의 아이디를 입력하세요</h4>
                   <input style="height: 15px" id="shopname" type="text"><br>
                   <button id="ok">확인</button>

                

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">판매 완료</a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
    </div>
		

		
		
		
		
	</div>
	
	
</body>
<script>


$('.btn-example1').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});
function layer_popup(el){

    var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg1');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer1').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer1').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBg1').click(function(){
        $('.dim-layer1').fadeOut();
        return false;
    });

}

</script>


</html>