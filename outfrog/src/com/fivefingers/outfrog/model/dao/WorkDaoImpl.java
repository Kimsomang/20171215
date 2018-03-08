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

import com.fivefingers.outfrog.model.dto.Work;

@Component
public class WorkDaoImpl implements WorkDao{
	@Resource
	FactoryDao factory;
	private static WorkDaoImpl instance = new WorkDaoImpl();

	public WorkDaoImpl(FactoryDao factory) {
		this.factory = factory;
	}
	public void setFactory(FactoryDao factory) {
		this.factory = factory;
	}
	
    public static WorkDaoImpl getInstance() {
        return instance;
    }

	public WorkDaoImpl() {
	}
	
	/**
	 * 작품 등록
	 * @param work 작품DTO
	 */
	@Override
	public boolean insertWork(Work work) {
		
		int contestNum = work.getContestNum();
		String userId = work.getUserId();
		String userNickname = work.getUserNickname();
		String workTitle = work.getWorkTitle();
		String workContent = work.getWorkContent();
		String workPicture = work.getWorkPicture();
		String workFile = work.getWorkFile();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into work(contest_num, user_id, user_nickname, work_title, work_content, work_picture, work_file, vote_count, report_count, sub_date, prize) values(?,?,?,?,?,?,?,0,0,date_format(now(), '%Y-%m-%d'),' ')";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNum);
			pstmt.setString(2, userId);
			pstmt.setString(3, userNickname);
			pstmt.setString(4, workTitle);
			pstmt.setString(5, workContent);
			pstmt.setString(6, workPicture);
			pstmt.setString(7, workFile);
			
			int i = pstmt.executeUpdate();

			if(i == 1) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("작품 등록 오류");
		} finally {
			factory.close(conn, pstmt);
		}
		return false;
	}
	
	/**
	 * 작품리스트 읽기(공모 상세보기)
	 * @param contestNum 공모 번호
	 */
	@Override
	public ArrayList<Work> workList(int contestNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Work> list = null;
		
		String sql = "select * from work where contest_num = ? order by work_num, vote_count desc";
			
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNum);
			rs = pstmt.executeQuery();
				
			list = new ArrayList<>();
				
			while(rs.next()) {
				list.add(new Work(rs.getInt("contest_num"), rs.getInt("work_num"), rs.getString("user_id"), rs.getString("user_nickname"), rs.getString("work_title"), rs.getString("work_content"), rs.getString("work_picture"), rs.getString("work_file"), rs.getInt("vote_count"), rs.getInt("report_count"), rs.getString("sub_date"), rs.getString("prize")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}
	
	/**
	 * 작품 상세 읽기
	 * @param workNum 작품 번호
	 */
	@Override
	public Work workView(int workNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Work work = null;
		String sql = "select * from work where work_num = ?";
			
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workNum);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				work = new Work(rs.getInt("contest_num"), rs.getInt("work_num"), rs.getString("user_id"), rs.getString("user_nickname"), rs.getString("work_title"), rs.getString("work_content"), rs.getString("work_picture"), rs.getString("work_file"), rs.getInt("vote_count"), rs.getInt("report_count"), rs.getString("sub_date"), rs.getString("prize"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return work;
	}
	
	/**
	 * 작품 제목 검색
	 * @param contestNum 공모 번호
	 * @param title 작품 검색할 제목
	 */
	@Override
	public ArrayList<Work> workSearchTitle(int contestNum, String title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Work> list = null;
		
		String sql = "select * from work where work_title like(?) and contest_num=? order by work_num, vote_count desc";
			
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+title+"%");
			pstmt.setInt(2, contestNum);
			rs = pstmt.executeQuery();
				
			list = new ArrayList<>();
				
			while(rs.next()) {
				list.add(new Work(rs.getInt("contest_num"), rs.getInt("work_num"), rs.getString("user_id"), rs.getString("user_nickname"), rs.getString("work_title"), rs.getString("work_content"), rs.getString("work_picture"), rs.getString("work_file"), rs.getInt("vote_count"), rs.getInt("report_count"), rs.getString("sub_date"), rs.getString("prize")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}
	
	/**
	 * 작품 내용 검색
	 * @param contestNum 공모 번호
	 * @param content 작품 검색할 내용
	 */
	@Override
	public ArrayList<Work> workSearchContent(int contestNum, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Work> list = null;
		
		String sql = "select * from work where work_content like(?) and contest_num=? order by work_num, vote_count desc";
			
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+content+"%");
			pstmt.setInt(2, contestNum);
			rs = pstmt.executeQuery();
				
			list = new ArrayList<>();
				
			while(rs.next()) {
				list.add(new Work(rs.getInt("contest_num"), rs.getInt("work_num"), rs.getString("user_id"), rs.getString("user_nickname"), rs.getString("work_title"), rs.getString("work_content"), rs.getString("work_picture"), rs.getString("work_file"), rs.getInt("vote_count"), rs.getInt("report_count"), rs.getString("sub_date"), rs.getString("prize")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}
	
	/**
	 * 작품 제목+내용 검색
	 * @param contestNum 공모 번호
	 * @param str 작품 검색할 제목 또는 내용
	 */
	@Override
	public ArrayList<Work> workSearchTitleContent(int contestNum, String str) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Work> list = null;
		
		String sql = "select * from work where (work_title like(?) or work_content like(?)) and contest_num=? order by work_num, vote_count desc";
			
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+str+"%");
			pstmt.setString(2, "%"+str+"%");
			pstmt.setInt(3, contestNum);
			rs = pstmt.executeQuery();
				
			list = new ArrayList<>();
				
			while(rs.next()) {
				list.add(new Work(rs.getInt("contest_num"), rs.getInt("work_num"), rs.getString("user_id"), rs.getString("user_nickname"), rs.getString("work_title"), rs.getString("work_content"), rs.getString("work_picture"), rs.getString("work_file"), rs.getInt("vote_count"), rs.getInt("report_count"), rs.getString("sub_date"), rs.getString("prize")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}
	
	/**
	 * 작품 작성자 검색
	 * @param contestNum 공모 번호
	 * @param name 작품 검색할 작성자
	 */
	@Override
	public ArrayList<Work> workSearchName(int contestNum, String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Work> list = null;
		
		String sql = "select * from work where (user_id like(?) or user_nickname like(?)) and contest_num=? order by work_num, vote_count desc";
			
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			pstmt.setString(2, "%"+name+"%");
			pstmt.setInt(3, contestNum);
			rs = pstmt.executeQuery();
				
			list = new ArrayList<>();
				
			while(rs.next()) {
				list.add(new Work(rs.getInt("contest_num"), rs.getInt("work_num"), rs.getString("user_id"), rs.getString("user_nickname"), rs.getString("work_title"), rs.getString("work_content"), rs.getString("work_picture"), rs.getString("work_file"), rs.getInt("vote_count"), rs.getInt("report_count"), rs.getString("sub_date"), rs.getString("prize")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}
	
	/**
	 * 투표유무 확인
	 * @param workNum 작품 번호
	 * @param userId 투표하는 유저
	 */
	@Override
	public boolean isVote(int workNum, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select work_num from vote where work_num=? and user_id=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workNum);
			pstmt.setString(2, userId);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("투표유무 확인 오류");
		} finally {
			factory.close(conn, pstmt);
		}
		return false;
	}
	
	/**
	 * 투표 테이블에 등록
	 * @param contestNum 공모 번호
	 * @param workNum 작품 번호
	 * @param userId 투표하는 유저
	 */
	@Override
	public void insertVote(int contestNum, int workNum, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into vote values(?,?,?)";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNum);
			pstmt.setInt(2, workNum);
			pstmt.setString(3, userId);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("투표 등록 오류");
		} finally {
			factory.close(conn, pstmt);
		}
	}
	
	/**
	 * 작품에 투표 카운트 확인
	 * @param workNum 작품 번호
	 */
	@Override
	public int voteCount(int workNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select vote_count from work where work_num=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workNum);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				return rs.getInt("vote_count");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("투표개수 확인 오류");
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	/**
	 * 작품에 투표 카운트 수정
	 * @param workNum 작품 번호
	 * @param voteCount 투표 카운트 수정할 숫자
	 */
	@Override
	public void updateVote(int workNum, int voteCount) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update work set vote_count = ? where work_num=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, voteCount);
			pstmt.setInt(2, workNum);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("투표 수정 오류");
		} finally {
			factory.close(conn, pstmt);
		}
	}
	
	/**
	 * 투표 취소
	 * @param workNum 작품 번호
	 * @param userId 투표 카운트 수정할 숫자
	 */
	@Override
	public int deleteVote(int workNum, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from vote where work_num=? and user_id=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workNum);
			pstmt.setString(2, userId);
			
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("투표 삭제 오류");
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	/**
	 * 현재시간('YYYY-MM-DD')
	 */
	@Override
	   public String currentTime() {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "select date_format(now(),'%Y-%m-%d') from dual";
	      
	      try {
	         conn = factory.getConnection();
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         rs = pstmt.executeQuery();

	         if(rs.next()) {
	            return rs.getString(1);
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	         System.out.println("현재시간 확인 오류");
	      } finally {
	         factory.close(conn, pstmt);
	      }
	      return "";
	   }
	
	/**
	 * 작품 삭제
	 * @param workNum 작품 번호
	 */
	@Override
	public void deleteWork(int workNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from work where work_num=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workNum);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("작품 삭제 오류");
		} finally {
			factory.close(conn, pstmt);
		}
	}
	
	/**
	 * 작품 삭제시 투표테이블에 해당 작품관련 삭제
	 * @param workNum 작품 번호
	 */
	@Override
	public int deleteVote(int workNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from vote where work_num=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workNum);
			
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("투표 전체 삭제 오류");
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	/**
	 * 작품 수정
	 * @param work 작품DTO
	 */
	@Override
	public void updateWork(Work work) {
		
		int workNum = work.getWorkNum();
		String workTitle = work.getWorkTitle();
		String workContent = work.getWorkContent();
		String workPicture = work.getWorkPicture();
		String workFile = work.getWorkFile();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update work set work_title=?, work_content=?, work_picture=?, work_file=? where work_num=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, workTitle);
			pstmt.setString(2, workContent);
			pstmt.setString(3, workPicture);
			pstmt.setString(4, workFile);
			pstmt.setInt(5, workNum);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("작품 수정 오류");
		} finally {
			factory.close(conn, pstmt);
		}
	}
	
	@Override
	public void prizeWork(String prize, int workNum) {	
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update work set prize=? where work_num=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prize);
			pstmt.setInt(2, workNum);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("수상 입력 오류");
		} finally {
			factory.close(conn, pstmt);
		}
	}
	
	/**
	 * 내 작품리스트
	 * @param userId 아이디
	 */
	@Override
	public ArrayList<Work> myWorkList(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Work> list = null;
		
		String sql = "select * from work where user_id=? order by work_num desc";
			
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
				
			list = new ArrayList<>();
				
			while(rs.next()) {
				list.add(new Work(rs.getInt("contest_num"), rs.getInt("work_num"), rs.getString("user_id"), rs.getString("user_nickname"), rs.getString("work_title"), rs.getString("work_content"), rs.getString("work_picture"), rs.getString("work_file"), rs.getInt("vote_count"), rs.getInt("report_count"), rs.getString("sub_date"), rs.getString("prize")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}
	/**
	    * 채택 유무
	    * @param contestNum 공모 번호
	    */
	   @Override
	   public int isChoose(int contestNum) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      String sql = "select count(*) from work where contest_num=? and prize like('%상%')";
	         
	      try {
	         conn = factory.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, contestNum);
	         rs = pstmt.executeQuery();
	         if(rs.next())
	            return rs.getInt(1);

	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         factory.close(conn, pstmt, rs);
	      }
	      return 0;
	   }
	
	@Override
	public ArrayList<HashMap<String, String>> selectCount(ArrayList<String> usersId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select vote_count, report_count from work where user_id=?";
		ArrayList<HashMap<String,String>> countList = new ArrayList<>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			for(int i = 0; i < usersId.size(); i++) {
				int voteCount = 0;
				int reportCount = 0;
				int workCount = 0;
				String userId = usersId.get(i);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					voteCount = voteCount + rs.getInt(1);
					reportCount = reportCount + rs.getInt(2);
					workCount = workCount + 1;
				}
				HashMap<String, String> countMap = new HashMap<>();
				countMap.put("countId", userId);
				countMap.put("voteCount", voteCount+"");
				countMap.put("reportCount", reportCount+"");
				countMap.put("workCount", workCount+"");
				countMap.put("boardCount", selectBoardCount(userId)+"");
				countMap.put("replyCount", selectReplyCount(userId)+"");
				countList.add(countMap);
			}
			return countList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int selectBoardCount(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board where user_id=?";
		
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
	
	public int selectReplyCount(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from reply where user_id=?";
		
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

	@Override
	public List userVote(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select contest_num, work_num from vote where user_id=?";
		Map<Integer, Integer> map = new HashMap<>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				map.put(rs.getInt("contest_num"), rs.getInt("work_num"));
			}
			if(map != null) {
				return userVoteContest(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public List userVoteContest(Map map) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from work where contest_num=? and work_num=?";
		List<Work> list = new ArrayList<>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			Set key = map.keySet();
			  
			for (Iterator iterator = key.iterator(); iterator.hasNext();) {
				int keyName = (int) iterator.next();
				int valueName = (int) map.get(keyName);
				pstmt.setInt(1, keyName);
				pstmt.setInt(2, valueName);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(new Work(rs.getInt("contest_num"), rs.getInt("work_num"), rs.getString("user_id"), rs.getString("user_nickname"), rs.getString("work_title"), rs.getString("work_content"), rs.getString("work_picture"), rs.getString("work_file"), rs.getInt("vote_count"), rs.getInt("report_count"), rs.getString("sub_date"), rs.getString("prize")));
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
	@Override
	public ArrayList<HashMap<String, Integer>> selectWorkCount(ArrayList<Integer> contestNums) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from work where contest_num=?";
		ArrayList<HashMap<String, Integer>> workCountList = new ArrayList<>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			for(int i = 0; i < contestNums.size(); i++) {
				pstmt.setInt(1, contestNums.get(i));
				rs = pstmt.executeQuery();
				if(rs.next()) {
					HashMap<String, Integer> countMap = new HashMap<>();
					countMap.put("contestNums", contestNums.get(i));
					countMap.put("workCount", rs.getInt(1));
					workCountList.add(countMap);
				}
			}
			return workCountList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 작품에 신고 카운트 확인
	 * @param workNum 작품 번호
	 */
	@Override
	public int reportCount(int workNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select report_count from work where work_num=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workNum);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				return rs.getInt("report_count");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("작품 신고갯수 확인 오류");
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	/**
	 * 작품에 신고 카운트 수정
	 * @param workNum 작품 번호
	 * @param reportCount 신고 카운트 수정할 숫자
	 */
	@Override
	public void updateReportCount(int workNum, int reportCount) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update work set report_count = ? where work_num=?";
		
		try {
			conn = factory.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reportCount);
			pstmt.setInt(2, workNum);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("작품 신고갯수 수정 오류");
		} finally {
			factory.close(conn, pstmt);
		}
	}
	
	@Override
	public ArrayList<String> selectCount(String usersId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_id from users where user_id like(?)";
		ArrayList<String> list = new ArrayList<>();
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+usersId+"%");
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					list.add(rs.getString(1));
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return list;
	}
	
	@Override
	public List selectPrize() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from work where prize like ('%상%')";
		List prizeList = new ArrayList<>();
		
		try {
			conn = factory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				prizeList.add(new Work(rs.getInt("contest_num"), rs.getInt("work_num"), rs.getString("user_id"), rs.getString("user_nickname"), rs.getString("work_title"), rs.getString("work_content"), rs.getString("work_picture"), rs.getString("work_file"), rs.getInt("vote_count"), rs.getInt("report_count"), rs.getString("sub_date"), rs.getString("prize")));
			}
			return prizeList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	
}
