package test.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.guest.dto.GuestDto;
import test.util.DbcpBean;

/*
 *  Application 전역에서 GuestDao 객체는 오직 한개만 생성해서 사용하도록 구조를 만들어야함.
 *  
 *  외부에서 객체 생성하지 못하도록 생성자 private
 *  자신의 참조값 저장할수있는 static 필드
 *  자신의 참조값 리턴해주는 public 메소드
 */

public class GuestDao {

	private static GuestDao dao;

	private GuestDao() {

	}

	public static GuestDao getInstance() {
		// 서버 시작후 최초 요청이라면
		// 즉 이미 있으면 새로 더 안만들고 기존꺼쓰려고 생성자 private하고 대신 getInstance()로 1개만 생성되게
		if (GuestDao.dao == null) {
			// 객체 생성해서 static 필드 저장
			GuestDao.dao = new GuestDao();
		} //
		return dao;
	}

	// 회원 정보 수정

	public boolean update(GuestDto dto) {
		// 필요한 객체 참조값 담을 지역변수 미리

		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getconn();
			// sql
			String sql = "update board_guest set writer=?,content=? where num = ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());

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

	// 회원 정보 1개 리턴 메소드

	public GuestDto getData(int num) {
		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GuestDto dto = null;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getconn();
			// sql
			String sql = "select * from board_guest where num = ? ";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setInt(1, num);

			// sql 수행한 결과값
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new GuestDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("Pwd"));
				dto.setRegdate(rs.getString("Regdate"));

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
			String sql = "delete from board_guest where num = ?";
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
	public boolean insert(GuestDto dto) {

		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getconn();
			// sql
			String sql = "insert into board_guest (num,writer,content,pwd,regdate) values (guest_seq.nextval, ? , ?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPwd());

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
	public List<GuestDto> getList() {
		// 목록 담을 객체 미리 생성
		List<GuestDto> list = new ArrayList<>();

		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getconn();
			// sql
			String sql = "select num,writer,content,pwd,to_char(regdate,'yy-mm-dd am hh:mi:ss')regdate from board_guest order by num asc";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)

			// sql 수행한 결과값
			rs = pstmt.executeQuery();

			while (rs.next()) {
				GuestDto dto = new GuestDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setRegdate(rs.getString("regdate"));
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
