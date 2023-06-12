package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {

	private static CafeDao dao;

	/*
	 *  static 메소드는 생성자를 호출하지 않고 클래스명으로 바로 호출을 하기 때문에
	 *  메소드 호출전에 무언가 준비 작업을 하고 싶다면 static 블럭 안에서 하면 된다
	 *  static 블럭은 해당 클래스를 최초로 사용할때 한번만 실행하기 때문에
	 *  초기화 작업을 하기 적당한 블럭이다
	 */

	static {
		// 객체를 생성해서 static 필드에 저장해두면
		dao = new CafeDao();
	}

	private CafeDao() {
		// TODO Auto-generated constructor stub
	}

	public static CafeDao getInstance() {
		if (dao == null) {
			dao = new CafeDao();
		}
		// 여기서 리턴해주는 값은 null이 아니다
		return dao;
	}

	public void addViewCount(int num) {
		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "update board_cafe set viewCount=viewCount+1 where num = ?";
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

	}

	public boolean update(CafeDto dto) {
		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "update board_cafe set title=? , content= ? where num = ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setString(1, dto.getTitle());
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

	public int getCount() {
		// 글의 갯수를 담을 지역변수
		int count = 0;
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection Pool 에서 얻어오기)
			conn = new DbcpBean().getConn();
			// 실행할 sql 문
			String sql = "select max(rownum) as mr from board_cafe";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성

			// select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				count = rs.getInt("mr");
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); // Connection 이 Connection Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return count;
	}

	public boolean delete(int num) {
		// 필요한 객체 참조값 담을 지역변수 미리
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "delete from board_cafe where num = ?";
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

	public CafeDto getData(int num) {
		// 필요한 객체 참조값 담을 지역변수 미리
		CafeDto dto = new CafeDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "select writer, title, content, viewCount, regdate from board_cafe where num = ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setInt(1, num);
			// sql 수행한 결과값
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
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

	// 업로드된 파일 정보를 DB 에 저장하는 메소드
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_cafe (num, writer, title, content, viewCount, regdate) VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할게 있으면 해주고
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
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
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	public List<CafeDto> getList(CafeDto dto) {
		// 필요한 객체 참조값 담을 지역변수 미리
		List<CafeDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "select * from (select rs1.*,rownum as rn from (select num,writer,title,content,viewCount,regdate from board_cafe order by num desc) rs1) where rn between ? and ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());

			// sql 수행한 결과값
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CafeDto dto2 = new CafeDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setContent(rs.getString("content"));
				dto2.setViewCount(rs.getInt("viewCount"));
				dto2.setRegdate(rs.getString("regdate"));
				list.add(dto2);
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
