package test.reserve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.member.dto.MemberDto;
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
	//am_dogs 테이블 select 하는 메소드
	 
	//예약 정보 추가하기
	public boolean insert(ReserveDto Rdto ,MemberDto Mdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//sql 문 작성
			String sql = "insert into reserve"
					+ " (num, member_id, dog_num, service, checkin, checkout, etc)"
					+ "	values(reserve_seq.nextval, ?, ?, ?, to_date( ? , 'yyyy-mm-dd'), to_date( ? , 'yyyy-mm-dd'), ?)";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 부분을 넣는것
			pstmt.setString(1, Rdto.getMember_id());
			pstmt.setInt(2, Mdto.getNum());
			pstmt.setString(3, Rdto.getService());
			pstmt.setString(4, Rdto.getCheckin());
			pstmt.setString(5, Rdto.getCheckout());
			pstmt.setString(6, Rdto.getEtc());
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
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto=new ReserveDto();
				dto.setService(rs.getString("r.service"));
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
