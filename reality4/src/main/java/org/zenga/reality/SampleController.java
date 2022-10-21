package org.zenga.reality;

import java.util.ArrayList;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zenga.domain.SampleDTO;
import org.zenga.domain.SampleDTOList;
import org.zenga.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	@GetMapping("/auto")
	public String parameterautocollection(SampleDTO dto) {
		log.info(""+dto);
		return "auto";
	}
	
	@GetMapping("/rp")
	public String rp(@RequestParam("n") String name, @RequestParam("a") int age) {
		log.info("name: " + name);
		log.info("age: " + age);
		return "rp";
	}
	
	@GetMapping("/list")
	public String sameparametermany(@RequestParam("ids") ArrayList<String> ids) {
		log.info("ids: "+ids);
		return "list";
	}
	
	 @GetMapping("/dtolist")
	 public String dtolist(SampleDTOList list) {
		 log.info("list dtos: "+list);
		 return "dtolist";
	 }
	 
//	 @InitBinder
//	 public void initBinder(WebDataBinder binder) {
//		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		 binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
//	 }
	 
	 @GetMapping("/setDate")
	 public String setDate(TodoDTO todo) {
		 log.info("todo:"+todo);
		 return "setDate";
	 }
	 
	 //화면까지 전달 안 되는 기본 자료형
	 @GetMapping("notgibon")
	 public String notGibon(SampleDTO dto, @ModelAttribute("page") int page) {
		 log.info("dto: "+dto);
		 log.info("page: "+page);
		 return "/sample/notgibon";
	 }
	 
	 
	 @GetMapping("returnobject")
	 public @ResponseBody SampleDTO returnObject() {
		 log.info("객체 타입 반환할 때는 json데이터 만들어내는 용도로");
		 SampleDTO dto = new SampleDTO();
		 dto.setAge(10);
		 dto.setName("홍길동");
		 return dto;
	 }
	 
	 //HTTP 프로토콜 헤더 정보나 데이터 전달
	 @GetMapping("header")
	 public ResponseEntity<String> header(){
		 String msg = "{\"name\": \"홍길동\"}";
		 HttpHeaders header = new HttpHeaders();
		 header.add("Content-Type", "application/json;charset=UTF-8");
		 return new ResponseEntity<>(msg, header, HttpStatus.OK);
	 }
	 
	 //파일 업로드
	 @GetMapping("upload")
	 public void upload() {
		 log.info("uplaod");
	 }
	 
	 @PostMapping("uploadPost")
	 public void uploadpost(ArrayList<MultipartFile> files) {
		 files.forEach(file -> {
			 log.info("name: "+file.getOriginalFilename());
			 log.info("size: "+file.getSize());
		 });
	 }
	 
	 @GetMapping("yes")
	 public void yes() {
		 
	 }
}
 