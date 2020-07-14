package test.Dogs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import test.Dogs.dto.DogsDto;
import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class DogsDao {
	private static DogsDao dao;
	
	private DogsDao() {}
	
	public static DogsDao getInstance() {
		if(dao==null) {
			dao = new DogsDao();
		}
		return dao;
	}
	
	//회원추가
	public boolean insert(DogsDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = " insert into am_dogs "
					+ " (id, dname, dage, breed, weight, neutral, gender, memo) "
					+ " values(?, ?, ?, ?, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getDname());
			pstmt.setInt(3, dto.getDage());
			pstmt.setString(4, dto.getBreed());
			pstmt.setString(5, dto.getWeight());
			pstmt.setString(6, dto.getNeutral());
			pstmt.setString(7, dto.getGender());
			pstmt.setString(8, dto.getMemo());
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
	




















