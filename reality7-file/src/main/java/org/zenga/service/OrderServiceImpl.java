package org.zenga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zenga.domain.OrderDetailVO;
import org.zenga.domain.OrderVO;
import org.zenga.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService {


	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;

	
	@Override
	public int insertOrder(List<OrderVO> order) {
		return mapper.insertOrder(order);
		 
	}


	@Override
	public List<OrderDetailVO> getOrderList() {
		return mapper.getOrderList();
		
	}


}
