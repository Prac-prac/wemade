package org.zenga.reality;

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
		model.addAttribute("goods", service.get(breadno));
	}
}
