package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

public class MyfileDAO {
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//인자생성자1 - DB연결
	/*
	JSP파일에서 web.xml에 등록된 컨텍스트 초기화 파라미터를 가져와서
	생성자 호출시 파라미터로 전달한다. 
	 */
	public MyfileDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id ="suamil_user";
			String pw = "1234";
			con = DriverManager.getConnection(url,id,pw);
			
			System.out.println("DB연결성공");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public MyfileDAO(ServletContext ctx) {
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
}
