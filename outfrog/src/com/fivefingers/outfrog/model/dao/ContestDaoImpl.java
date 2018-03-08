package com.fivefingers.outfrog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.fivefingers.outfrog.model.dto.Contest;

@Repository
public class ContestDaoImpl implements ContestDao {
	@Resource
	FactoryDao factory;
	private static ContestDaoImpl instance = new ContestDaoImpl();

	public ContestDaoImpl(FactoryDao factory) {
		this.factory = factory;
	}
	public void setFactory(FactoryDao factory) {
		this.factory = factory;
	}
	
    public static ContestDaoImpl getInstance() {
        return instance;
    }

	public ContestDaoImpl() {
	}
	
	/** 기업이 의뢰한 공모를 등록하는 메서드 */
	@Override
	public int insertContest(Contest dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql="insert into contest(contest_title, contest_contents, contest_sponsor, contest_field, contest_benefit, due_date, contest_file, user_id, group_num, bookmark_count) values(?,?,?,?,?,?,?,?,?,0)";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getContestTitle());
			pstmt.setString(2, dto.getContestContents());
			pstmt.setString(3, dto.getContestSponsor());
			pstmt.setString(4, dto.getContestField());
			pstmt.setString(5, dto.getContestBenefit());
			pstmt.setString(6, dto.getDueDate());
			pstmt.setString(7, dto.getContestFile());
			pstmt.setString(8, dto.getUserId());
			pstmt.setLong(9, dto.getGroupNum());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}

	/** 공모 데이터 전체를 담는 모든 컬럼을 불러오는 메서드 */
	@Override
	public ArrayList<Contest> selectContest() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Contest dto = new Contest();

		String sql="select * from contest";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			ArrayList<Contest> list = new ArrayList<Contest>();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new Contest();
				dto.setContestNum(rs.getInt("contest_num"));
				dto.setContestTitle(rs.getString("contest_title"));
				dto.setContestSponsor(rs.getString("contest_sponsor"));
				dto.setContestField(rs.getString("contest_field"));
				dto.setContestBenefit(rs.getString("contest_benefit"));
				dto.setDueDate(rs.getString("due_date"));
				dto.setUserId(rs.getString("user_id"));
				dto.setGroupNum(rs.getLong("group_num"));
				dto.setContestContents(rs.getString("contest_contents"));
				dto.setContestFile(rs.getString("contest_file"));
				dto.setBookmarkCount(rs.getInt("bookmark_count"));
				
				list.add(dto);
			}
			return list;
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
		
		return null;
	}
	
	/** Top 공모에 해당하는 공모 컬럼을 모두 가져오는 메서드 */
	@Override
	public ArrayList<Contest> selectTopContest() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Contest dto = new Contest();

		String sql="select * from contest order by bookmark_count desc";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			ArrayList<Contest> list = new ArrayList<Contest>();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new Contest();
				dto.setContestNum(rs.getInt("contest_num"));
				dto.setContestTitle(rs.getString("contest_Title"));
				dto.setContestSponsor(rs.getString("contest_Sponsor"));
				dto.setContestField(rs.getString("contest_Field"));
				dto.setContestBenefit(rs.getString("contest_Benefit"));
				dto.setDueDate(rs.getString("due_Date"));
				dto.setUserId(rs.getString("user_Id"));
				dto.setGroupNum(rs.getLong("group_Num"));
				dto.setContestContents(rs.getString("contest_Contents"));
				dto.setContestFile(rs.getString("contest_File"));
				dto.setBookmarkCount(rs.getInt("bookmark_Count"));
				
				list.add(dto);
			}
			return list;
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
		
		return null;
	}
	
	/** 공모 고유번호를 통해 특정 공모 컬럼을 불러오는 메서드 */
	@Override
	public Contest contestView(int contestNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Contest contest = null;
		
		String sql="select * from contest where contest_num = ? order by contest_num desc";
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				contest = new Contest();
				contest.setContestNum(rs.getInt("contest_num"));
				contest.setContestTitle(rs.getString("contest_title"));
				contest.setContestSponsor(rs.getString("contest_sponsor"));
				contest.setContestField(rs.getString("contest_field"));
				contest.setContestBenefit(rs.getString("contest_benefit"));
				contest.setDueDate(rs.getString("due_date"));
				contest.setUserId(rs.getString("user_id"));
				contest.setGroupNum(rs.getLong("group_num"));
				contest.setContestContents(rs.getString("contest_contents"));
				contest.setContestFile(rs.getString("contest_file"));
				contest.setBookmarkCount(rs.getInt("bookmark_count"));
				return contest; 
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
		return null;
	}
	
	/** 특정 공모의 수상자를 채택하는 메서드 */
	@Override
	public void chooseContest(String contestBenefit, int contestNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql="update contest set contest_benefit=? where contest_num=?";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contestBenefit);
			pstmt.setInt(2, contestNum);
			
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
	}
	
	/** 공모 검색 결과를 조회하는 메서드 */
	@Override
	public List searchContest(String searchType, String searchText) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
			
		if(searchType.equals("공모 카테고리")) {
			sql="select * from contest where contest_field like (?)";
		} else if(searchType.equals("공모 제목")) {
			sql="select * from contest where contest_title like (?)";
		} else {
			sql="select * from contest where contest_sponsor like (?)";
		}
		List list = new ArrayList<Object>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchText+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
			list.add(new Contest(rs.getInt("contest_num"), rs.getString("contest_title"), rs.getString("contest_sponsor"), rs.getString("contest_field"), rs.getString("contest_benefit"), rs.getString("due_date"), rs.getString("user_id"), rs.getLong("group_num"), rs.getString("contest_contents"), rs.getString("contest_file"), rs.getInt("bookmark_count")));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}

	/** 회원의 관심분야 공모 리스트를 불러오는 메서드 */
	@Override
	public List<Contest> userField(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_field from users where user_id=?";
		String field = null;
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				field = rs.getString("user_field");
			}
			if(field != null) {
				return userFieldContest(field);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	/** 회원의 관심분야 공모 리스트를 불러오는 메서드 */
	public List<Contest> userFieldContest(String field) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from contest where contest_field=?";
		String[] fields = field.split(",");
		List<Contest> list = new ArrayList<Contest>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			for(int i = 0; i < fields.length; i++) {
				pstmt.setString(1, fields[i]);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(new Contest(rs.getInt("contest_num"), rs.getString("contest_title"), rs.getString("contest_sponsor"), rs.getString("contest_field"), rs.getString("contest_benefit"), rs.getString("due_date"), rs.getString("user_id"), rs.getLong("group_num"), rs.getString("contest_contents"), rs.getString("contest_file"), rs.getInt("bookmark_count")));
				}
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}

	/** 회원의 즐겨찾기 공모 고유번호를 불러오는 메서드 */
	@Override
	public List<Contest> userBookmark(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select contest_num from bookmark where user_id=?";
		List<Integer> list = new ArrayList<Integer>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("contest_num"));
			}
			if(list != null) {
				return userBookmarkContest(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	/** 회원의 공모 고유번호를 통해 즐겨찾기 공모 리스트를 불러오는 메서드 */
	public List<Contest> userBookmarkContest(List<Integer> list) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from contest where contest_num=?";
		List<Contest> bookmarkList = new ArrayList<Contest>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			for(int i = 0; i < list.size(); i++) {
				pstmt.setInt(1, (int) list.get(i));
				rs = pstmt.executeQuery();
				while(rs.next()) {
					bookmarkList.add(new Contest(rs.getInt("contest_num"), rs.getString("contest_title"), rs.getString("contest_sponsor"), rs.getString("contest_field"), rs.getString("contest_benefit"), rs.getString("due_date"), rs.getString("user_id"), rs.getLong("group_num"), rs.getString("contest_contents"), rs.getString("contest_file"), rs.getInt("bookmark_count")));
				}
			}
			return bookmarkList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	/** 마감이 다가오는 공모 목록을 불러오는 메서드 */
	@Override
	public List<Contest> dueDateList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from contest";
		List<Contest> dueDates = new ArrayList<>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			SimpleDateFormat format = new SimpleDateFormat("YYYY년MM월dd일");
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, +7);
			String date = format.format(calendar.getTime());
			String today = format.format(new Date());

			System.out.println(">>>"+date);
			System.out.println(today+"<<<");
			while(rs.next()) {
				if(date.compareTo(rs.getString("due_date")) >= 0 && today.compareTo(rs.getString("due_date")) <= 0) {
					dueDates.add(new Contest(rs.getInt("contest_num"), rs.getString("contest_title"), rs.getString("contest_sponsor"), rs.getString("contest_field"), rs.getString("contest_benefit"), rs.getString("due_date"), rs.getString("user_id"), rs.getLong("group_num"), rs.getString("contest_contents"), rs.getString("contest_file"), rs.getInt("bookmark_count")));
				}
			}
			return dueDates;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	/** 회원의 공모 리스트를 조회하는 메서드 */
	@Override
	public List<Contest> selectContest(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from contest where user_id=?";
		List<Contest> list = new ArrayList<Contest>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Contest(rs.getInt("contest_num"), rs.getString("contest_title"), rs.getString("contest_sponsor"), rs.getString("contest_field"), rs.getString("contest_benefit"), rs.getString("due_date"), rs.getString("user_id"), rs.getLong("group_num"), rs.getString("contest_contents"), rs.getString("contest_file"), rs.getInt("bookmark_count")));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/** 즐겨찾기 유무를 체크하는 메서드 */
	@Override
	public boolean isBookmark(int contestNum, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bookmark where contest_num=? and user_id=?";
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNum);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return false;
	}

	/** 즐겨찾기를 추가하는 메서드 */
	@Override
	public void insertBookmark(int contestNum, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into bookmark values(?, ?)";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNum);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
			
			int bookmarkCount = selectBookmark(contestNum);
			updateBookmark(contestNum, bookmarkCount+1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
	}

	/** 즐겨찾기 삭제하는 메서드 */
	@Override
	public void deleteBookmark(int contestNum, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from bookmark where contest_num=? and user_id=?";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNum);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
			
			int bookmarkCount = selectBookmark(contestNum);
			updateBookmark(contestNum, bookmarkCount-1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
	}
	
	/** 특정 공모의 즐겨찾기 수를 조회하는 메서드 */
	public int selectBookmark(int contestNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select bookmark_count from contest where contest_num=?";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return 0;	
	}
	
	/** 특정 공모의 즐겨찾기 수를 수정하는 메서드 */
	public void updateBookmark(int contestNum, int bookmarkCount) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update contest set bookmark_count=? where contest_num=?";
		
		try {
			
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			if(bookmarkCount >= 0) {
				pstmt.setInt(1, bookmarkCount);
				pstmt.setInt(2, contestNum);
				pstmt.executeUpdate();
			} else {
				pstmt.setInt(1, 0);
				pstmt.setInt(2, contestNum);
				pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
	}
	
	/** 사용자의 통합 검색 결과를 처리하는 메서드 */
	@Override
	public ArrayList<Contest> totalSearch(String str) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Contest dto = new Contest();

		String sql="select * from contest where contest_field like(?) or contest_title like(?) or contest_sponsor like(?) or contest_contents like(?) order by due_date";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+str+"%");
			pstmt.setString(2, "%"+str+"%");
			pstmt.setString(3, "%"+str+"%");
			pstmt.setString(4, "%"+str+"%");
			ArrayList<Contest> list = new ArrayList<Contest>();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new Contest();
				dto.setContestNum(rs.getInt("contest_num"));
				dto.setContestTitle(rs.getString("contest_title"));
				dto.setContestSponsor(rs.getString("contest_sponsor"));
				dto.setContestField(rs.getString("contest_field"));
				dto.setContestBenefit(rs.getString("contest_benefit"));
				dto.setDueDate(rs.getString("due_date"));
				dto.setUserId(rs.getString("user_id"));
				dto.setGroupNum(rs.getLong("group_num"));
				dto.setContestContents(rs.getString("contest_contents"));
				dto.setContestFile(rs.getString("contest_file"));
				dto.setBookmarkCount(rs.getInt("bookmark_count"));
				
				list.add(dto);
			}
			return list;
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
		
		return null;
	}
	
	/** 특정 분야에 해당하는 검색을 처리하는 메서드 */
	@Override
	public ArrayList<Contest> fieldTotalSearch(String field, String str) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Contest dto = new Contest();

		String sql="select * from contest where contest_field like(?) and (contest_title like(?) or contest_sponsor like(?) or contest_contents like(?)) order by due_date";
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+field+"%");
			pstmt.setString(2, "%"+str+"%");
			pstmt.setString(3, "%"+str+"%");
			pstmt.setString(4, "%"+str+"%");
			ArrayList<Contest> list = new ArrayList<Contest>();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new Contest();
				dto.setContestNum(rs.getInt("contest_num"));
				dto.setContestTitle(rs.getString("contest_title"));
				dto.setContestSponsor(rs.getString("contest_sponsor"));
				dto.setContestField(rs.getString("contest_field"));
				dto.setContestBenefit(rs.getString("contest_benefit"));
				dto.setDueDate(rs.getString("due_date"));
				dto.setUserId(rs.getString("user_id"));
				dto.setGroupNum(rs.getLong("group_num"));
				dto.setContestContents(rs.getString("contest_contents"));
				dto.setContestFile(rs.getString("contest_file"));
				dto.setBookmarkCount(rs.getInt("bookmark_count"));
				
				list.add(dto);
			}
			return list;
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt);
		}
		
		return null;
	}
}
