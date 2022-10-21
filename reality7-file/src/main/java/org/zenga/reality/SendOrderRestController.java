package org.zenga.reality;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zenga.domain.OrderVO;
import org.zenga.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
public class SendOrderRestController {

	private OrderService service;
	
	//@RequestBody는 json데이터 받아서 다른타입으로 전환. 지금 여기선 json받아서 OrderVO로 타입변환
	@PostMapping(value="/sendorder", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void orderAjaxPost(@RequestBody List<OrderVO > order) {
		log.info(order);
		log.info(order.getClass().getName());
		if(service.insertOrder(order)>0) {
			log.info("insertOrder 성공");
		}	
	}
}
