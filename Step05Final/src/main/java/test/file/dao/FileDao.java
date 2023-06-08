package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	// static 필드
	private static FileDao dao;

	// 외부에서 객체 생성하지 못하도록 생성자를 private 로
	private FileDao() {
	}

	// getList 페이지 ver

	public List<FileDto> getList2(int a, int b) {
		// 필요한 객체 참조값 담을 지역변수 미리
		List<FileDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "select * from (select rs1.*,rownum as rn from (select num,writer,title,orgFileName,fileSize,regdate from board_file order by num desc) rs1) where rn between ? and ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setInt(1, a * b - a + 1);
			pstmt.setInt(2, a * b);
			// sql 수행한 결과값
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FileDto dto = new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgfilename"));
				dto.setFileSize(rs.getLong("filesize"));
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

	// 자신의 참조값을 리턴해주는 메소드
	public static FileDao getInstance() {
		if (dao == null) {
			dao = new FileDao();
		}
		return dao;
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
			String sql = "delete from board_file where num = ?";
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

	public FileDto getData(int num) {
		// 필요한 객체 참조값 담을 지역변수 미리
		FileDto dto = new FileDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "select writer, title, orgFileName, saveFileName, fileSize, regdate from board_file where num = ?";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)
			pstmt.setInt(1, num);
			// sql 수행한 결과값
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
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
	public boolean insert(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할게 있으면 해주고
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
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

	public List<FileDto> getList() {
		// 필요한 객체 참조값 담을 지역변수 미리
		List<FileDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체 이용해서 Connection 객체 얻어오기 (pool에서)
			conn = new DbcpBean().getConn();
			// sql
			String sql = "select num,writer,title,orgfilename,filesize,regdate from board_file order by num";
			pstmt = conn.prepareStatement(sql);
			// ? 완성 (바인딩)

			// sql 수행한 결과값
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FileDto dto = new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgfilename"));
				dto.setFileSize(rs.getLong("filesize"));
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