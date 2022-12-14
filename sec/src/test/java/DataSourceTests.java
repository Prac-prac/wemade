

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@ContextConfiguration(classes={RootConfig.class})
@Log4j
//스프링에 bean으로 등록된 DataSoruce 이용해서 Connection 제대로 처리 가능한지
public class DataSourceTests {

	@Setter(onMethod_ = {@Autowired} )
	private DataSource dataSource;


//	@Setter(onMethod_ = {@Autowired} )
//	private SqlSessionFactory sqlSessionFactory;

	@Test
	public void testConnection() {
		try {
			Connection conn = dataSource.getConnection();
			log.info(conn);
		} catch (SQLException e) {
			fail(e.getMessage());
		}
	}

//	@Test
//	public void testMyBatis() {
//		try (SqlSession session = sqlSessionFactory.openSession();
//				Connection con = session.getConnection();
//				) {
//			log.info(session);
//			log.info(con);
//		} catch(Exception e) {
//			fail(e.getMessage());
//		}
//	}


}
