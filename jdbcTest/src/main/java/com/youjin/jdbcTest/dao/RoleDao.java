package com.youjin.jdbcTest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.youjin.jdbcTest.dto.Role;

public class RoleDao {
	
	// DB 로그인 정보 
	// UTC(Coordinated Universal Time : 세계 협정시
	// 우리나라의 표준시는 KST 입니다. UTC +9:00 인 값
	private static String dbUrl = "jdbc:mysql://localhost:3306/youjin?useSSL=false&serverTimezone=UTC";
	private static String dbUser = "estellechoi";
	private static String dbPwd = "yk0425";
	
	// 1) 새로운 값을 담은 Role 객체를 사용해서 데이터베이스에 값을 추가하는 메소드  
	public int addRole(Role role) {
		// 입력된 횟수를 계산하는 변수
		int insertCount = 0;
		 
		// DB 관련 객체
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			// 드라이버 로드
			// mysql 8.0.16 부터 중간에 'cj' 패키지 추가
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// DB 연결 
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			
			// 쿼리 
			String sql = "insert into role(role_id, description) values(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, role.getRoleId());
			pstmt.setString(2, role.getDescription());
			
			// executeUpdate() 메소드는 업데이트된 레코드의 수를 반환한다.
			insertCount = pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				}
				catch (SQLException e){
					e.printStackTrace();
				}
			}

			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e){
					e.printStackTrace();
				}
			}

		}
		
		return insertCount;
	}
	
	

	// 2) primary key(roleId) 를 사용해서 데이터 조회값을 담은 Role 객체를 가져오는 메소드
	public Role getRole(Integer roleId) {
		// Role 객체 생성
		Role role = null;
		
		// DB 연결 관련 객체 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// DB 연결
		try {
			// 드라이버 로드 
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 연결 객체 
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			// 쿼리 객체 
			String sql = "select role_id, description from role where role_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roleId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int id = rs.getInt(1); // 컬럼의 인덱스로 불러오기 1 ~
				String description = rs.getString("description"); // 컬럼명으로 불러오기
				
				// DB 에서 조회한 값을 Role 객체에 생성자를 통해 넣어주기
				role = new Role(id, description);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		// DB 연결 관련 객체 닫아주기
		finally {
			if (rs != null) { // NullPointerException 방지를 위한 조건문
				try {
					rs.close();				
				}
				catch(SQLException e) {
					e.printStackTrace();
				}				
			}
			
			if (pstmt != null) {
				try {
					pstmt.close();				
				}
				catch(SQLException e) {
					e.printStackTrace();
				}				
			}
			
			if (conn != null) {
				try {
					conn.close();				
				}
				catch(SQLException e) {
					e.printStackTrace();
				}				
			}
			
		}
		
		return role;
	}
	
	// 3) Role 객체에 대응하는 데이터를 수정하는 메소드
	public int updateRole(Role role) {
		
		int updateCount = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			
			String sql = "update role set description = ? where role_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, role.getDescription());
			pstmt.setInt(2, role.getRoleId());
			updateCount = pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
			
		return updateCount;
	}
	
		
	// 4) primary key(roleId) 에 대응하는 데이터를 삭제하는 메소드
	public int deleteRole(int roleId) {
		
		int deleteCount = 0;	
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			
			String sql = "delete from role where role_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roleId);
			deleteCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		return deleteCount;
	}

}
