package test.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.notice.dto.NoticeDto;
import test.util.DbcpBean;

public class NoticeDao {
	private static NoticeDao dao;
	private NoticeDao() {}
	public static NoticeDao getInstance() {
		if(dao==null) {
			dao = new NoticeDao();
		}
		return dao;
	}//getInstance()
	
	//공지사항글 리스트 불러오기
	public List<NoticeDto> getList() {
		//필요한 객체의 참조값을 담을 지역변수 만들기 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<MemberDto> list = new ArrayList<>();
	List<NoticeDto> listN = new ArrayList<>();
	try {
		//Connection 객체의 참조값 얻어오기 
		conn = new DbcpBean().getConn();
		//실행할 sql 문 준비하기
		String sql = "SELECT m.id, n.num, n.title, n.content, n.viewCount, n.regdate"
				   + " FROM am_member m, am_notice n"
				   + " ORDER BY num DESC ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		//반복문 돌면서 결과 값 추출하기 
		while (rs.next()) {
			MemberDto dto = new MemberDto();
			NoticeDto dtoN = new NoticeDto();
			dto.setId(rs.getString("id"));
			dtoN.setNum(rs.getInt("num"));
			dtoN.setTitle(rs.getString("title"));
			dtoN.setContent(rs.getString("content"));
			dtoN.setViewCount(rs.getInt("viewCount"));
			dtoN.setRegdate(rs.getString("regdate"));
			list.add(dto);
			listN.add(dtoN);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null)rs.close();
			if (pstmt != null)pstmt.close();
			if (conn != null)conn.close();
		} catch (Exception e) {}
		}return listN;
	}//getList()
	
	
}//NoticeDao
