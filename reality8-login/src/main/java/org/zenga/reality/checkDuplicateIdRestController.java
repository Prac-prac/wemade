package org.zenga.reality;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zenga.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
public class checkDuplicateIdRestController {

	private MemberService memService;
	
	@PostMapping("/checkDuplicateId")
	@ResponseBody
	public int checkDuplicateId(String id){
		return memService.checkDuplicateId(id);
	}
}
