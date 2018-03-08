package com.fivefingers.outfrog.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.ResourceBundle;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


public class FactoryDao {

	private static FactoryDao factoryDao;
	
	private static String driver;
	private static String url;
	private static String id;
	private static String pw;
	
	public Connection getConnection(){
		try {
			return DriverManager.getConnection(url, id, pw);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Connection연결 실패");
		}
		return null;
	}
	public FactoryDao(String driver, String url, String username, String password) {
		this.driver = driver;
		this.url = url;
		this.id = username;
		this.pw = password;
		
		try {			
			Class.forName(driver);
		} catch (ClassNotFoundException e) {	
			System.out.println("factorydao 오류");
			e.printStackTrace();
		}
	}
	private FactoryDao() {
	}
	
	public void close(Connection conn, Statement st) {
		close(conn, st, null);
	}
	
	public void close(Connection conn, Statement st, ResultSet rs) {
		try {
			if (st!=null) {
				st.close();
			}
			if (conn != null) {
				conn.close();
			}
			if(rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static FactoryDao getInstance() {
		return factoryDao;
	}
	
	public static FactoryDao getInstance(String driver, String url, String id, String pw) {
		if(factoryDao==null) {
			factoryDao = new FactoryDao(driver, url, id, pw);
			
		}
		return factoryDao;
	}
}
