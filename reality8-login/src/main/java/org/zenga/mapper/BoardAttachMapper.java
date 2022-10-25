package org.zenga.mapper;

import java.util.List;

import org.zenga.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
	public void delete(String uuid);
	public List<BoardAttachVO> findByBno(Long bno);
	public void deleteAll(Long bno);
}
