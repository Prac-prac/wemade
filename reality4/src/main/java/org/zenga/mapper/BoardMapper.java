package org.zenga.mapper;

import java.util.List;

import org.zenga.domain.BoardVO;
import org.zenga.domain.Criteria;

public interface BoardMapper {

		//@Select("select * from tbl_board where bno>0")
		public List<BoardVO> getList();
		
		// >-----페이징처리-------
				public List<BoardVO> getListWithPaging(Criteria cri);
				
		public int getTotalCount(Criteria cri);		

		public void insert(BoardVO bvo);
		
		public void insertSelectKey(BoardVO bvo);
		
		public BoardVO read(Long bno);
		
		//삭제되면 1, 해당번호 게시물 없음 0 반환
		public int delete(Long bno);

		//몇 개 데이터 수정되었는가 반환
		public int update(BoardVO bvo);
		
		
		
}
