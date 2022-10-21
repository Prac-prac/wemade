package org.zenga.service;

import java.util.List;

import org.zenga.domain.Criteria;
import org.zenga.domain.ReplyPageDTO;
import org.zenga.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public boolean modify(ReplyVO vo);
	
	public boolean remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);

}
