package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBCUtil;

public class TestDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	final private String sql="SELECT * FROM TEST WHERE MID=?";
	
	public int check(TestVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				return 0; // 아이디 중복 발생...
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		return 1; // 아이디 중복아님!
	}
}
