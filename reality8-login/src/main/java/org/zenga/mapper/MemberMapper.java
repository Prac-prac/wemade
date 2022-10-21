package org.zenga.mapper;

import org.zenga.domain.MemberVO;

public interface MemberMapper {
		
	public String loginCheck(MemberVO member);

	public void register(MemberVO member);

	public String checkDuplicateId(String id);

	public MemberVO getUser(String name);

	public void updateUser(MemberVO member);

}
