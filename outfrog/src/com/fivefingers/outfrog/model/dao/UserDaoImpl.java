package com.fivefingers.outfrog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fivefingers.outfrog.model.dto.Users;


@Repository
public class UserDaoImpl implements UserDao{
	
	//factory dao injection
	
	@Resource
	private FactoryDao factoryDao;
	
    private static UserDaoImpl dao;
    
    
    public static UserDaoImpl getInstance() {
        if (dao == null) {
            dao = new UserDaoImpl();
        }
        return dao;
    }/*
    
    public UserDaoImpl(FactoryDao factoryDao) {
    	this.factoryDao = factoryDao;
    }*/
    
	@Autowired
    public void setFactoryDao(FactoryDao factoryDao) {
		this.factoryDao = factoryDao;
	}
    
    public UserDaoImpl() {
    }
    
    
    
    /**
     * <pre>
     * 로그인
     * </pre>
     * @param id
     * @param pw
     * @return grade
     */
    public Users login(String id, String pw) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String query = "select * from users where user_id=? and user_pw=?";
    	try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			Users user = new Users();
			if(rs.next()) {
				user = new Users();
				
				user.setUserId(rs.getString("user_id"));
				user.setUserPw(rs.getString("user_pw"));
				user.setUserNickname(rs.getString("user_nickname"));
				user.setUserName(rs.getString("user_name"));
				user.setUserPhone1(rs.getString("user_phone1"));
				user.setUserPhone2(rs.getString("user_phone2"));
				user.setUserField(rs.getString("user_field"));
				user.setUserGrade(rs.getString("user_grade"));
				user.setUserEmail(rs.getString("user_email"));
				user.setUserGetmail(rs.getString("user_getmail"));
				user.setUserGetsms(rs.getString("user_getsms"));
				user.setContestSponsor(rs.getString("contest_sponsor"));
				user.setGroupNum(rs.getLong("group_num"));
			}
			return user;
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
				factoryDao.close(conn, pstmt, rs);
		}
    	return null;
    }
    
    public boolean isLogin(String id, String pw) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String grade = null;
    	String query = "select 'true' from users where user_id='"+id+"' and user_pw='"+pw+"'";
    	try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			return rs.next();
		
		} catch (SQLException e) {
			System.out.println(e);
		} finally { 
				factoryDao.close(conn, pstmt, rs);
		}
    	return false;
    }
    
    public Users naverLogin(String id) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String query = "select * from users where user_id=?";
    	try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			Users user = new Users("0","0","0","0","0","0","0","0","0","0","0","0",0);
			if(rs.next()) {
				user = new Users();
				
				user.setUserId(rs.getString("user_id"));
				user.setUserPw(rs.getString("user_pw"));
				user.setUserNickname(rs.getString("user_nickname"));
				user.setUserName(rs.getString("user_name"));
				user.setUserPhone1(rs.getString("user_phone1"));
				user.setUserPhone2(rs.getString("user_phone2"));
				user.setUserField(rs.getString("user_field"));
				user.setUserGrade(rs.getString("user_grade"));
				user.setUserEmail(rs.getString("user_email"));
				user.setUserGetmail(rs.getString("user_getmail"));
				user.setUserGetsms(rs.getString("user_getsms"));
				user.setContestSponsor(rs.getString("contest_sponsor"));
				user.setGroupNum(rs.getLong("group_num"));
			}
			return user;
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
				factoryDao.close(conn, pstmt, rs);
		}
    	return null;
    }
    
   

    @Override
	public boolean isCheckId(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where user_id=?";
		
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt, rs);
		}
		return false;
	}

	@Override
	public int updateMyInfo(Users user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update users set user_nickname=?, user_name=?, user_phone1=?, user_phone2=?, user_field=?, user_getmail=?, user_getsms=? where user_id=?";
		
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserNickname());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserPhone1());
			pstmt.setString(4, user.getUserPhone2());
			pstmt.setString(5, user.getUserField());
			pstmt.setString(6, user.getUserGetmail());
			pstmt.setString(7, user.getUserGetsms());
			pstmt.setString(8, user.getUserId());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}

	@Override
	public int insertJoin(Users user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPw());
			pstmt.setString(3, user.getUserNickname());
			pstmt.setString(4, user.getUserName());
			pstmt.setString(5, user.getUserPhone1());
			pstmt.setString(6, user.getUserPhone2());
			pstmt.setString(7, user.getUserField());
			pstmt.setString(8, "G");
			pstmt.setString(9, user.getUserId());
			pstmt.setString(10, user.getUserGetmail());
			pstmt.setString(11, user.getUserGetsms());
			pstmt.setString(12, null);
			pstmt.setInt(13, 0);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}

	@Override
	public boolean isCheckPw(String userId, String userPw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_pw from users where user_id=?";
		String pw = null;
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString("user_pw");
			}
			
			if(userPw.equals(pw)) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt, rs);
		}
		return false;
	}

	@Override
	public int updateUserPw(String userId, String userPw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update users set user_pw=? where user_id=?";
		
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPw);
			pstmt.setString(2, userId);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}

	@Override
	public boolean deleteUsers(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from users where user_id=?";
		
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			int result = pstmt.executeUpdate();
			
			if(result != 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return false;
	}
	
	@Override
	public Users selectUser(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Users users = null;
		
		String sql="select * from users where user_id = ?";
		
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				users = new Users();
				users.setUserId(rs.getString("user_id"));
				users.setUserPw(rs.getString("user_pw"));
				users.setUserNickname(rs.getString("user_nickname"));
				users.setUserName(rs.getString("user_name"));
				users.setUserPhone1(rs.getString("user_phone1"));
				users.setUserPhone2(rs.getString("user_phone2"));
				users.setUserField(rs.getString("user_field"));
				users.setUserGrade(rs.getString("user_grade"));
				users.setUserEmail(rs.getString("user_email"));
				users.setUserGetmail(rs.getString("user_getmail"));
				users.setUserGetsms(rs.getString("user_getsms"));
				users.setContestSponsor(rs.getString("contest_sponsor"));
				users.setGroupNum(rs.getLong("group_num"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt);
		}

		return users;
	}

	@Override
	public int updateMyCompanyInfo(Users user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update users set contest_sponsor=?, group_num=? , user_email=?, user_phone1=?, user_phone2=?, user_getmail=?,user_getsms=? where user_id=?";
		
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getContestSponsor());
			pstmt.setLong(2, user.getGroupNum());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserPhone1());
			pstmt.setString(5, user.getUserPhone2());
			pstmt.setString(6, user.getUserGetmail());
			pstmt.setString(7, user.getUserGetsms());
			pstmt.setString(8, user.getUserId());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return 0;
	}
	
	@Override
	public int updateUserGrade(String[] userId, String userGrade) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update users set user_grade=? where user_id=?";
		int updateNum = 0;
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userGrade);
			for(int i = 0; i < userId.length; i++) {
				pstmt.setString(2, userId[i]);
				updateNum = updateNum + pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt);
		}
		return updateNum;
	}

	@Override
	public ArrayList<Users> selectAllUsers() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users order by user_grade desc";
		ArrayList<Users> list = new ArrayList<>();
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Users user = new Users();
			while(rs.next()) {
				user = new Users();
				user.setUserId(rs.getString("user_id"));
				user.setUserPw(rs.getString("user_pw"));
				user.setUserNickname(rs.getString("user_nickname"));
				user.setUserName(rs.getString("user_name"));
				user.setUserPhone1(rs.getString("user_phone1"));
				user.setUserPhone2(rs.getString("user_phone2"));
				user.setUserField(rs.getString("user_field"));
				user.setUserGrade(rs.getString("user_grade"));
				user.setUserEmail(rs.getString("user_email"));
				user.setUserGetmail(rs.getString("user_getmail"));
				user.setUserGetsms(rs.getString("user_getsms"));
				user.setContestSponsor(rs.getString("contest_sponsor"));
				user.setGroupNum(rs.getLong("group_num"));
				
				list.add(user);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt, rs);
		}
		return null;
	}
	
	@Override
	   public int updateUserGrade(String userId) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      String sql = "update users set user_grade='S' where user_id=?";
	      
	      try {
	         conn = factoryDao.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userId);
	         
	         return pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         factoryDao.close(conn, pstmt);
	      }
	      return 0;
	   }
	
	@Override
	public boolean isCheckNickname(String userNickname) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where user_nickname=?";
		
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt, rs);
		}
		return false;
	}
	
	@Override
	public ArrayList<Users> selectBanUser() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where user_grade = 'X'";
		ArrayList<Users> banList = new ArrayList<>();
		
		try {
			conn = factoryDao.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				banList.add(new Users(rs.getString("user_id"), rs.getString("user_pw"), rs.getString("user_nickname"), rs.getString("user_name"), rs.getString("user_phone1"), rs.getString("user_phone2"), rs.getString("user_field"), rs.getString("user_grade"), rs.getString("user_email"), rs.getString("user_getmail"), rs.getString("user_getsms"), rs.getString("contest_sponsor"), rs.getLong("group_num")));
			}
			
			return banList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			factoryDao.close(conn, pstmt, rs);
		}
		return null;
	}
	
}