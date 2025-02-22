<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){ 
   //1. 기본 페이지 L사이즈를 디폴트
   $("#dough_L").show();
   $("#dough_M").hide();
});

 //2.가격 계산하기
 function calc(){		
  	var pizzaL = 20000;
  	var pizzaR = 14000;
  	var toppingAll = $('input:checkbox[id="checkbox"]:checked').length
  	console.log(toppingAll)
  	var toppingCost = toppingAll*2000
  	console.log(toppingCost)
  	
 	if(document.getElementById('btn_L').checked){
 		 //L을 클릭했을 때 dough_L를 보여줌
   	     $("#dough_L").show();
         $("#dough_M").hide();
         
      	 //가격 계산
         var costL = pizzaL+toppingCost
 		 $("#cost").html(costL+"원 입니다.");
   		
   	}else if(document.getElementById('btn_R').checked){
   		 //M을 클릭했을 때 dough_M을 보여줌
   		 $("#dough_M").show();
         $("#dough_L").hide();
         
    	 //가격 계산
   		 var costR = pizzaR+toppingCost
   		 $("#cost").html(costR+"원 입니다.");
  		
   	}else{
   		 alert("원하시는 피자 크기와 토핑을 입력해주세요!");
   	}
 }; 
</script>
<link rel="stylesheet" type="text/css" href="Menu/css/Custom.css">
<link rel="shortcut icon" href="#">
</head>
<body>
	<!-- nav -->
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-pizza-slice"></i>
			<a href="Main/Index.jsp">8자피자</a>
		</div>
		
		<ul class="navbar__menu">
			<li><a href="pizzaMenu.do">메뉴</a></li>
			<li><a href="showCustomer.do?id=${vo.id}">마이페이지</a></li>
			<li><a href="bakset.do">장바구니</a></li>
		</ul>
		
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
		
		
	<!-- 메뉴 -->
	<div class="menu_wrap">
		<div class="menu">
			<ul>
				<li><a href="pizzaMenu.do"><span>피자</span></a></li>
				<li><a href="sideMenu.do"><span>사이드/음료</span></a></li>
				<li><a href="customMenu.do"><span>나만의 피자</span></a></li>
			</ul>
		</div>
	</div>
			
			
	<section id="section" style="margin: 0 auto; width: 1300px; position: relative;">	
		<!-- 피자 이미지 -->
		<div id="article1" class="clearfix">
			<div class="imgcut">
				<img id="dough_L" alt="foodimage" src="Menu/img/dough_L.png">
				<img id="dough_M" alt="foodimage" src="Menu/img/dough_M.png">
			</div>	
		</div>
				
		<!-- 디테일 -->
		<div id="article2" class="clearfix">
			<!-- 피자 타이틀 -->
			<div class="title">
				<div class="name">나만의 피자</div>
				<p>토핑은 내맘대로, 나만의 피자를 만들어보세요!</p>
				<hr/>
			</div>
			
			<!-- 주문 버튼 -->
			<div class="size">
				<h2 align="left">사이즈 선택</h2>
				<!-- label안에 input을 넣으면 텍스트를 클릭해도 선택이 된다! -->
				<label class="radio"><input id="btn_L" type="radio" class="checks" name="size" value="L" checked="checked" onchange="calc()"><span>L 20000원</span></label>
				<label class="radio"><input id="btn_R" type="radio" class="checks" name="size" value="R" onchange="calc()"><span>R 14000원</span></label>
			</div>
			
			<!-- 토핑 -->
			<div class="side">
				<h2 style="padding-top: 10px;">토핑</h2>
					<ul style="padding: 0px;">
						<c:forEach items="${list}" var="list">
						<li>
							<div class="side_img"><img id="foodimage" alt="foodimage" src="${list.pictureUrl}"></div>
							<div class="side_name">${list.menuName}</div>
							<div class="side_cost">${list.menuPrice}원</div>
							<label class="container">토핑 추가
							  <input type="checkbox" id="checkbox" onchange="calc()">
							  <span class="checkmark"></span>
							</label>
						</li>	
						</c:forEach>
					</ul>
			</div>

			<!-- 결제 -->
			<div class="c" style="padding-top: 50px;">
				<div class="cost_box" style="width: 550px; height: 74px; inline-height: 74px; background-color: #f9f9f9;">
					<span class="costall">총 금액</span><span id="cost" >20000원 입니다.</span>
					<a href="bascket.do" class="button" id="cartIn"><span>담기</span></a>
				</div>
			</div>
		</div>
	  </div>
	</section>
</body>
</html>