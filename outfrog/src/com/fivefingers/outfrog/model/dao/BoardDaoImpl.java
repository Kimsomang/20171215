package com.fivefingers.outfrog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fivefingers.outfrog.model.dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	private FactoryDao factoryDao;

	private static BoardDaoImpl dao;

	public static BoardDaoImpl getInstance() {
		if (dao == null) {
			dao = new BoardDaoImpl();
		}
		return dao;
	}

	@Autowired
	public void setFactoryDao(FactoryDao factoryDao) {
		this.factoryDao = factoryDao;
	}

	public BoardDaoImpl() {

	}

	/**
	 * 자유 게시판 등록
	 */
	public int freeBoardWrite(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "insert into board(board_id,board_title,post_date,user_id, user_nickname, board_contents) values(?,?,now(),?,?,?)";
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getBoardId());
			pstmt.setString(2, board.getBoardTitle());
			pstmt.setString(3, board.getUserId());
			pstmt.setString(4, board.getUserNickname());
			pstmt.setString(5, board.getBoardContents());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}

	/**
	 * 자유 게시판 전체 확인
	 */
	public ArrayList<Board> selectAllBoard() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from board where board_id='N' or board_id='T' or board_id='F' order by board_num desc";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			ArrayList<Board> list = new ArrayList<>();

			while (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

				list.add(board);
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
	 * 자유게시판 게시글 상세 보기
	 */
	public Board freeBoardView(String boardId, int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		String query = "select * from board where board_id = '" + boardId + "' and board_num = " + bNum + "";
		String query2 = "update board set hits=hits+1 where board_id = '" + boardId + "'and board_num = " + bNum + "";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.executeUpdate();
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

			}

			return board;

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}

		return null;

	}

	/**
	 * 자유게시판 게시글 삭제
	 */
	public int deleteBoard(int bNum, String bId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "delete from board where board_id = '" + bId + "' and board_num = " + bNum + "";
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}

	/**
	 * 자유게시판 게시글 수정
	 */
	public int updateBoard(int bNum, String bId, String textarea) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "update board set board_contents = '" + textarea + "' where board_id = '" + bId
				+ "' and board_num = " + bNum + "";
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}

	/**
	 * 공지게시글 등록
	 */
	public int noticeBoardWrite(Board boardWriteDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "insert into board(board_id,board_title,post_date,user_id, user_nickname, board_contents) values(?,?,now(),?,?,?)";
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "K");
			pstmt.setString(2, boardWriteDto.getBoardTitle());
			pstmt.setString(3, boardWriteDto.getUserId());
			pstmt.setString(4, boardWriteDto.getUserNickname());
			pstmt.setString(5, boardWriteDto.getBoardContents());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}

	/**
	 * 전체 공지게시글 보기
	 */
	public ArrayList<Board> selectAllNoticeBoard() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from board where board_id = 'K' order by board_num desc";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			ArrayList<Board> list = new ArrayList<>();

			while (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

				list.add(board);
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
	 * 선택한 공지 게시판 게시글 상세확인
	 */
	public Board noticeBoardView(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		String query = "select * from board where board_id = 'K' and board_num = " + bNum + "";
		String query2 = "update board set hits=hits+1 where board_id = 'K' and board_num = " + bNum + "";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.executeUpdate();
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoardId("K");
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

			}

			return board;

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}

		return null;
	}

	/**
	 * 공지게시판 게시글 삭제
	 */
	public int noticeDeleteBoard(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "delete from board where board_id = 'K' and board_num = " + bNum + "";
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}

	/**
	 * 공지게시판 게시글 수정
	 */
	public int noticeUpdateBoard(int bNum, String textarea) {
		return 0;
	}

	/**
	 * 자유게시판 카테고리 [자유] 선택시 전체 보기
	 */
	@Override
	public ArrayList<Board> selectAllFreeBoard() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from board where board_id='F' order by board_num desc";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			ArrayList<Board> list = new ArrayList<>();

			while (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

				list.add(board);
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
	 * 자유게시판 카테고리 [TIP] 선택시 전체 보기
	 */
	@Override
	public ArrayList<Board> selectAllTipBoard() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from board where board_id='T' order by board_num desc";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			ArrayList<Board> list = new ArrayList<>();

			while (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

				list.add(board);
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
	 * 제목으로 게시글 검색
	 */
	@Override
	public ArrayList<Board> searchTitleBoard(String title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from board where board_title like(?)";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + title + "%");
			rs = pstmt.executeQuery();
			ArrayList<Board> list = new ArrayList<>();

			while (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

				list.add(board);
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
	 * 내용으로 게시글 검색
	 */
	@Override
	public ArrayList<Board> searchContentsBoard(String contents) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from board where board_contents like(?)";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + contents + "%");
			rs = pstmt.executeQuery();
			ArrayList<Board> list = new ArrayList<>();

			while (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

				list.add(board);
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
	 * 제목+내용으로 게시글 검색
	 */
	@Override
	public ArrayList<Board> searchTitleContentsBoard(String title, String contents) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from board where board_contents like(?) or board_title like(?)";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + title + "%");
			pstmt.setString(2, "%" + contents + "%");
			rs = pstmt.executeQuery();
			ArrayList<Board> list = new ArrayList<>();

			while (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

				list.add(board);
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
	 * 작성자 아이디로 게시글 검색
	 */
	@Override
	public ArrayList<Board> searchIdBoard(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from board where user_id like(?)";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + id + "%");
			rs = pstmt.executeQuery();
			ArrayList<Board> list = new ArrayList<>();

			while (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));

				list.add(board);
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
	 * 게시글 신고 수 정보
	 */
	@Override
	public int boardReportCount(int boardNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select report_count from board where board_num=?";
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();

			if (rs.next())
				return rs.getInt(1);

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}

	/**
	 * 게시글 신고 카운트 증가
	 */
	@Override
	public void updateReportCount(int boardNum, int count) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "update board set report_count=? where board_num=?";
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, count);
			pstmt.setInt(2, boardNum);
			rs = pstmt.executeQuery();

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}
	}

	/**
	 * 게시글 상세 정보 확인
	 */
	public Board freeBoardView(int bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from board where board_num = " + bNum + "";
		Board board = new Board();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoardId(rs.getString("board_id"));
				board.setBoardNum(rs.getInt("board_num"));
				board.setBoardTitle(rs.getString("board_title"));
				board.setPostDate(rs.getString("post_date"));
				board.setUserId(rs.getString("user_id"));
				board.setUserNickname(rs.getString("user_nickname"));
				board.setBoardContents(rs.getString("board_contents"));
				board.setHits(rs.getInt("hits"));
				board.setReportCount(rs.getInt("report_count"));
			}

			return board;

		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return null;
	}
}
