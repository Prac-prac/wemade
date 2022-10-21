package org.zenga.service;

import javax.servlet.http.HttpSession;

import org.zenga.domain.MemberVO;

public interface MemberService {
	
	public String loginCheck(MemberVO member, HttpSession session);
	
	 public void logout(HttpSession session);
	 
	 public void join(MemberVO member);

	public int checkDuplicateId(String id);
	
	public MemberVO getUserInformation(String name);
	
	public void modifyUserInformation(MemberVO member);
}
