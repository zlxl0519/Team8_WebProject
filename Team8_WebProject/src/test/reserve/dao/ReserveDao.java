package test.reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import test.reserve.dto.ReserveDto;
import test.util.DbcpBean;

public class ReserveDao {
	private static ReserveDao dao;
	
	private ReserveDao() {};
	
	public static ReserveDao getInstance() {
		if(dao==null) {
			dao=new ReserveDao();
		}
		return dao;
	}
	//예약 정보 추가하기
	public boolean insert(ReserveDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//sql 문 작성
			String sql = "insert into reserve"
					+ " (num, )";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 부분을 넣는것

			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
