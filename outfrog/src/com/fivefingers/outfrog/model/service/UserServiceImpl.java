package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fivefingers.outfrog.model.dao.UserDao;
import com.fivefingers.outfrog.model.dto.Users;


@Service
public class UserServiceImpl implements UserService {

	// dao injection

	private UserDao userDao;

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public Users login(String id, String pw) {
		if(!userDao.isLogin(id,pw)) {
			return new Users("0","0","0","0","0","0","0","0","0","0","0","0",0);
		}

		return userDao.login(id, pw);
	}

	//	@Override
	//	public SnsUser getUserByNaverUser(NaverUser naverUser) {
	//		if(naverUser != null){
	//			String snsId = naverUser.getId();
	//			return (SnsUser)userDAO.getUserBySnsId(snsId);
	//		}
	//		return null;
	//	}

	public Users naverLogin(String id) {
		return userDao.naverLogin(id);
	}

	@Override
	public boolean isCheckId(String userId) {
		return userDao.isCheckId(userId);
	}

	@Override
	public int updateMyInfo(Users user) {
		return userDao.updateMyInfo(user);
	}

	@Override
	public int insertJoin(Users user) {
		return userDao.insertJoin(user);
	}

	@Override
	public boolean isCheckPw(String userId, String userPw) {
		return userDao.isCheckPw(userId, userPw);
	}

	@Override
	public int updateUserPw(String userId, String userPw) {
		return userDao.updateUserPw(userId, userPw);
	}

	@Override
	public boolean deleteUsers(String userId) {
		return userDao.deleteUsers(userId);
	}

	@Override
	public Users selectUser(String userId) {
		return userDao.selectUser(userId);
	}

	@Override
	public int updateMyCompanyInfo(Users user) {
		return userDao.updateMyCompanyInfo(user);
	}

	@Override
	public int updateUserGrade(String[] userId, String userGrade) {
		return userDao.updateUserGrade(userId, userGrade);
	}

	@Override
	public ArrayList<Users> selectAllUsers() {
		return userDao.selectAllUsers();
	}

	@Override
	public int updateUserGrade(String userId) {
		return userDao.updateUserGrade(userId);
	}
	@Override
	public boolean isCheckNickname(String userNickname) {
		return userDao.isCheckNickname(userNickname);
	}


	@Override
	public ArrayList<Users> selectBanUser() {
		return userDao.selectBanUser();
	}

}
