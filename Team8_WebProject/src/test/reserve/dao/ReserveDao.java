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
	 
	//예약 정보 추가하기
	public boolean insert(ReserveDto rdto ,MemberDto mdto) {

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
			pstmt.setString(1, rdto.getMember_id());
			pstmt.setInt(2, mdto.getNum());
			pstmt.setString(3, rdto.getService());
			pstmt.setString(4, rdto.getCheckin());
			pstmt.setString(5, rdto.getCheckout());
			pstmt.setString(6, rdto.getEtc());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();}
		}if (flag > 0) {return true;
		} else {return false;}
	}//예약 정보 추가하기 종료
	
	//한명의 예약정보 불러오는 메소드
	public ReserveDto getData(String id) {
		ReserveDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT num, member_id, dog_num, service, checkin, checkout, etc"
					   + " FROM reserve"
					   + " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto=new ReserveDto();
				dto.setNum(rs.getInt("num"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setDog_num(rs.getInt("dog_num"));
				dto.setService(rs.getString("service"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setEtc(rs.getString("etc"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}return dto;
	}//getData()
	 
}//ReaerveDao()
