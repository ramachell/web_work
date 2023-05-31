package test.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbcpBean {
	// 기존 만들어논 DBConnect 를 쓰면 성능이 안좋으니 따로 설계를 한다고함
	// 예전 수업 자바에서 쓰던건 할때마다 커넥션을 새로 얻어왔는데 그럼 좀 DB에 요청할때마다 연결하니 무거움 부하발생
	// 그러니 서버로딩때 아예 미리 얻어놓는거
	// 사용할때 connection pool 에서 미리 생성되있는 커넥션객체 하나 가져와서 쓰고
	// close 하면 반납됨
	//
	// 필드
	private Connection conn;

	// 생성자
	public DbcpBean() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			// Servers/context.xml 문서에 설정된 jdbc/myoracle 라는 이름의 datasource 얻어옴
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			// 얻어온 ds 객체 이용해서 Connection 객체 참조값 얻어와서 필드저장
			conn = ds.getConnection();
			// 예외없이 여기까지 오면 성공
			System.out.println("접속 성공");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Connection 객체 리턴해주는 메소드
	public Connection getConn() {
		return conn;
	}
}
