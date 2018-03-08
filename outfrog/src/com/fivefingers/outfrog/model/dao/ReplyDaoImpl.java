package com.fivefingers.outfrog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fivefingers.outfrog.model.dto.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {


	private FactoryDao factoryDao;
	
    private static ReplyDaoImpl dao;
    
    
    public static ReplyDaoImpl getInstance() {
        if (dao == null) {
            dao = new ReplyDaoImpl();
        }
        return dao;
    }
   
	@Autowired
    public void setFactoryDao(FactoryDao factoryDao) {
		this.factoryDao = factoryDao;
	}
	
	public ReplyDaoImpl() {
		
	}
	/**
	 * 댓글 작성
	 */
	public int writeReply(Reply writeReply) {
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	String query = "insert into reply(board_id, board_num, reply_date, user_id, user_nickname, reply_contents, report_count) values(?,?,now(),?,?,?,'0')";
    	try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, writeReply.getBoardId());
			pstmt.setInt(2, writeReply.getBoardNum());
			pstmt.setString(3, writeReply.getUserId());
			pstmt.setString(4, writeReply.getUserNickname());
			pstmt.setString(5, writeReply.getReplyContents());
			return pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println(e);
		} finally { 
				factoryDao.close(conn, pstmt);
		}
		return 0;
		
	}
	/**
	 * 댓글 삭제
	 */
	public int deleteReply(String boardId,int boardNum, int replyNum) {
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	String query = "delete from reply where board_id=? and board_num=? and reply_num=?";
    	
    	try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, boardId);
			pstmt.setInt(2, boardNum);
			pstmt.setInt(3, replyNum);
			return pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println(e);
		} finally { 
				factoryDao.close(conn, pstmt);
		}
		return 0;
		
	}
	/**
	 * 댓글 수정
	 */
	public int updateReply(Reply writeReply) {
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	String query = "update reply set reply_contents=? where board_id=? and board_num=? and reply_num=?";
    	
    	try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, writeReply.getReplyContents());
			pstmt.setString(2, writeReply.getBoardId());
			pstmt.setInt(3, writeReply.getBoardNum());
			pstmt.setInt(4, writeReply.getReplyNum());
			return pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println(e);
		} finally { 
				factoryDao.close(conn, pstmt);
		}
		return 0;
		
	}
	/**
	 * 댓글 신고
	 */
	public int reportReply(String boardId,int boardNum, int replyNum) {
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	String query = "update reply set report_count=report_count+1 where board_id=? and board_num=? and reply_num=?";
    	
    	try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, boardId);
			pstmt.setInt(2, boardNum);
			pstmt.setInt(3, replyNum);
			return pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println(e);
		} finally { 
				factoryDao.close(conn, pstmt);
		}
		return 0;
	}
	/**
	 * 게시글에 작성된 댓글들 목록
	 */
	public ArrayList<Reply> selectReply(String boardId,int boardNum){
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String query = "select * from reply where board_id=? and board_num=? order by reply_num desc";
    	Reply reply = new Reply();
    	try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, boardId);
			pstmt.setInt(2, boardNum);
			rs = pstmt.executeQuery();
			ArrayList<Reply> list = new ArrayList<>();
			
			while(rs.next()) {
				reply = new Reply();
				reply.setBoardId(rs.getString("board_id"));
				reply.setBoardNum(rs.getInt("board_num"));
				reply.setReplyNum(rs.getInt("reply_num"));
				reply.setReplyDate(rs.getString("reply_date"));
				reply.setUserId(rs.getString("user_id"));
				reply.setUserNickname(rs.getString("user_nickname"));
				reply.setReplyContents(rs.getString("reply_contents"));
				reply.setReportCount(rs.getInt("report_count"));
				
				list.add(reply);
			}
			
			return list;
		
		} catch (SQLException e) {
			System.out.println(e);
		} finally { 
				factoryDao.close(conn, pstmt);
		}
		
		
		return null;
	}
	/**
	 * 댓글 작성자 아이디 확인
	 */
	public String writerId(int boardNum, int replyNum) {
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String query = "select user_id from reply where board_num=? and reply_num=?";
    	try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNum);
			pstmt.setInt(2, replyNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				return rs.getString(1);
			}
		
		} catch (SQLException e) {
			System.out.println(e);
		} finally { 
				factoryDao.close(conn, pstmt);
		}

		return null;
	}
}
