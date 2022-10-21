package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("register")
	//RedirectAttributes 등록 작업 끝나고 다시 목록화면으로 돌아갈 때 새롭게 등록된 게시물 번호 전달 위해
	public String register(BoardVO vo, RedirectAttributes rttr) { 
		log.info("register: " + vo);
		service.register(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping("get")
	//파라미터명과 변수명 기준으로 매칭하기에 생략해도 무관하나 @RequestParam 해줌
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("modify")
	//boolean으로 성공 여부 처리해 저장
	public String modify(BoardVO vo, RedirectAttributes rttr) {
		log.info("modify" + vo);
		if(service.modify(vo)) {
			rttr.addFlashAttribute("result", "succes");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove.."+bno);
		if(service.remove(bno)) {
			rttr.addAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
}
