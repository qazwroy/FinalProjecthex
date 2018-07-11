<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<style>
	#myname{
	 	margin-left: 5%;	 	
	}
	#mymenu{
		margin-top: 2%;
		border-bottom: 1px solid black;
	}
	#mymenu a{
		color: black;
		text-decoration: none;	
		margin-left: 12%;		
		font-size: large;
		font-style: inherit; 
	}
	#mymenu a:hover{
		background-color: black;
		color: white;
	}
	#sel{
		margin-left: 85%; 
		margin-top: -2%;
	}
	

	.pop-layer .pop-container {
	  padding: 20px 25px;
	}
	
	.pop-layer p.ctxt {
	  color: #666;
	  line-height: 25px;
	}
	
	.pop-layer .btn-r {
	  width: 100%;
	  margin: 10px 0 20px;
	  padding-top: 10px;
	  border-top: 1px solid #DDD;
	  text-align: right;
	}
	
	.pop-layer {
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
	
	.dim-layer {
	  display: none;
	  position: fixed;
	  _position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 100;
	}
	
	.dim-layer .dimBg {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: #000;
	  opacity: .5;
	  filter: alpha(opacity=50);
	}
	
	.dim-layer .pop-layer {
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
	#shopname{
		margin-left: 28%;
	}
	#shop_idx{
		/* display: none; */
	}
	#shop
	.pop-conts h4{
		margin-left: 27%; 
	}
	.btn-example{
		background-color: black;
		color: white;
		text-decoration: none;
	}
	.btn-example:hover{
		background-color: white;
		color: black;
	}
	
</style>
</head>
<body>
	<%@include file="./head.jsp"%>
	
	<c:if test="${sessionScope.shopState eq 0}">
		<div id="myname">
			<h2 align="center">상점이 없습니다. 상점을 개설 하여 주세요</h2>
			<h4 align="center"><a href="#layer2" class="btn-example">상점개설</a></h4>
		</div>
	</c:if>
	
	<c:if test="${sessionScope.shopState eq 1 }">
		<div id="shopInfo"></div>
	</c:if>
	
	
	
	
	<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <h4 class="ctxt mb20">상점 이름을 입력 하세요</h4>
                   <input id="shopname" type="text">
				   <input type ="button" value="중복확인" onclick="shopOverlay()"/>
                </p>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">확인</a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
    </div>
	
	<div id="mymenu">
		<a href="./myproduct">상품등록</a>
		<a href="./mybuy">구매내역</a>
		<a href="./mycartCall">찜목록</a>
		<a href="./myreview">상점후기 </a>
		<a href="./myinfo">개인정보 수정</a>	
	</div>
	
</body>
<script>

	$(document).ready(function(){
		if('${sessionScope.shopState eq 1}'){
			getShopInfo();	
		}
	});
	
	$('.btn-example').click(function(){
	    var $href = $(this).attr('href');
	    layer_popup($href);
	});
	
	function layer_popup(el){

	    var $el = $(el);        //레이어의 id를 $el 변수에 저장
	    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수
	
	    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
	
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
	    	if($('#shopname').val() != '' && overChk == true){
	    		isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.	
	    	}	        
	        return false;
	    });
	
	    $('.layer .dimBg').click(function(){
	        $('.dim-layer').fadeOut();
	        return false;
	    });

}
	//상점이름 입력 후 확인 클릭시 값 INSERT
	$('.btn-layerClose').click(function(){
		
		if($('#shopname').val() == ''){
			alert('상점명은 반드시 기입하셔야 합니다. 다시 입력하여 주세요');
		}else{
			if (!overChk) {
				alert("상점명 중복 체크를 실행 해 주세요!");
				$('#shopname').focus();//포커스 이동
			}
			else if($('#shopname').val() != ''){
				$.ajax({
					type:"GET",
					url:"./setShopName",
					data:{
						shopName : $('#shopname').val() ,
						id : '${sessionScope.loginId}'
					},
					dataType:"JSON",
					success:function(data){
						console.log(data);
						if(data.success>0){
							console.log('insert 성공');
							upShopState();
						}
					},
					error : function(err){
						console.log(err);
					}
				}); 
			}
		}
	});
	
	var overChk = false;//중복체크 값
	//상점명 중복 확인
	function shopOverlay(){
		$.ajax({
			type:"GET",
			url:"./shopOverlay",
			data:{
				shopName : $('#shopname').val()
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				if(data.overlay){
					alert('이미 사용중인 상점명입니다. 다른 상점명을 입력해 주세요');
					$('#shopname').val('');
					$('#shopname').focus();
				}else{
					alert("사용 가능한 상점명 입니다.");
					$('#shopname').css('color', 'green');
					overChk = true;
				}
			},
			error : function(err){
				console.log(err);
			}
		});
	}
	
	//상점개설 여부 상태값 UPDATE
	function upShopState(){
		$.ajax({
			type:"GET",
			url:"./upShopState",
			data:{
				idx : '${sessionScope.loginId}'
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				if(data.success > 0){
					console.log('상태값 수정완료');
					getMemShopState();
				}
			},
			error : function(err){
				console.log(err);
			}
		}); 
	}
	
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
					alert('상점이 개설되었습니다.');
					location.href = "./mypage?id='${sessionScope.loginId}'";
				}
			},
			error : function(err){
				console.log(err);
			}
		});
	}
	
	//상점정보 출력
	function getShopInfo(){
		$.ajax({
			type:"GET",
			url:"./getShopInfo",
			data:{
				id : '${sessionScope.loginId}'
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				if(data.dto != null){
					$('#shopInfo').append(
					"<h3>상점 이름 =" + data.dto.shop_name + "<br/>" +
					"상품판매 개수 = " + data.dto.shop_sellcount + "<br/>" +
					"상점 개설 날짜 = " + data.dto.shop_date + "<br/> </h3>" +
					"<h3>상점 주인=<div id='mem_id'>"+data.dto.mem_id+"</div></h3>"+
					"<div id='shop_idx'>" + "${sessionScope.shopIdx}"+"</div>"
					);
					
				}
				
			},
			error : function(err){
				console.log(err);
			}
		});
	}
</script>

</html>