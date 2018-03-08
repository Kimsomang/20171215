package com.fivefingers.outfrog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fivefingers.outfrog.model.dto.OftenAsk;
import com.fivefingers.outfrog.model.dto.Question;

/**
 * 자주 묻는 질문 DAO 클래스
 * - DAO 공통 기능 및 필수 메서드를 재정의
 * - 추가적인 DAO 서비스 메서드를 구현
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
@Repository
public class OftenAskDaoImpl implements OftenAskDao {
	// ------- factory injection ---------------
	private FactoryDao factoryDao;
	@Autowired
	public void setFactory(FactoryDao factoryDao) {
		this.factoryDao = factoryDao;
	}
	// -----------------------------------------
	
	/** 기본 생성자 */
	public OftenAskDaoImpl() {}
	
	/** 자주 묻는 질문 등록 메서드 */
	@Override
	public int insertOftenAsk(OftenAsk dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "insert into often_ask(ask_category, ask_title, ask_comment) values(?, ?, ?)";
		
		try {
			conn = factoryDao.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAskCategory());
			pstmt.setString(2, dto.getAskTitle());
			pstmt.setString(3, dto.getAskComment());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, pstmt);
		}
		
		return result;
	}

	/** 자주 묻는 질문 다중 조회 메서드 */
	@Override
	public ArrayList<OftenAsk> selectAllOftenAsk() {
		ArrayList<OftenAsk> list = new ArrayList<>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from often_ask";
		
		try {
			conn = factoryDao.getConnection();

			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(new OftenAsk(rs.getInt("ask_num"), rs.getString("ask_category"), 
									  rs.getString("ask_title"), rs.getString("ask_comment")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, stmt, rs);
		}
		return list;
	}

	/** 자주 묻는 질문 수정 메서드 */
	@Override
	public int updateOftenAsk(int askNum, String askComment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = "update often_ask set ask_comment = ? where ask_num = ?";
		
		conn = factoryDao.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, askComment);
			pstmt.setInt(2, askNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, pstmt);
		}
		return result;
	}

	/** 자주 묻는 질문 삭제 메서드 */
	@Override
	public int deleteOftenAsk(int askNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = "delete from often_ask where ask_num = ?";
		
		conn = factoryDao.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, askNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, pstmt);
		}
		return result;
	}

}
