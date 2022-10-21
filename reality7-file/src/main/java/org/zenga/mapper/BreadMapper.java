package org.zenga.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zenga.domain.BreadVO;

public interface BreadMapper {

	public  List<BreadVO> get(@Param("breadNo") int[] breadno);
}
