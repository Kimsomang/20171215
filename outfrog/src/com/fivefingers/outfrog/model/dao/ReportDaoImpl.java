package com.fivefingers.outfrog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.fivefingers.outfrog.model.dto.Report;
import com.fivefingers.outfrog.model.dto.Work;

@Component
public class ReportDaoImpl implements ReportDao{
	@Resource
	FactoryDao factory;
	private static ReportDaoImpl instance = new ReportDaoImpl();

	public ReportDaoImpl(FactoryDao factory) {
		this.factory = factory;
	}
	public void setFactory(FactoryDao factory) {
		this.factory = factory;
	}

	public static ReportDaoImpl getInstance() {
		return instance;
	}

	public ReportDaoImpl() {
	}

	/**
	 * 신고 등록
	 */
	@Override
	public int insertReport(Report report) {

		String reportType = report.getReportType();
		int typeNum = report.getTypeNum();
		int replyNum = report.getReplyNum();
		String title = report.getTitle();
		String writer = report.getWriter();
		String reportReason = report.getReportReason();
		String reporter = report.getReporter();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into report values(?,?,?,?,?,?,?,' ')";

		try {
			conn = factory.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reportType);
			pstmt.setInt(2, typeNum);
			pstmt.setInt(3, replyNum);	
			pstmt.setString(4, title);
			pstmt.setString(5, writer);
			pstmt.setString(6, reportReason);
			pstmt.setString(7, reporter);

			return pstmt.executeUpdate();


		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("신고 등록 오류");
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}

	/**
	 * 신고리스트 읽기
	 */
	@Override
	public ArrayList<Report> selectReport(String reportType) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Report> list = null;

		String sql = "select * from report where report_type=? and process=' '";

		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reportType);
			rs = pstmt.executeQuery();

			list = new ArrayList<>();

			while(rs.next()) {
				list.add(new Report(rs.getString("report_type"), rs.getInt("type_num"), rs.getInt("reply_num"), rs.getString("title"), rs.getString("writer"), rs.getString("report_reason"), rs.getString("reporter"), rs.getString("process")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}

	/**
	 * 신고 처리
	 */
	public void updateReport(String process, int typeNum, int replyNum, String what) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "update report set process=? where type_num=? and reply_num=? and report_type=?";

		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, process);
			pstmt.setInt(2, typeNum);
			pstmt.setInt(3, replyNum);
			pstmt.setString(4, what);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
	}

	/**
	 * 처리완료 신고리스트 읽기
	 */
	@Override
	public ArrayList<Report> selectReportAfter() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Report> list = null;

		String sql = "select * from report";

		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			list = new ArrayList<>();

			while(rs.next()) {
				Report report = new Report(rs.getString("report_type"), rs.getInt("type_num"), rs.getInt("reply_num"), rs.getString("title"), rs.getString("writer"), rs.getString("report_reason"), rs.getString("reporter"), rs.getString("process"));
				if(!report.getProcess().equals(" "))
					list.add(report);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}

	/**
	 * 처리완료 신고리스트 ID검색
	 */
	@Override
	public ArrayList<Report> searchReportAfter(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Report> list = null;

		String sql = "select * from report where writer=?";

		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			list = new ArrayList<>();

			while(rs.next()) {
				Report report = new Report(rs.getString("report_type"), rs.getInt("type_num"), rs.getInt("reply_num"), rs.getString("title"), rs.getString("writer"), rs.getString("report_reason"), rs.getString("reporter"), rs.getString("process"));
				if(!report.getProcess().equals(" "))
					list.add(report);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}

	/** 신고유무 확인 */
	@Override
	public boolean isReport(int typeNum, int replyNum, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Report> list = null;

		String sql = "select type_num from report where reporter=? and type_num=? and reply_num=? and process=' '";

		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, typeNum);
			pstmt.setInt(3, replyNum);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return false;
	}

	/** 정지사유 확인 */
	@Override
	public String whyBan(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select report_reason from report where writer=? and process='정지'";

		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if(rs.next())
				return rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}

	/** 신고수 조회 */
	@Override
	public int reportCount(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from report where writer=?";

		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return 0;
	}
}
