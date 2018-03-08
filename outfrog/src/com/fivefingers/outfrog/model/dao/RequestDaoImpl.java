package com.fivefingers.outfrog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.fivefingers.outfrog.model.dao.FactoryDao;
import com.fivefingers.outfrog.model.dto.Request;

@Repository
public class RequestDaoImpl implements RequestDao {
	@Resource
	FactoryDao factory;
	private static RequestDaoImpl instance = new RequestDaoImpl();

	public RequestDaoImpl(FactoryDao factory) {
		this.factory = factory;
	}
	public void setFactory(FactoryDao factory) {
		this.factory = factory;
	}
	
    public static RequestDaoImpl getInstance() {
        return instance;
    }

	public RequestDaoImpl() {
	}
	
	/** 의뢰 삭제 */
	@Override
	public int deleteRequest(int requestnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="delete from request where request_num=?";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,requestnum);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	/** 의뢰 등록 */
	@Override
	public int insertRequest(Request dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="insert into request(contest_title, contest_sponsor, contest_field, contest_benefit, due_date, user_id, group_num, contest_contents, contest_file) values(?,?,?,?,?,?,?,?,?)";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getContestTitle());
			pstmt.setString(2, dto.getContestSponsor());
			pstmt.setString(3, dto.getContestField());
			pstmt.setString(4, dto.getContestBenefit());
			pstmt.setString(5, dto.getDueDate());
			pstmt.setString(6, dto.getUserId());
			pstmt.setLong(7, dto.getGroupNum());
			pstmt.setString(8, dto.getContestContents());
			pstmt.setString(9, dto.getContestFile());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	/** 의뢰 리스트 */
	@Override
	public ArrayList<Request> selectRequest() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Request> list = null;
		
		String sql="select * from request order by request_num desc";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			list = new ArrayList<>();
			
			while(rs.next()) {
				list.add(new Request(rs.getInt("request_num"), rs.getString("contest_title")
						, rs.getString("contest_sponsor"), rs.getString("contest_field")
						, rs.getString("contest_benefit"), rs.getString("due_date")
						, rs.getString("user_id"), rs.getLong("group_num")
						, rs.getString("contest_contents")
						, rs.getString("contest_file")));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}

		return list;
	}
	
	/** 의뢰 상세 보기 */
	@Override
	public Request requestView(int requestNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Request request = null;
		
		String sql="select * from request where request_num = ? order by request_num desc";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, requestNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				request = new Request();
				request.setRequestNum(rs.getInt("request_num"));
				request.setContestTitle(rs.getString("contest_title"));
				request.setContestSponsor(rs.getString("contest_sponsor"));
				request.setContestField(rs.getString("contest_field"));
				request.setContestBenefit(rs.getString("contest_benefit"));
				request.setDueDate(rs.getString("due_Date"));
				request.setUserId(rs.getString("user_id"));
				request.setGroupNum(rs.getLong("group_num"));
				request.setContestContents(rs.getString("contest_contents"));
				request.setContestFile(rs.getString("contest_file"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}

		return request;
	}
}
