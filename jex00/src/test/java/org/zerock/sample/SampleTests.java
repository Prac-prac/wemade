package org.zerock.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//만약 테스트 실행되지 않는다면 junit 버전 다시 확인, spring-test 라이브러리 포함되어 있는지 확인
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //어떤 설정 정보 읽어야하는지
//@ContextConfiguration(classes={RootConfig.class}) //xml말고 java 설정으로 할 시
@Log4j // lombok 이용해 로그 기록하는 Logger 변수 생성
public class SampleTests {
	
	@Setter(onMethod_= {@Autowired})
	private Restaurant restaurant;
	
	@Test
	public void testExist() {
		assertNotNull(restaurant); //restaurant 변수가 null이 아니어야 테스트 성공
		
		log.info(restaurant);
		log.info("------------------");
		log.info(restaurant.getChef());
	}
}
