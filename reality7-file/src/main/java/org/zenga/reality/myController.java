package org.zenga.reality;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zenga.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/my/*")
@AllArgsConstructor
public class myController {
	
	private OrderService service;
	
	@GetMapping(value="/order")
	public void order(Model model) {
		model.addAttribute("orderList", service.getOrderList());
	}

}
