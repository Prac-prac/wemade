package org.zenga.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zenga.domain.BoardVO;
import org.zenga.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("무슨제목");
		boardVO.setContent("무슨 내용");
		boardVO.setWriter("무슨작가");
		
		service.register(boardVO);
		log.info("생성된 게시물 번호: "+boardVO.getBno());
	}
	
	@Test
	public void testGetList() {
		//service.getList().forEach(board->log.info(board));
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: "+service.remove(2L));
	}


	@Test
	public void testUpdate() {
		BoardVO boardVO = service.get(1L);
		if(boardVO == null) {
			return;
		}
		log.info("MODIFY RESULT: "+service.modify(boardVO));
	}
}
