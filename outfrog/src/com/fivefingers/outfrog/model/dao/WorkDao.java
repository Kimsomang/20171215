package com.fivefingers.outfrog.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.fivefingers.outfrog.model.dto.Work;

public interface WorkDao {
	/** 작품 등록 */
	public boolean insertWork(Work work);
	/** 작품리스트 읽기(공모 상세보기) */
	public ArrayList<Work> workList(int contestNum);
	/** 작품 상세 읽기 */
	public Work workView(int workNum);
	/** 작품 제목 검색 */
	public ArrayList<Work> workSearchTitle(int contestNum, String title);
	/** 작품 내용 검색 */
	public ArrayList<Work> workSearchContent(int contestNum, String content);
	/** 작품 제목+내용 검색 */
	public ArrayList<Work> workSearchTitleContent(int contestNum, String str);
	/** 작품 작성자 검색 */
	public ArrayList<Work> workSearchName(int contestNum, String name);
	/** 투표유무 확인 */
	public boolean isVote(int workNum, String userId);
	/** 투표 테이블에 등록 */
	public void insertVote(int contestNum, int workNum, String userId);
	/** 작품에 투표 카운트 확인 */
	public int voteCount(int workNum);
	/** 작품에 투표 카운트 수정 */
	public void updateVote(int workNum, int voteCount);
	/** 투표 취소 */
	public int deleteVote(int workNum, String userId);
	/** 현재시간('YYYY-MM-DD') */
	public String currentTime();
	/** 작품 삭제 */
	public void deleteWork(int workNum);
	/** 작품 삭제시 투표테이블에 해당 작품관련 삭제 */
	public int deleteVote(int workNum);
	/** 작품 수정 */
	public void updateWork(Work work);
	/** 작품 수상 입력 */
	public void prizeWork(String prize, int workNum);
	/** 내 작품리스트 */
	public ArrayList<Work> myWorkList(String userId);
	/** 채택유무 */
	public int isChoose(int contestNum);
	
	/**
	 * 회원 정보(투표수, 신고수, 작품수, 게시글수, 댓글수)조회
	 * @param usersId 조회하고자 하는 회원 아이디
	 * @return 조회된 회원 정보
	 */
	public ArrayList<HashMap<String, String>> selectCount(ArrayList<String> usersId);
	
	/**
	 * 회원 아이디 조회
	 * @param usersId 조회하고자 하는 회원 아이디
	 * @return 조회된 회원 정보
	 */
	public ArrayList<String> selectCount(String usersId);
	
	/**
	 * 회원의 투표 작품 리스트
	 * @param userId 회원 아이디
	 * @return 회원이 투표한 작품 리스트
	 */
	public List userVote(String userId);
	
	/**
	 * 공모의 작품수 조회
	 * @param contestNums 공모 번호 리스트
	 * @return 조회된 작품수 리스트
	 */
	public ArrayList<HashMap<String, Integer>> selectWorkCount(ArrayList<Integer> contestNums);
	
	/** 신고 카운트 확인 */
	public int reportCount(int workNum);
	
	/** 신고 카운트 수정 */
	public void updateReportCount(int workNum, int reportCount);
	
	/** 수상작 검색 */
	public List selectPrize();
}
