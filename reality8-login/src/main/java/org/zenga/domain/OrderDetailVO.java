package org.zenga.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int orderNo;
	private int breadNo;
	private String breadName;
	private int price;
	private int cnt;
	private Date orderDate;
	
}
