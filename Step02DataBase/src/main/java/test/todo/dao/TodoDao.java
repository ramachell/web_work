package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;

/*
 *  Application 전역에서 MemberDao 객체는 오직 한개만 생성해서 사용하도록 구조를 만들어야함.
 *  
 *  외부에서 객체 생성하지 못하도록 생성자 private
 *  자신의 참조값 저장할수있는 static 필드
 *  자신의 참조값 리턴해주는 public 메소드
 */

public class TodoDao {

	private static TodoDao dao;

	private TodoDao() {

	}

	public static TodoDao getInstance() {
		// 서버 시작후 최초 요청이라면
		// 즉 이미 있으면 새로 더 안만들고 기존꺼쓰려고 생성자 private하고 대신 getInstance()로 1개만 생성되게
		if (TodoDao.dao == null) {
			// 객체 생성해서 static 필드 저장
			TodoDao.dao = new TodoDao();
		} //
		return dao;
	}

	// 회원 정보 1개 삭제하는 메소드

	public boolean delete(int num) {
		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getconn();
			// sql
			String sql = "delete from todo where num = ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setInt(1, num);
			rowCount = pstmt.executeUpdate();
			// sql 수행한 결과값

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {// 그렇지 않으면 작업 실패
			return false;
		}
	}

	// 회원 1개 정보 입력하는 메소드
	public boolean insert(TodoDto dto) {

		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getconn();
			// sql
			String sql = "insert into todo (num,work,etc) values (todo_seq.nextval, ? , ?)";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setString(1, dto.getWork());
			pstmt.setString(2, dto.getEtc());
			rowCount = pstmt.executeUpdate();
			// sql 수행한 결과값

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {// 그렇지 않으면 작업 실패
			return false;
		}
	}

	// 회원 목록 리턴하는 메소드
	public List<TodoDto> getList() {
		// 목록 담을 객체 미리 생성
		List<TodoDto> list = new ArrayList<>();

		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getconn();
			// sql
			String sql = "select * from todo order by num asc";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)

			// sql 수행한 결과값
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setWork(rs.getString("work"));
				dto.setEtc(rs.getString("etc"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}

		return list;
	}

}
