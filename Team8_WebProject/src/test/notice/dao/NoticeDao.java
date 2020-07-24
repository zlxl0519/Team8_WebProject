package test.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.notice.dto.NoticeDto;
import test.util.DbcpBean;

public class NoticeDao {
	private static NoticeDao dao;
	private NoticeDao() {}
	public static NoticeDao getInstance() {
		if(dao==null) {
			dao=new NoticeDao();
		}
		return dao;
	}//dao
	
	//글 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "delete FROM am_notice_seq"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		if (flag > 0) {return true;
		} else {return false;}
	}//delete
	
	
	//글 정보를 수정하는 메소드
	public boolean update(NoticeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE am_notice_seq"
					+ " SET title=?, content=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}if (flag > 0) {return true;
		} else {return false;}
	}//글정보수정 메소드 종료
	
	//글 조회수 1 증가 시키는 메소드
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE am_notice_seq"
					+ " SET viewCount=viewCount+1"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}if (flag > 0) {return true;
		} else {return false;}
	}//addViewCount
	
	//글하나의 정보를 리턴하는 메소드
	public NoticeDto getData(int num) {
		NoticeDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT result1.*"
					+ " FROM"
					+ "     (SELECT num,title,content,viewCount,regdate,"
					+ "      LAG(num,1,0) OVER (ORDER BY num DESC) AS prevNum,"
					+ "      LEAD(num,1,0) OVER (ORDER BY num DESC) AS nextNum"
					+ "      FROM am_notice_seq) result1"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto=new NoticeDto();
				dto.setNum(num);
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPrevNum(rs.getInt("prevNum"));
				dto.setNextNum(rs.getInt("nextNum"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				//connection pool 에 반납하기 
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}return dto;
	}//getData
	
	//글 전체의 갯수를 리턴하는 메소드
	public int getCount() {
		int rowCount=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT MAX(ROWNUM) AS count"
					+ " FROM am_notice_seq";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rowCount=rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}return rowCount;
	}//getCount
	
	//새글을 저장하는 메소드
	public boolean insert(NoticeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO am_notice_seq"
					+ " (num,title,content,viewCount,regdate)"
					+ " VALUES(am_notice_seq_seq.NEXTVAL,?,?,0,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}if (flag > 0) {return true;
		} else {return false;}
	}//insert
	
	//글 목록을 리턴하는 메소드 
	public List<NoticeDto> getList(NoticeDto dto){
		List<NoticeDto> list=new ArrayList<NoticeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			/*
				SELECT * 
				FROM
				    (SELECT result1.*, ROWNUM AS rnum
				    FROM
				        (SELECT num,writer,title,viewCount,regdate
				        FROM am_notice_seq
				        ORDER BY num DESC) result1)
				WHERE rnum BETWEEN ? AND ?
			*/
			String sql="SELECT *"
					+ " FROM"
					+ " (SELECT result1.*, ROWNUM AS rnum"
					+ " FROM"
					+ " (SELECT num,title,viewCount,regdate"
					+ " FROM am_notice_seq"
					+ " ORDER BY num DESC) result1)"
					+ " WHERE rnum BETWEEN ? AND ?";
			pstmt=conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {//반목문 돌면서
				//select 된 row 의 정보를 NoticeDto 객체에 담아서 
				NoticeDto tmp=new NoticeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				//ArrayList 객체에 누적 시킨다.
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}return list;
	}//getList
}//NoticeDao