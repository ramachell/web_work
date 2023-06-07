package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {

	private static UsersDao dao;

	private UsersDao() {

	}

	public static UsersDao getInstance() {
		if (dao == null) {
			dao = new UsersDao();
		}
		return dao;

	}

	// 비밀번호 변경
	public boolean updatePwd(UsersDto dto) {
		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "update users set pwd = ? where id = ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getId());
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

	// 프로필 이미지 경로를 수정하는 메소드
	public boolean updateProfile(UsersDto dto) {
		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "update users set proFile = ? where id = ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setString(1, dto.getProfile());
			pstmt.setString(2, dto.getId());
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

	// id에 따라 dto 반환해주는 메소드
	public UsersDto getData(String id) {

		// 필요한 객체 참조값 담을 지역변수 미리
		UsersDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "select pwd, email, profile, regdate from users where id = ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setString(1, id);
			// sql 수행한 결과값
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));

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

		return dto;
	}

	// insert

	public boolean insert(UsersDto dto) {
		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "insert into users (id,pwd,email,regdate) values(?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			// sql 수행한 결과값
			rowCount = pstmt.executeUpdate();
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

	// 인자로 전달되는 dto 에 있는 아이디와, 비밀번호를 이용해서 해당 정보가 유효한 정보인지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {

		// 아이디 비밀번호 유효성 여부를 담을 변수 만들고 초기값 false 부여하기
		boolean isValid = false;

		// 필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool 에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT id" + " FROM users" + " WHERE id=? AND pwd=?";
			// sql 문의 ? 에 바인딩 할게 있으면 한다
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			// SELECT 문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// SELECT 된 ROW 가 있는지 확인해 본다.
			if (rs.next()) {
				// SELECT 된 row 가 있다면 유효한 정보가 맞다.
				isValid = true;
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
					conn.close(); // Connection Pool 에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		return isValid;
	}

	// delete

	public static boolean delete(int num) {
		return true;
	}

}
