package org.zenga.reality;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

//jdbc 정상적으로 추가되었고 db연결 가능한지 확인
@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try {
			Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:oracle", "book_ex", "book_ex");
			log.info(connection); //db연결 가능하다면 정상적으로 db연결된 Connection 객체가 출력됨
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			fail(e.getMessage());
		}
	}
}
