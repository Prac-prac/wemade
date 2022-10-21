package org.zenga.reality;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zenga.service.BreadService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/store/*")
@AllArgsConstructor
public class StoreController {
	
	private BreadService service;

	@GetMapping("/list")
	public void store() {
		
	}
	
	@GetMapping("/cart")
	public void cart(@RequestParam("breadno") int[] breadno, Model model) {
		int[] zero = {0};
		if(Arrays.equals(breadno, zero)) {
			log.info(Arrays.toString(breadno)+ "?");
			model.addAttribute("nocart", "장바구니에 담은 내역이 없습니다. store에서 상품을 담아주세요.");
		} else {
			log.info(Arrays.toString(breadno));
			model.addAttribute("goods", service.get(breadno));
		}
	}
}
