package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.ReviewDto;
import test.util.DbcpBean;

public class ReviewDao {

	private static ReviewDao dao;
	private ReviewDao() {}
	
	public static ReviewDao getInstance(){
		if(dao==null) {
			dao=new ReviewDao();
		}
		return dao;
	}
	
	//내글보기 메소드
	public List<ReviewDto> getMine(ReviewDto dto, String id){
		List<ReviewDto> list = new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select *"
					+" from"
					+" 	(select result1.*, rownum as rnum"
					+" 		from (select num, writer, profile, title, CONCAT(SUBSTR(content, 1, 150), '……' ), TO_CHAR(regdate, 'YY/MM/DD HH:MI:SS') AS regdate, recomm"
					+" 			from review where writer=?"
					+"			order by num desc)"
					+" 	result1)"
					+" where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			pstmt.setString(1, id);
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				ReviewDto tmp = new ReviewDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setProfile(rs.getString("profile"));
				tmp.setTitle(rs.getString("title"));
				tmp.setContent(rs.getString("content"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setRecomm(rs.getInt("recomm"));
				list.add(tmp);
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
			}
		}
		return list;
	}
	
	//내 글 갯수를 리턴해주는 메소드
	public int getCountMine(String id) {
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select max(rownum) as num"
					+ " from review"
					+ " where writer=? ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, id);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count = rs.getInt("num");
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
			}
		}
		return count;
	}
	
	
	
	//전체 row의 갯수를 리턴해주는 메소드
	public int getCount() {
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select nvl(max(rownum), 0) as num"
					+ " from review";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 

			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count = rs.getInt("num");
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
			}
		}
		return count;
	}
	

	
	//전체글을 가져오는 메소드 (select)
	public List<ReviewDto> getList(ReviewDto dto){
		List<ReviewDto> list = new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select *"
					+" from"
					+" 	(select result1.*, rownum as rnum"
					+" 		from (select num, writer, profile, title,"
					+ "			CONCAT(SUBSTR(content, 1, 150), '……' ),"
					+ "			TO_CHAR(regdate, 'YY/MM/DD HH:MI:SS') AS regdate, recomm"
					+" 			from review order by num desc)"
					+" 	result1)"
					+" where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				ReviewDto tmp = new ReviewDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setProfile(rs.getString("profile"));
				tmp.setTitle(rs.getString("title"));
				tmp.setContent(rs.getString("content"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setRecomm(rs.getInt("recomm"));
				list.add(tmp);
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
			}
		}
		return list;
	}
	
	
	
	//글 하나를 가져오는 메소드 (select)
	public ReviewDto getData(int num) {
		ReviewDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select result1.*"
					+" from"
					+"	(select num, writer, profile, title, content, TO_CHAR(regdate, 'YY/MM/DD HH:MI:SS') AS regdate, recomm,"
					+" 	LAG(num,1,0) over (order by num desc) as prevNum,"
					+" 	LEAD(num,1,0) over (order by num desc) as nextNum"
					+" 	from review) result1"
					+" where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new ReviewDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setProfile(rs.getString("profile"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setRecomm(rs.getInt("recomm"));
				dto.setPrevNum(rs.getInt("prevNum"));
				dto.setNextNum(rs.getInt("nextNum"));
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
			}
		}
		return dto;
	}
	
	//질문글을 등록하는 메소드 (insert)
	public boolean insert(ReviewDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "insert into review"
					+ " (num, writer, profile, title, content, regdate, recomm)"
					+ " values(rev_seq.NEXTVAL, ?, ?, ?, ?, sysdate, 0)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getProfile());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
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
	
	
	//추천수를 올리는 메소드 (update)
	public boolean recommCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "update review"
					+" set recomm = recomm+1"
					+" where num = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setInt(1,num);
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
	
	//글 내용을 수정하는 메소드 (update)
	public boolean update(ReviewDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "update review"
					+ " set title = ?, content = ?"
					+ " where num = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
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
	
	//글을 삭제하는 메소드 (delete)
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = "delete from review"
					+" where num = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setInt(1, num);
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
	
	//프로필 이미지 가져오는 메소드
	public String selectProfile(String id) {
		String profile = null;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "select profile from am_member where id = ?";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, id);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				profile = rs.getString("profile");
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
			}
		}
		return profile;
	}
	
}
