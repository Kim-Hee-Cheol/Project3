package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

public class MembershipDAO {
		
	//멤버변수(클래스 전체 멤버메소드에서 접근가능)
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	//기본생성자
	public MembershipDAO() {
		System.out.println("MemberDAO생성자 호출");
	}
	public MembershipDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id ="suamil_user";
			String pw = "1234";
			con = DriverManager.getConnection(url,id,pw);
					
			System.out.println("DB연결성공");
		}
		catch(Exception e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}
	
	public MembershipDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("MariaJDBCDriver"));
			String id ="suamil_user";
			String pw = "1234";
			con = DriverManager.getConnection(
					ctx.getInitParameter("MariaConnectURL"),id,pw);
			
			System.out.println("DB연결성공");
		}
		catch(Exception e) {
			System.out.println("DB 연결실패");
			e.printStackTrace();
		}
	}
	
	
	public int joinMember(MembershipDTO dto) {
		int affected = 0;
		try {
			String query = "INSERT INTO membership ( "
		            + " name, user_id, user_pw, user_pw2, tel, mobile, email, address) "
		            + " VALUES ( "
		            + " ?, ?, ?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getUser_id());
			psmt.setString(3, dto.getUser_pw());
			psmt.setString(4, dto.getUser_pw2());
			psmt.setString(5, dto.getTel());
			psmt.setString(6, dto.getMobile());
			psmt.setString(7, dto.getEmail());
			psmt.setString(8, dto.getAddress());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	//DB자원해제
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			System.out.println("자원반납시 예외발생");
		}
	}

	public MembershipDTO getMemberDTO(String uid,String upass) {
		//DTO객체를 생성한다.
		MembershipDTO dto = new MembershipDTO();
		//쿼리문을 작성
		String query = "SELECT user_id, user_pw, name FROM  "
				+ " membership WHERE user_id=? AND user_pw=?";
		try {
			//prepared객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//오라클로 쿼리전송 및 결과셋(ResultSet) 반환받음
			rs = psmt.executeQuery();
			//오라클이 반환해준 ResultSet이 있는지 확인
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음
				//DTO객체에 회원 레코드의 값을 저장한다.
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pw(rs.getString("user_pw"));
				dto.setName(rs.getString(3));
			}
			else {
				//false를 반환했다면 결과셋 없음
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch(SQLException e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		//DTO객체를 반환한다.
		return dto;
	}
	
	
		//Map 컬렉션에 회원정보 저장 후 반환받기
		public Map<String, String> getMembershipMap(String id, String pwd) {
			
			Map<String, String> maps = new HashMap<String, String>();
			
			String query = "SELECT user_id, user_pw, name FROM  "
					+ " membership WHERE user_id=? AND user_pw=?";
			try {
				//prepared객체 생성
				psmt = con.prepareStatement(query);
				//쿼리문의 인파라미터 설정
				psmt.setString(1, id);
				psmt.setString(2, pwd);
				//오라클로 쿼리전송 및 결과셋(ResultSet) 반환받음
				rs = psmt.executeQuery();
				//오라클이 반환해준 ResultSet이 있는지 확인
				if(rs.next()) {
					//true를 반환했다면 결과셋 있음
					maps.put("user_id",rs.getString(1));
					maps.put("user_pw",rs.getString(2));
					maps.put("name",rs.getString("name"));
				}
				else {
					//false를 반환했다면 결과셋 없음
					System.out.println("결과셋이 없습니다.");
				}
			}
			catch(Exception e) {
				System.out.println("getMemberMap오류");
				e.printStackTrace();
			}
			return maps;
		}
		
		public boolean confirmId(String user_id) {
			boolean result =false;
			try {
				String query = "SELECT user_id FROM membership WHERE user_id=?";
				psmt = con.prepareStatement(query);
				psmt.setString(1,user_id);
				rs = psmt.executeQuery();
				if(rs.next()) {
					result = true;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		
}

