package org.zenga.service;

import java.util.List;

import org.zenga.domain.BoardAttachVO;
import org.zenga.domain.BoardVO;
import org.zenga.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO vo);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO vo);
	
	public boolean remove(Long bno);
	
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);
}
