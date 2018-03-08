package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fivefingers.outfrog.model.dao.WorkDaoImpl;
import com.fivefingers.outfrog.model.dto.Work;

@Service
public class WorkServiceImpl implements WorkService{
	@Autowired
	private WorkDaoImpl workdao;
		
	public WorkServiceImpl() {}
	public WorkServiceImpl(WorkDaoImpl workdao) {
		this.workdao = workdao;
	}
	
	/**
	 * 작품 등록
	 * @param work 작품DTO
	 */
	@Override
	public boolean insertWork(Work work) {
		return workdao.insertWork(work);
	}
	
	/**
	 * 작품리스트 읽기(공모 상세보기)
	 * @param contestNum 공모 번호
	 */	
	@Override
	public ArrayList<Work> workList(int contestNum) {
		return workdao.workList(contestNum);
	}
	
	/**
	 * 작품 상세 읽기
	 * @param workNum 작품 번호
	 */	
	@Override
	public Work workView(int workNum) {
		return workdao.workView(workNum);
	}
	
	/**
	 * 작품 제목 검색
	 * @param contestNum 공모 번호
	 * @param title 작품 검색할 제목
	 */	
	@Override
	public ArrayList<Work> workSearchTitle(int contestNum, String title) {
		return workdao.workSearchTitle(contestNum, title);
	}
	
	/**
	 * 작품 내용 검색
	 * @param contestNum 공모 번호
	 * @param content 작품 검색할 내용
	 */
	@Override
	public ArrayList<Work> workSearchContent(int contestNum, String content) {
		return workdao.workSearchContent(contestNum, content);
	}
	
	/**
	 * 작품 제목+내용 검색
	 * @param contestNum 공모 번호
	 * @param str 작품 검색할 제목 또는 내용
	 */
	@Override
	public ArrayList<Work> workSearchTitleContent(int contestNum, String str) {
		return workdao.workSearchTitleContent(contestNum, str);
	}
	
	/**
	 * 작품 작성자 검색
	 * @param contestNum 공모 번호
	 * @param name 작품 검색할 작성자
	 */
	@Override
	public ArrayList<Work> workSearchName(int contestNum, String name) {
		return workdao.workSearchName(contestNum, name);
	}
	
	/**
	 * 투표유무 확인
	 * @param workNum 작품 번호
	 * @param userId 투표하는 유저
	 */
	@Override
	public boolean isVote(int workNum, String userId) {
		return workdao.isVote(workNum, userId);
	}
	
	/**
	 * 투표 테이블에 등록
	 * @param contestNum 공모 번호
	 * @param workNum 작품 번호
	 * @param userId 투표하는 유저
	 */
	@Override
	public void insertVote(int contestNum, int workNum, String userId) {
		workdao.insertVote(contestNum, workNum, userId);
	}
	
	/**
	 * 작품에 투표 카운트 확인
	 * @param workNum 작품 번호
	 */
	@Override
	public int voteCount(int workNum) {
		return workdao.voteCount(workNum);
	}
	
	/**
	 * 작품에 투표 카운트 수정
	 * @param workNum 작품 번호
	 * @param voteCount 투표 카운트 수정할 숫자
	 */
	@Override
	public void updateVote(int workNum, int voteCount) {
		workdao.updateVote(workNum, voteCount);
	}
	
	/**
	 * 투표 취소
	 * @param workNum 작품 번호
	 * @param userId 투표 카운트 수정할 숫자
	 */
	@Override
	public int deleteVote(int workNum, String userId) {
		return workdao.deleteVote(workNum, userId);
	}
	
	/**
	 * 현재시간('YYYY-MM-DD')
	 */
	@Override
	public String currentTime() {
		return workdao.currentTime();
	}
	
	/**
	 * 작품 삭제
	 * @param workNum 작품 번호
	 */
	@Override
	public void deleteWork(int workNum) {
		workdao.deleteWork(workNum);
	}
	
	/**
	 * 작품 삭제시 투표테이블에 해당 작품관련 삭제
	 * @param workNum 작품 번호
	 */
	@Override
	public int deleteVote(int workNum) {
		return workdao.deleteVote(workNum);
	}
	
	/**
	 * 작품 수정
	 * @param work 작품DTO
	 */
	@Override
	public void updateWork(Work work) {
		workdao.updateWork(work);
	}
	
	/**
	 * 수상 입력
	 * @param prize 수상명
	 * @param workNum 작품번호
	 */
	@Override
	public void prizeWork(String prize, int workNum) {
		workdao.prizeWork(prize, workNum);
	}
	
	/**
	 * 내 작품리스트
	 * @param userId 아이디
	 */	
	@Override
	public ArrayList<Work> myWorkList(String userId) {
		return workdao.myWorkList(userId);
	}
	
	/**
	 * 채택 유무
	 * @param contestNum 공모 번호
	 */
	@Override
	public int isChoose(int contestNum) {
		return workdao.isChoose(contestNum);
	}
	
	@Override
	public ArrayList<HashMap<String, String>> selectCount(ArrayList<String> usersId) {
		return workdao.selectCount(usersId);
	}
	
	@Override
	public List userVote(String userId) {
		return workdao.userVote(userId);
	}
	@Override
	public ArrayList<HashMap<String, Integer>> selectWorkCount(ArrayList<Integer> contestNums) {
		return workdao.selectWorkCount(contestNums);
	}
	
	/**
	 * 작품에 신고 카운트 확인
	 * @param workNum 작품 번호
	 */
	@Override
	public int reportCount(int workNum) {
		return workdao.reportCount(workNum);
	}
	
	/**
	 * 작품에 신고 카운트 수정
	 * @param workNum 작품 번호
	 * @param reportCount 신고 카운트 수정할 숫자
	 */
	@Override
	public void updateReportCount(int workNum, int reportCount) {
		workdao.updateReportCount(workNum, reportCount);
	}
	
	@Override
	public ArrayList<String> selectCount(String usersId) {
		return workdao.selectCount(usersId);
	}
	
	@Override
	public List selectPrize() {
		return workdao.selectPrize();
	}
}
