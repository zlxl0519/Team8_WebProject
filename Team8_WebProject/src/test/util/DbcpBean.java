package test.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbcpBean {
	private Connection conn;
	
	public DbcpBean() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			// jdbc/myoracle 이라는 이름의 DataSource(Connection Pool) 에서 
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			// Connection 객체를 하나 가지고 온다.  
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConn() {
		return conn;
	}
}
