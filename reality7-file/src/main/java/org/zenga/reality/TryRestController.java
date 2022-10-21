package org.zenga.reality;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zenga.domain.TryRequestBody;
import org.zenga.domain.TryRestVO;

import lombok.extern.log4j.Log4j;


//기존 JSP 아닌 순수한 데이터(ex. 일반문자열, json, xml) 반환 
@RestController
@RequestMapping("/rest")
@Log4j
public class TryRestController {
	
	@GetMapping(value="/getText", produces = "text/plain; charset=UTF-8")
	public String getText() {
		return "안녕하세용";
	}
	
	@GetMapping(value="/getInstance", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public TryRestVO getInstance() {
		return new TryRestVO(112, "스타", "로드");
	}
	
	@GetMapping("/getList")
	public List<TryRestVO> getList(){
		return IntStream.range(1, 10).mapToObj(i -> new TryRestVO(i, i+"first", i+"last")).collect(Collectors.toList());
	}
	
	@GetMapping("/getMap")
	public Map<String, TryRestVO> getMap(){
		Map<String, TryRestVO> map = new HashMap<>();
		map.put("first", new TryRestVO(111, "그루트", "주니어"));
		return map;
	}
	
	@GetMapping(value="/check", params= {"height","weight"})
	public ResponseEntity<TryRestVO> check(Double height, Double weight){
		TryRestVO vo = new TryRestVO(0, ""+height, ""+weight);
		ResponseEntity<TryRestVO> result = null;
		if(height<150) {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		} else {
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}
		return result;
	}
	
	//@PathVariable : rest방식에서 url경로의 일부 파라미터로 사용할 떄 이용
	//@RequestBody : JSON 데이터를 원하는 타입의 객체로 변환해야 하는 경우
	@GetMapping("/product/{cat}/{pid}") //{}로 변수명 지정
	public String[] getPath(@PathVariable("cat") String cat, @PathVariable("pid") String pid) { //@PV로 변수값 가져와
		return new String[] {"category: " +cat, "productid: "+pid};
	}
	
	@PostMapping("/rb")
	public TryRequestBody convert(@RequestBody TryRequestBody rb) {
		return rb;
	}
}
