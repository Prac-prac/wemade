package org.zenga.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zenga.domain.Criteria;
import org.zenga.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long bno);
	
	public int delete(Long rno);
	
	public int update(ReplyVO reply);

	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	//해당 게시물의 전체 댓글의 숫자
	public int getCountByBno(Long bno);
}
