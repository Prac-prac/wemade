<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Song+Myung&display=swap" rel="stylesheet">
<%@include file="../store/header.jsp" %>
<style>
h1{
	position: relative;
	top: 160px;
	margin: 10px;
	left: 85px;
	width: 700px;
	font-size: 36px;
	font-family: 'Gugi', cursive;
}

table{
	position: relative;
	top: 90px;
	margin: 100px;
	width: 800px;
}

td, th{
	text-align:center;
	vertical-align: middle;
	border: 1px solid black;
	width: 120px;
	height: 30px;
}
.breadname{
	width: 200px;
}
td.sum{
	text-align: end;
}
</style>



<h1>주문내역</h1>
<table width="400px">

	 
     	<c:set var="pricesum" value="0"/>
		 <c:forEach items="${orderList}" var="list" varStatus="status">

		 <c:set var="nextOrderNo" value="${orderList[status.index + 1].orderNo}"/>
		 
		 <c:if test="${status.index ==1}">
	      <thead>   
	         <tr>
	         	<th colspan="4">주문날짜: <c:out value="${list.orderDate }" /></th>
	       	 </tr>
   	       	 <tr>
	         	<th>주문번호</th>
	             <th>제품명</th>
	             <th>가격</th>
	             <th>수량</th>
         </tr>
     </thead>
        	
 		 </c:if>
			 
        	<tr>
        		<td><c:out value="${list.orderNo }" /></td>
        		<td class="breadname"><c:out value="${list.breadName }" /></td>
        		<td class="price"><c:out value="${list.price }원" /></td>
        		<td class="suryang"><c:out value="${list.cnt }개" /></td>
        	</tr>
        		
       		 	<c:set var="pricesum" value="${pricesum + list.price*list.cnt}"/>
       		 	
       		 	<c:if test="${list.orderNo != nextOrderNo}">
       		 	<tr>
       		 		<td colspan="4" class="sum'">총 주문금액 ${pricesum}원</td>
       		 	</tr>
	       		 	</table>
	       		 	<table>
	       		 	<c:set var="pricesum" value="0"/>
	       		 	<tr>
			         	<th colspan="4">주문날짜: <c:out value="${list.orderDate }" /></th>
			       	 </tr>
		   	       	 <tr>
			         	<th>주문번호</th>
			             <th>제품명</th>
			             <th>가격</th>
			             <th>수량</th>
		         	</tr>
      		 	</c:if>
	        	
       </c:forEach>
       
       

</table>
<%@include file="../store/footer.jsp" %>		
<script>

</script>