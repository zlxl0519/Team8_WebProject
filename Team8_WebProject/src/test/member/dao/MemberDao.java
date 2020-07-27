package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	private static MemberDao dao;
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		if(dao==null) {
			dao = new MemberDao();
		}
		return dao;
	}
	
	//회원(사람용) 추가
	public boolean insertHuman(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = " insert into am_member " 
					+ " (id, pwd, email, profile, name, phone, regdate) "
					+ " values(?, ?, ?, ?, ?, ?, sysdate) " ;
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getProfile());
			pstmt.setString(5, dto.getName());
			pstmt.setString(6, dto.getPhone());
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
	
	//회원(반려견) 추가
	public boolean insertDog(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = " insert into am_dogs "
					+ " (num, member_id, dname, dage, breed, weight, neutral, gender, memo) "
					+ " values(am_dogs_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?) ";
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
	
	
	//회원 리스트 불러오기 & 페이징
	public List<MemberDto> getList(MemberDto dto){
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberDto> list = new ArrayList<>();
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = 
					" select * from "
					+ " (select result1.*, rownum as rnum from "
					+ " (select m.id, m.pwd, m.email, m.profile, m.name, m.phone, m.regdate, "
					+ " d.dname, d.dage, d.breed, d.weight, d.neutral, d.gender, d.memo "
					+ " from am_member m, am_dogs d "
					+ " where m.id=d.member_id "
					+ " order by regdate desc) result1) "
					+ " where rnum between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				MemberDto tmp = new MemberDto();
				tmp.setId(rs.getString("id"));
				tmp.setEmail(rs.getString("email"));
				tmp.setName(rs.getString("name"));
				tmp.setPhone(rs.getString("phone"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setDname(rs.getString("dname"));
				tmp.setDage(rs.getInt("dage"));
				tmp.setBreed(rs.getString("breed"));
				tmp.setWeight(rs.getString("weight"));
				tmp.setNeutral(rs.getString("neutral"));
				tmp.setGender(rs.getString("gender"));
				tmp.setMemo(rs.getString("memo"));
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
	
	
	// 검색된 회원 리스트 불러오기 & 페이징 (아이디 검색)
	public List<MemberDto> getListId(MemberDto dto){
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberDto> list = new ArrayList<>();
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = 
					" select * from "
					+ " (select result1.*, rownum as rnum from "
					+ " (select m.id, m.pwd, m.email, m.profile, m.name, m.phone, m.regdate, "
					+ " d.dname, d.dage, d.breed, d.weight, d.neutral, d.gender, d.memo "
					+ " from am_member m, am_dogs d "
					+ " where m.id=d.member_id "
					+ " and id like '%'||?||'%' "
					+ " order by regdate desc) result1) "
					+ " where rnum between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				MemberDto tmp = new MemberDto();
				tmp.setId(rs.getString("id"));
				tmp.setEmail(rs.getString("email"));
				tmp.setName(rs.getString("name"));
				tmp.setPhone(rs.getString("phone"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setDname(rs.getString("dname"));
				tmp.setDage(rs.getInt("dage"));
				tmp.setBreed(rs.getString("breed"));
				tmp.setWeight(rs.getString("weight"));
				tmp.setNeutral(rs.getString("neutral"));
				tmp.setGender(rs.getString("gender"));
				tmp.setMemo(rs.getString("memo"));
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
	
	
	
	// 검색된 회원 리스트 불러오기 & 페이징 (이름 검색)
	public List<MemberDto> getListName(MemberDto dto){
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberDto> list = new ArrayList<>();
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = 
					" select * from "
					+ " (select result1.*, rownum as rnum from "
					+ " (select m.id, m.pwd, m.email, m.profile, m.name, m.phone, m.regdate, "
					+ " d.dname, d.dage, d.breed, d.weight, d.neutral, d.gender, d.memo "
					+ " from am_member m, am_dogs d "
					+ " where m.id=d.member_id "
					+ " and name like '%'||?||'%' "
					+ " order by regdate desc) result1) "
					+ " where rnum between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				MemberDto tmp = new MemberDto();
				tmp.setId(rs.getString("id"));
				tmp.setEmail(rs.getString("email"));
				tmp.setName(rs.getString("name"));
				tmp.setPhone(rs.getString("phone"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setDname(rs.getString("dname"));
				tmp.setDage(rs.getInt("dage"));
				tmp.setBreed(rs.getString("breed"));
				tmp.setWeight(rs.getString("weight"));
				tmp.setNeutral(rs.getString("neutral"));
				tmp.setGender(rs.getString("gender"));
				tmp.setMemo(rs.getString("memo"));
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
	
	
	// 검색된 회원 리스트 불러오기 & 페이징 (휴대폰 번호 검색)
	public List<MemberDto> getListPhone(MemberDto dto){
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberDto> list = new ArrayList<>();
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = 
					" select * from "
					+ " (select result1.*, rownum as rnum from "
					+ " (select m.id, m.pwd, m.email, m.profile, m.name, m.phone, m.regdate, "
					+ " d.dname, d.dage, d.breed, d.weight, d.neutral, d.gender, d.memo "
					+ " from am_member m, am_dogs d "
					+ " where m.id=d.member_id "
					+ " and phone like '%'||?||'%' "
					+ " order by regdate desc) result1) "
					+ " where rnum between ? and ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				MemberDto tmp = new MemberDto();
				tmp.setId(rs.getString("id"));
				tmp.setEmail(rs.getString("email"));
				tmp.setName(rs.getString("name"));
				tmp.setPhone(rs.getString("phone"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setDname(rs.getString("dname"));
				tmp.setDage(rs.getInt("dage"));
				tmp.setBreed(rs.getString("breed"));
				tmp.setWeight(rs.getString("weight"));
				tmp.setNeutral(rs.getString("neutral"));
				tmp.setGender(rs.getString("gender"));
				tmp.setMemo(rs.getString("memo"));
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
	
	
	
	//로그인시 DB에 회원정보가 있는지 확인하는 메소드
	public boolean isValid(MemberDto dto) {
		boolean isValid=false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=new DbcpBean().getConn();
			String sql = "select id"
					+ "	from am_member"
					+ "	where id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isValid=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
		return isValid;
	}
		
		//한명의 회원 정보 읽어오는 메소드
		public MemberDto getData(String id) {
			MemberDto dto=null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "select id, pwd, email, profile, name, phone, "
						+ " to_char(regdate, 'yyyy-mm-dd') regdate"
						+ "	from am_member"
						+ "	where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto=new MemberDto();
					dto.setId(id);
					dto.setPwd(rs.getString("pwd"));
					dto.setEmail(rs.getString("email"));
					dto.setProfile(rs.getString("profile"));
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					dto.setRegdate(rs.getString("regdate"));
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
		
		//예약시 회원의 강아지 정보와 일치하는 강아지 dog_num 얻어오기
		public MemberDto getDogNum(MemberDto dto) {
			MemberDto mdto=null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "select num"
						+ "	from am_dogs"
						+ "	where dname=? and breed=? and dage=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getDname());
				pstmt.setString(2, dto.getBreed());
				pstmt.setInt(3, dto.getDage());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					mdto=new MemberDto();
					mdto.setNum(rs.getInt("num"));
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
			return mdto;
		}
		
		//한명 회원의 강아지 정보를 읽어오는 메소드
		public MemberDto getPuppyData(String id) {
			MemberDto dto=null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "select num, member_id, dname, dage, breed, weight, neutral, gender, memo"
						+ " from am_dogs"
						+ " where member_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto=new MemberDto();
					dto.setNum(rs.getInt("num"));
					dto.setId(id);
					dto.setDname(rs.getString("dname"));
					dto.setDage(rs.getInt("dage"));
					dto.setBreed(rs.getString("breed"));
					dto.setWeight(rs.getString("weight"));
					dto.setNeutral(rs.getString("neutral"));
					dto.setGender(rs.getString("gender"));
					dto.setMemo(rs.getString("memo"));
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
		
		//한명회원의 강아지가 여러마리라면 한명회원의 강아지 리스트를 불러오는 메소드
		public List<MemberDto> getPuppyList(String id){
			List<MemberDto> puppyList=new ArrayList();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "select num, dname, dage, breed, weight, neutral, gender, memo"
						+ "	from am_dogs"
						+ "	where member_id=?"
						+ "	order by num desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					MemberDto dto=new MemberDto();
					dto.setNum(rs.getInt("num"));
					dto.setDname(rs.getString("dname"));
					dto.setDage(rs.getInt("dage"));
					dto.setBreed(rs.getString("breed"));
					dto.setWeight(rs.getString("weight"));
					dto.setNeutral(rs.getString("neutral"));
					dto.setGender(rs.getString("gender"));
					dto.setMemo(rs.getString("memo"));
					puppyList.add(dto);
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
			return puppyList;
		}
		//회원정보 삭제하는 메소드
		public boolean delete(String id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//sql 문 작성
				String sql = "DELETE from am_member"
						+ "	WHERE id=?";
				pstmt = conn.prepareStatement(sql);
				//sql 문에 ? 부분을 넣는것
				pstmt.setString(1, id);
				flag = pstmt.executeUpdate();
			} catch (Exception e) {e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)pstmt.close();
					if (conn != null)conn.close();
				} catch (Exception e) {e.printStackTrace();}
			}if (flag > 0) {return true;
			} else {return false;}
		}//delete 메소드 종료
		
		//이름, 이메일로 아이디 찾는 메소드
		public String id_search(MemberDto dto) {
			String id=null; // 찾을 아이디
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "select id"
						+ " from am_member"
						+ "	where name=? and email=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getEmail());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					id=rs.getString("id");
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
			return id;
		}//메소드 종료
		
		//이름, 연락처로 아이디 찾는 메소드
		public String id_search2(MemberDto dto) {
			String id=null; // 찾을 아이디
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "select id"
						+ " from am_member"
						+ "	where name=? and phone=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getPhone());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					id=rs.getString("id");
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
			return id;
		}
		
		//아이디, 이름, 연락처로 비밀번호 찾는 메소드
		public String pwd_search(MemberDto dto) {
			String pwd=null;//찾을 비밀번호
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "select pwd"
						+ "	from am_member"
						+ "	where id=? and name=? and phone=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getPhone());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					pwd=rs.getString("pwd");
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
			return pwd;
		}
		
	//아이디 생성 시 중복확인
	public boolean isExist(String inputId) {
		
		boolean isExist = false;
		
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = " select id from am_member "
					+ " where id = ? ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, inputId);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				isExist=true;
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
		return isExist;
	}
	
	    //회원 update 사람
		public boolean updateHuman(MemberDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				//실행할 sql 문 준비하기 
				String sql = " UPDATE am_member"
						     + " SET email=?, name=?, phone=?, profile=?, pwd=? "
						     + " WHERE id =?";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩 할 값이 있으면 바인딩한다.
				pstmt.setString(1, dto.getEmail());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getPhone());
				pstmt.setString(4, dto.getProfile());
				pstmt.setString(5, dto.getPwd());
				pstmt.setString(6, dto.getId());
				
				//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
				flag = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)pstmt.close();
					if (conn != null)conn.close();
				} catch (Exception e) {}
			}if (flag > 0) {return true;} else {return false;}
		}//updateHuman
		
		//회원 update 강아지
		public boolean updateDog(MemberDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				String sql = " UPDATE am_dogs"
						     + " SET dname=?, dage=?, breed=?, weight=?, neutral=?, gender=?, memo=? "
						     + " WHERE member_id =?";
				pstmt = conn.prepareStatement(sql);
				//? 에 바인딩 할 값이 있으면 바인딩한다.
				pstmt.setString(1, dto.getDname());
				pstmt.setInt(2, dto.getDage());
				pstmt.setString(3, dto.getBreed());
				pstmt.setString(4, dto.getWeight());
				pstmt.setString(5, dto.getNeutral());
				pstmt.setString(6, dto.getGender());
				pstmt.setString(7, dto.getMemo());
				pstmt.setString(8, dto.getMember_id());
				//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
				flag = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)pstmt.close();
					if (conn != null)conn.close();
				} catch (Exception e) {}
			}if (flag > 0) {return true;} else {return false;}
		}//updateDog
	
	
	
	//전체 row의 갯수를 리턴해주는 메소드
	public int getCount() {
		//전체 row의 갯수를 리턴해주는 메소드
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//rownum 중에서 가장 큰 숫자를 얻어오면 전체 row의 갯수가 된다.
			//혹시 row가 하나도 없으면 null이 얻어와지기 때문에 null인 경우 0으로 바꿔주어야함.
			//실행할 sql 문 준비하기
			String sql = " select max(rownum) as num "
					+ " from (select m.id, d.num from am_member m, am_dogs d "
					+ " where m.id = d.member_id) ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("num");
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
	
	//id 검색결과의 전체 row 갯수를 리턴해주는 메소드
	public int getCountId(MemberDto dto) {
		//전체 row의 갯수를 리턴해주는 메소드
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//rownum 중에서 가장 큰 숫자를 얻어오면 전체 row의 갯수가 된다.
			//혹시 row가 하나도 없으면 null이 얻어와지기 때문에 null인 경우 0으로 바꿔주어야함.
			//실행할 sql 문 준비하기
			String sql = " select max(rownum) as num "
					+ " from (select m.id, d.num from am_member m, am_dogs d "
					+ " where m.id = d.member_id) "
					+ " where id like '%'||?||'%' ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, dto.getId());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("num");
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
	
	
	//이름 검색결과의 전체 row 갯수를 리턴해주는 메소드
	public int getCountName(MemberDto dto) {
		//전체 row의 갯수를 리턴해주는 메소드
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//rownum 중에서 가장 큰 숫자를 얻어오면 전체 row의 갯수가 된다.
			//혹시 row가 하나도 없으면 null이 얻어와지기 때문에 null인 경우 0으로 바꿔주어야함.
			//실행할 sql 문 준비하기
			String sql = " select max(rownum) as num "
					+ " from (select m.id, d.num from am_member m, am_dogs d "
					+ " where m.id = d.member_id) "
					+ " where name like '%'||?||'%' ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, dto.getName());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("num");
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
	
	
	//연락처 검색결과의 전체 row 갯수를 리턴해주는 메소드
	public int getCountPhone(MemberDto dto) {
		//전체 row의 갯수를 리턴해주는 메소드
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//rownum 중에서 가장 큰 숫자를 얻어오면 전체 row의 갯수가 된다.
			//혹시 row가 하나도 없으면 null이 얻어와지기 때문에 null인 경우 0으로 바꿔주어야함.
			//실행할 sql 문 준비하기
			String sql = " select max(rownum) as num "
					+ " from (select m.id, d.num from am_member m, am_dogs d "
					+ " where m.id = d.member_id) "
					+ " where phone like '%'||?||'%' ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, dto.getPhone());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("num");
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
}