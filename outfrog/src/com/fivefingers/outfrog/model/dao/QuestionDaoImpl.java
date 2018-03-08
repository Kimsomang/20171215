package com.fivefingers.outfrog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fivefingers.outfrog.model.dto.Question;

/**
 * 1:1질문 DAO 클래스
 * - DAO 공통 기능 및 필수 메서드를 재정의
 * - 추가적인 DAO 서비스 메서드를 구현
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
@Repository
public class QuestionDaoImpl implements QuestionDao {
	// ------- factory injection ---------------
	private FactoryDao factoryDao;
	@Autowired
	public void setFactory(FactoryDao factoryDao) {
		this.factoryDao = factoryDao;
	}
	// -----------------------------------------
	
	/** 기본 생성자 */
	public QuestionDaoImpl() {}
	
	/** 1:1질문 등록 메서드 */
	@Override
	public int insertQuestion(Question dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "insert into question(user_nickname, question_title, question_content, write_date ,question_comment, comment_state) values(?, ?, ?, now(), ?, ?)";
		
		try {
			conn = factoryDao.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserNickname());
			pstmt.setString(2, dto.getQuestionTitle());
			pstmt.setString(3, dto.getQuestionContent());
			pstmt.setString(4, dto.getQuestionComment());
			pstmt.setString(5, dto.getCommentState());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, pstmt);
		}
		
		return result;
	}

	/** 1:1질문 단일 조회 메서드 */
	@Override
	public Question selectQuestion(int questionNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Question dto = null;
		
		String sql = "select * from question where question_num = ?";
		
		try {
			conn = factoryDao.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, questionNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {				
				dto = new Question(rs.getInt("question_num"), rs.getString("user_nickname"), 
						rs.getString("question_title"), rs.getString("question_content"), rs.getString("write_date"), 
						rs.getString("question_comment"), rs.getString("comment_state"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, pstmt);
		}
		return dto;
	}
	
	/** 1:1질문 다중 조회 메서드 (사용자) */
	@Override
	public ArrayList<Question> selectAllQuestion() {
		ArrayList<Question> list = new ArrayList<>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from question";
		
		try {
			conn = factoryDao.getConnection();
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(new Question(rs.getInt("question_num"), rs.getString("user_nickname"), 
						rs.getString("question_title"), rs.getString("question_content"), rs.getString("write_date"), 
						rs.getString("question_comment"), rs.getString("comment_state")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, stmt, rs);
		}
		return list;
	}

	/** 1:1질문 다중 조회 메서드 (관리자) */
	@Override
	public ArrayList<Question> selectAllQuestion(String userNickname) {
		ArrayList<Question> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from question where user_nickname = ?";
		
		try {
			conn = factoryDao.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNickname);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Question(rs.getInt("question_num"), rs.getString("user_nickname"), 
						rs.getString("question_title"), rs.getString("question_content"), rs.getString("write_date"), 
						rs.getString("question_comment"), rs.getString("comment_state")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, pstmt, rs);
		}
		return list;
	}

	/** 1:1질문 수정 메서드 */
	@Override
	public int updateQuestion(int questionNum, String questionTitle, String questionContent) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = "update question set question_title = ?, question_content = ? where question_num = ?";
		
		conn = factoryDao.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, questionTitle);
			pstmt.setString(2, questionContent);
			pstmt.setInt(3, questionNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, pstmt);
		}
		return result;
	}

	/** 1:1질문 삭제 메서드 */
	@Override
	public int deleteQuestion(int questionNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = "delete from question where question_num = ?";
		
		conn = factoryDao.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, questionNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, pstmt);
		}
		return result;
	}

	/** 1:1질문 답변대기중인 질문 조회 메서드 */
	@Override
	public ArrayList<Question> selectAllReadyComment(){
		ArrayList<Question> list = new ArrayList<>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from question where comment_state = '답변대기'";
		
		try {
			conn = factoryDao.getConnection();
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(new Question(rs.getInt("question_num"), rs.getString("user_nickname"), 
						rs.getString("question_title"), rs.getString("question_content"), rs.getString("write_date"), 
						rs.getString("question_comment"), rs.getString("comment_state")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, stmt, rs);
		}
		return list;
	}
	
	/** 관리자 답변 시 답변 관련 컬럼 수정 메서드 */
	public int updateComment(int questionNum, String questionComment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = "update question set comment_state = '답변완료', question_comment = ? where question_num = ?";
		
		conn = factoryDao.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, questionComment);
			pstmt.setInt(2, questionNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factoryDao.close(conn, pstmt);
		}
		return result;
	}
}
