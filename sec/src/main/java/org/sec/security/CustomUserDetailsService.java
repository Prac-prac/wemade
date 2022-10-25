package org.sec.security;

import org.sec.domain.CustomUser;
import org.sec.domain.MemberVO;
import org.sec.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper membermapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("load User by UserName :" +username);
		MemberVO vo = membermapper.read(username);
		log.warn("queried by member mapper: " + vo);
		return vo == null? null : new CustomUser(vo);
	}

}


