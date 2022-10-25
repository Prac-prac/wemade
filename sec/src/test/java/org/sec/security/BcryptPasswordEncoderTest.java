package org.sec.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class BcryptPasswordEncoderTest {

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = @Autowired)
	private DataSource ds;

	@Test
	public void testInsertMember() {
		String sql = "insert into tbl_member(userid, userpw, username) values (?, ?, ?)";

		for(int i=91; i<100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(2, pwencoder.encode("pw"+i));

				if(i<80) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(3, "일반사용자"+i);
				} else if(i<90) {
					pstmt.setString(1, "manager"+i);
					pstmt.setString(3, "운영자"+i);
				} else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(3, "관리자"+i);
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null) {
					try {pstmt.close();} catch (Exception e2) {}
				}
				if(con != null) {
					try {pstmt.close();} catch (Exception e2) {}
				}
			}
		}
	}


	 //권한 부여
    @Test
    public void testInsertAuth() {

        String sql = "INSERT INTO tbl_member_auth(userid, auth)"
                +"VALUES(?,?)";
        for (int i=90; i < 100; i++) {

        	Connection con = null;
        	PreparedStatement pstmt= null;

            try {
            	con = ds.getConnection();
                pstmt= con.prepareStatement(sql);


                if(i < 80) { //유저 권한
                    pstmt.setString(1, "user"+i);
                    pstmt.setString(2, "ROLE_USER");
                } else if(i < 90) {    //매니저 권한
                    pstmt.setString(1, "manager"+i);
                    pstmt.setString(2, "ROLE_MANAGER");
                } else  {    //관리자 권한
                    pstmt.setString(1, "admin"+i);
                    pstmt.setString(2, "ROLE_ADMIN");
                }

                int result = pstmt.executeUpdate();

                log.info("result : " + result);

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            	if(pstmt != null) {
					try {pstmt.close();} catch (Exception e2) {}
				}
				if(con != null) {
					try {pstmt.close();} catch (Exception e2) {}
				}
			}
        }
    }
}
