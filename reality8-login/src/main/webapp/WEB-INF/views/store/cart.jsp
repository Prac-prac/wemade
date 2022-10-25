<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./header.jsp" %>
<link rel="stylesheet" href="../resources/css/cart.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Song+Myung&display=swap" rel="stylesheet">

<!-- 아임포트 결제 api -->
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<div class="panel-body">
<h1>장바구니</h1>
<h2>담으신 내역입니다.</h2>
<table width="400px" >

	 <thead>
         <tr>
         	<th>제품</th>
             <th>제품명</th>
             <th>가격</th>
             <th colspan="3">수량</th>
         </tr>
     </thead>
     
     	<c:set var = "nocart" scope = "session" value = "${nocart}"/>
     	<c:choose>
			<c:when test="${empty nocart}">
					
						 <c:forEach items="${goods}" var="bread" varStatus="status">
				        	<tr>
				        		<td>
				        			<img class="breadimg" alt="${bread.breadNo}"  src="../resources/img/menu/menu${bread.breadNo}.png">
				        			<img class="deleteimgbtn" src="/resources/img/btnX.png">
				       			</td>
				        		<!-- <th class="suryang" ><c:out value="${status.count}" /></th>   -->
				        		<td class="breadname"><c:out value="${bread.breadName }" /></td>
				        		<td class="price"><c:out value="${bread.price }원" /></td>
				        		<td class="suryang" ><img class="image-m" src="/resources/img/minus.png"></td>
				        		<td class="suryang"><span class="cnt">1</span></td>
				        		<td class="suryang"><img class="image-p" src="/resources/img/plus.png"></td>
				        	</tr>
				        	
				       </c:forEach>
				       
				       	<tr>
								<td colspan='6' id="delivery">배송비 3000원입니다.(5만원 이상 결제시 배송비 무료)</td>
						</tr>	
				       
      		 </c:when>
			<c:otherwise>
							<tr>
								<td colspan='6'  style="color: red;"><c:out value="${nocart }" /></td>
							</tr>
			</c:otherwise>
       </c:choose>
	

</table>
</div>
<div class="panel-body">
<button id="btn-pay" class='btn btn-danger'>결제하기</button>
</div>



<%@include file="./footer.jsp" %>		
<script>
$(document).ready(function(){
	
	var str="";
	
	function sum(){
		var sum=0;
		$(".price").each(function(i){
			sum += parseInt($(".price").eq(i).text()) * Number($(".cnt").eq(i).text());
	     });
		str = "<tr><td colspan='6' id='sum'>총합 "+sum+"원입니다.</td></tr>";	
	}
	
	function resum(){
		sum();
		$( 'td' ).remove( '#sum' );
		$("table").append(str);
	}
	
	$(".deleteimgbtn, .image-p, .image-m").css("cursor","pointer");
	$(".deleteimgbtn").on("click", function(){
		$(this).parent().parent().remove();	
		resum();
		if($("tr").children().find("img.breadimg").length<1){
			$("table").html("<tr><td colspan='6' >상품이 담겨있지 않습니다.</td></tr></table>");
		}
	});
	

	

	
	
	
	
	function delivery(){
		const regex = /[^0-9]/g;
		const result = $("#sum").text().replace(regex, "");
		const number = parseInt(result);


		if(number >= 50000){
			$("#delivery").text("5만원 이상 결제로 배송비 무료입니다.");
		} else if(number < 50000){
			$("#delivery").text("배송비 3000원입니다.(5만원 이상 결제시 배송비 무료)");
		}
		
	}
	
	
	sum();
	$("table").append(str);
	 delivery();

	$(".image-p").on("click", function(){
		var num = Number($(this).parent().prev().children().html());
		$(this).parent().prev().children().html(num+1);
		resum();
		delivery();
		
	});
	$(".image-m").on("click", function(){
		var num = Number($(this).parent().next().children().html());
		if(num>1){
			$(this).parent().next().children().html(num-1);
		}
		 resum();
		 delivery();
		
	});
	
	
	
	


//아임포트 결제 api
var IMP = window.IMP; // 생략 가능
IMP.init("imp21064210");


$("#btn-pay").on("click", function(){
	const regex = /[^0-9]/g;
	const result = $("#sum").text().replace(regex, "");
	const sumOnlyNumber = parseInt(result);
	
	
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "kakaopay", 
        pay_method: "card",
        merchant_uid: "marchant_" + new Date().getTime(), //주문번호
        name: "위메이드", //상품명
        amount: sumOnlyNumber,
        customer_uid : '누군가' + new Date().getTime(), //보고 추가
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직,
   			console.log('빌링키 발급 성공', rsp)
			var orderData = [];
   			$(".breadimg").each(function(i){
   				var breadno = Number($(".breadimg").eq(i).attr("alt"));
   				var cnt = Number($(".cnt").eq(i).text().slice(-1));
   				if(cnt>0){
   					orderData.push({"breadNo":breadno, "cnt":cnt});  
   				}
   			});
   		var orderDataToJSON = JSON.stringify(orderData);
   		console.log(typeof orderDataToJSON);
            
   			$.ajax({
   				url: '/sendorder',
   				processData: false,
   				contentType: 'application/json;charset=UTF-8',
   				data: orderDataToJSON,
   				type: 'POST',
   				dataType: 'json',
   				success: function(result){
   					
   				
				}
   			}); //ajax
   			
   			
   			if(confirm("결제가 완료되었습니다. 주문내역을 확인하시겠습니까?")){
					$(location).attr("href", "http://localhost:7070/my/order");
				}
 
   			
        } else {
        
            // 결제 실패 시 로직,
    		var msg = "결제에 실패하였습니다. \n";
            msg += rsp.error_msg;
            alert(msg);
            return false;
        }
    $("#final-support-submit").submit();
    });
}); // end 결제 버튼 on click  

});
</script>