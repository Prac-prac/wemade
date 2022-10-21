package org.zenga.reality;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.zenga.domain.MemberVO;
import org.zenga.service.MemberService;
import org.zenga.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/my/*")
@AllArgsConstructor
public class myController {
	
	
	private OrderService service;
	private MemberService memService;
	
	@GetMapping(value="/order")
	public void order(Model model) {
		model.addAttribute("orderList", service.getOrderList());
	}
	
	@GetMapping(value="/login")
	public void login() {

	}
	
	@PostMapping(value="/logincheck")
	public ModelAndView loginCheck(@ModelAttribute MemberVO mem, HttpSession session) {
		String name = memService.loginCheck(mem, session);

		ModelAndView modelAndView = new ModelAndView();
		if(name != null) { //로그인 성공 시
			session.setAttribute("sessionName", name);
			modelAndView.setViewName("/home");
		} else { //로그인 실패
			modelAndView.setViewName("/my/login");
			modelAndView.addObject("message", "error");
		}
		return modelAndView;
	}
	
	@GetMapping(value="/logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
	memService.logout(session); 
	 mav.setViewName("/my/login"); 
	 mav.addObject("message", "logout"); 
	  return mav;
	  }

	@GetMapping(value="/join")
	public void join() {

	}
	
	@PostMapping(value="/join")
	public String joinToDB(@ModelAttribute MemberVO mem) {
		memService.join(mem);
		return "/my/login";
	}

	@GetMapping(value="/user")
	public void user(HttpSession session, Model model) {
		String name = (String)session.getAttribute("name");
		model.addAttribute("user", memService.getUserInformation(name));
	}
	
	@PostMapping(value="/reuser")
	public String modifyToDB(@ModelAttribute MemberVO mem) {
		log.info(mem);
		memService.modifyUserInformation(mem);
		return "/home";
	}
}
