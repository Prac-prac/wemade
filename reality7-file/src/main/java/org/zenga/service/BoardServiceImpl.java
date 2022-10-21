package org.zenga.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zenga.domain.BoardAttachVO;
import org.zenga.domain.BoardVO;
import org.zenga.domain.Criteria;
import org.zenga.mapper.BoardAttachMapper;
import org.zenga.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardVO vo) {
		log.info("레지스터레지스터레지스터"+vo);
		mapper.insertSelectKey(vo);
		if(vo.getAttachList() == null || vo.getAttachList().size() <=0 ) {
			return;
		}
		vo.getAttachList().forEach(attach -> {
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BoardVO get(Long bno) {
		return mapper.read(bno);
	}
	
	@Transactional
	@Override
	public boolean modify(BoardVO vo) {
		attachMapper.deleteAll(vo.getBno()); //첨부파일 전부 삭제하고 다시 추가하는 방식으로
		 boolean modifyResult = mapper.update(vo) == 1;
		 if(modifyResult && vo.getAttachList() != null && vo.getAttachList().size() >0) {
			 vo.getAttachList().forEach(attach -> {
				 attach.setBno(vo.getBno());
				 attachMapper.insert(attach);
			 });
		 }
		 
		 return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		attachMapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}


//	@Override
//	public List<BoardVO> getList() {
//		return mapper.getList();
//	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return attachMapper.findByBno(bno);
	}
	
	
}
