package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

//MayBatis 어노테이션 이용해 sql을 메서드에 추가
public interface TimeMapper {
	@Select("SELECT sysdate FROM dual")
	public String getTime();
	
	//Maybatis 어노테이션과 sql 존재하지x -> 실제 sql을 TimeMapper.xml에서 
	public String getTime2();
}
