package org.zenga.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zenga.domain.BreadVO;
import org.zenga.mapper.BreadMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BreadServiceImpl implements BreadService {

	@Setter(onMethod_ = @Autowired)
	private BreadMapper mapper;
	
	@Override
	public  List<BreadVO> get(int[] breadno) {
		return mapper.get(breadno);
	}

}
