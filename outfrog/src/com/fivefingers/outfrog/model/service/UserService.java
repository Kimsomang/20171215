package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import com.fivefingers.outfrog.model.dto.Users;


public interface UserService {
	public Users login(String id, String pw);
	
	/**
	 * 아이디 중복 확인
	 * @param userId 중복 확인할 회원이 입력한 아이디
	 * @return 중복이면 true 중복 아니면 false
	 */
	public boolean isCheckId(String userId);
	public Users naverLogin(String id);
	/**
	 * 내정보 수정
	 * @param user 수정할 정보를 담은 Users dto
	 * @return 성공 여부(성공시 1, 실패시 0 반환)
	 */
	public int updateMyInfo(Users user);
	
	/**
	 * 회원가입
	 * @param user 회원가입 시 회원이 입력한 정보 Users dto
	 * @return 성공 여부(성공시 1, 실패시 0 반환)
	 * */
	public int insertJoin(Users user);
	
	/**
	 * 비밀번호 변경시 기존 비밀번호 일치 확인
	 * @param userId 세션에 담겨있던 회원 아이디
	 * @param userPw 일치 여부 확인을 위해 회원이 입력한 기존 비밀번호
	 * @return 일치하면 true 불일치하면 false
	 */
	public boolean isCheckPw(String userId, String userPw);
	
	/**
	 * 비밀번호 변경
	 * @param userId 세션에 담겨있던 회원 아이디
	 * @param userPw 변경할 비밀번호
	 * @return 성공 여부(성공시 1, 실패시 0  반환)
	 */
	public int updateUserPw(String userId, String userPw);
	
	/**
	 * 회원 탈퇴
	 * @param userId 세션에 담겨있던 회원 아이디
	 * @return 성공여부(성공시 true, 실패시 false 반환)
	 */
	public boolean deleteUsers(String userId);
	
	public int updateMyCompanyInfo(Users user);
	public Users selectUser(String userId);
	
	/**
	 * 회원 등급 변경
	 * @param userId
	 * @param userGrade
	 * @return
	 */
	public int updateUserGrade(String[] userId, String userGrade);
	
	/**
	 * 회원 전체 조회
	 * @return 전체 회원 정보
	 */
	public ArrayList<Users> selectAllUsers();
	
	   /**
	    * UserGrade 변경
	    * @param userId 세션에 담겨있던 회원 아이디
	    * @return 성공 여부(성공시 1, 실패시 0  반환)
	    */
	   public int updateUserGrade(String userId);
	   
	   /**
	   	 * 닉네임 중복 확인
	   	 * @param userNickname 회원 닉네임
	   	 * @return 중복시 true, 중복 아닐 시 false
	   	 */
		public boolean isCheckNickname(String userNickname);
		
		/**
		 * Ban 사용자 검색
		 * @return grade 가 X 인 회원목록
		 */
		public ArrayList<Users> selectBanUser();
	
}
