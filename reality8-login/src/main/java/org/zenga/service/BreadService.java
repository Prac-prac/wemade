package org.zenga.service;

import java.util.List;

import org.zenga.domain.BreadVO;

public interface BreadService {

	public  List<BreadVO> get( int[] breadno);
}
