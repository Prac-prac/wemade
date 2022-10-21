package org.sec.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/sample")
@Controller
public class SampleController {

	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	@GetMapping("/annotationMember")
	public void doMember2() {
		log.info("logined annotation member");
	}
	

	@Secured({"ROLE_ADMIN"})
	@GetMapping("/annotationAdmin")
	public void doAdmin2() {
		log.info("logined annotation admin");
	}
	
	
	@GetMapping("/all")
	public void doAll() {

	}

	@GetMapping("/member")
	public void doMember() {

	}

	@GetMapping("/admin")
	public void doAdmin() {

	}
}
