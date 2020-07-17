package test.reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
					+ " (num, service, checkin, checkout, etc)"
					+ "	values(reserve_seq.nextval, ?, to_date('?', 'yyyy-mm-dd'), to_date('?', 'yyyy-mm-dd'), ?)";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 부분을 넣는것
			pstmt.setString(1, dto.getService());
			pstmt.setString(2, dto.getCheckin());
			pstmt.setString(3, dto.getCheckout());
			pstmt.setString(4, dto.getEtc());
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
	}//예약 정보 추가하기 종료
	
	//한명의 예약정보 불러오는 메소드
	public ReserveDto getData(int num) {
		ReserveDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select m.name, m.phone, r.service, "
					+ "	d.breed, d.dage,r.checkin,r.checkout, r.etc"
					+ "	from am_member m, reserve r, am_dogs d"
					+ "	where m.id=r.member_id and r.dog_num=d.num and r.num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto=new ReserveDto();
				dto.setMember_name(rs.getString("m.name"));
				dto.setMember_phone(rs.getString("m.phone"));
				dto.setService(rs.getString("r.service"));
				dto.setDog_breed(rs.getString("d.breed"));
				dto.setDog_age(rs.getString("d.dage"));
				dto.setCheckin(rs.getString("r.checkin"));
				dto.setCheckout(rs.getString("r.checkout"));
				dto.setEtc(rs.getString("r.etc"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	 
}
