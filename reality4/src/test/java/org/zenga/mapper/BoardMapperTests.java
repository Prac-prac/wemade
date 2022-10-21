package org.zenga.mapper;

import java.util.List;

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
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(b->log.info(b));
	}

	@Test //bno값 null이게 됨
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새 작성글");
		vo.setContent("새 작성 내용");
		vo.setWriter("새 작가");
		
		mapper.insert(vo);
		log.info(vo);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새 작성글 select key");
		vo.setContent("새 작성 내용 select key");
		vo.setWriter("새 작가 select key");
		
		mapper.insertSelectKey(vo);
		log.info(vo);

	}

	@Test
	public void testRead() {
		BoardVO vo = mapper.read(5L);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		int trueorfalse=mapper.delete(3L);
		log.info("DELETE True/False: "+trueorfalse);
	}

	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setBno(5L);
		vo.setTitle("수정된 작성글");
		vo.setContent("수정된 작성 내용");
		vo.setWriter("수정된 작가");
		
		log.info("UPDATE count: "+mapper.update(vo));
		
	}
	
	@Test
	public void testPaging() {
		Criteria criteria = new Criteria(3, 10);
		
		List<BoardVO> list = mapper.getListWithPaging(criteria);
		list.forEach(board -> log.info(board.getBno()));
	}
	
	@Test
	public void testSearch() {
		Criteria cri= new Criteria();
		cri.setKeyword("새로");
		cri.setType("TC");
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board->log.info(board));
	}
}
