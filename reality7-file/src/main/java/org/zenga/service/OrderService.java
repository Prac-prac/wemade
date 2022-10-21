package org.zenga.service;

import java.util.List;

import org.zenga.domain.OrderDetailVO;
import org.zenga.domain.OrderVO;

public interface OrderService {

	public  int insertOrder (List<OrderVO> breadno);

	public List<OrderDetailVO> getOrderList();
}
