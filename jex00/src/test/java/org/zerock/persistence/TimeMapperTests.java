package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//정상적으로 동작한다면, 스프링 내부에 TimeMapper 타입으로 만들어진 스프링 객체(빈)이 존재한다는 뜻
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@ContextConfiguration(classes={org.zerock.config.RootConfig.class})
@Log4j
public class TimeMapperTests {

	//스프링이 인터페이스 이용해 객체 생성
	@Setter(onMethod_ = @Autowired )
	private TimeMapper timeMapper;
	
//	@Test
//	public void testGetTime() {
//		log.info(timeMapper.getClass().getName()); //실제 동작하는 클래스의 이름 확인해줌 -> 인터페이스만 만들어주었는데 내부적으로 적당한 클래스 만들어진 것
//		log.info(timeMapper.getTime());
//	}
	
	@Test
	public void testGetTime2() {
		log.info("getTime2"); //실제 동작하는 클래스의 이름 확인해줌 -> 인터페이스만 만들어주었는데 내부적으로 적당한 클래스 만들어진 것
		log.info(timeMapper.getTime2());
	}

}
