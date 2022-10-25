package org.zenga.mapper;

import java.util.List;

import org.zenga.domain.OrderDetailVO;
import org.zenga.domain.OrderVO;

public interface OrderMapper {

	public int insertOrder(List<OrderVO> order);

	public List<OrderDetailVO> getOrderList();

}
