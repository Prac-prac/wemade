package org.zenga.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.zenga.domain.MemberVO;
import org.zenga.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberMapper mapper;
	
	@Override
	public String loginCheck(MemberVO member, HttpSession session) {
		String name = mapper.loginCheck(member);
		
		if(name != null) {
			//세션 변수 저장
			session.setAttribute("userid", member.getId());
			session.setAttribute("name", name);
		}
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		//세션 초기화
		session.invalidate();
	}

	@Override
	public void join(MemberVO member) {
		mapper.register(member);
		
	}

	@Override
	public int checkDuplicateId(String id) {
		if(mapper.checkDuplicateId(id) != null) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public MemberVO getUserInformation(String name) {
		return mapper.getUser(name);
	}

	@Override
	public void modifyUserInformation(MemberVO member) {
		mapper.updateUser(member);
	}

}
