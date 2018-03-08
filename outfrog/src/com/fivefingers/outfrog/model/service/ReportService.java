package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.fivefingers.outfrog.model.dto.Report;
import com.fivefingers.outfrog.model.dto.Work;

public interface ReportService {
	/**
	 * 신고 등록
	 * @param report 신고Dto
	 * @return 신고 등록 성공한 행수
	 */
	public int insertReport(Report report);
	
	/**
	 * 유형별 신고 리스트
	 * @param reportType 신고유형(작품,게시글,댓글)
	 * @return 유형별 신고 리스트
	 */
	public ArrayList<Report> selectReport(String reportType);
	
	/**
	 * 신고 수정
	 * @param process 처리결과
	 * @param typeNum 유형번호(작품번호,게시글번호)
	 * @param replyNum 댓글번호 
	 * @param what 신고유형(작품,게시글,댓글)
	 */
	public void updateReport(String process, int typeNum, int replyNum, String what);
	
	/**
	 * 처리된 신고 리스트
	 * @return 처리된 신고 리스트
	 */
	public ArrayList<Report> selectReportAfter();
	
	/**
	 * 아이디 검색 처리된 신고 리스트
	 * @param id 찾을 아이디
	 * @return 아이디 검색 처리된 신고 리스트
	 */
	public ArrayList<Report> searchReportAfter(String id);
	
	/**
	 * 신고유무 확인
	 * @param typeNum 유형번호(작품번호,게시글번호)
	 * @param replyNum 댓글번호 
	 * @param userId 아이디
	 * @return
	 */
	public boolean isReport(int typeNum, int replyNum, String userId);
	
	/**
	 * 정지사유 확인
	 * @param userId 아이디
	 * @return 정지사유
	 */
	public String whyBan(String userId);
	
	/**
	 * 신고수 조회
	 * @param userId 신고당한 회원 아이디
	 * @return 해당 회원의 신고수
	 */
	public int reportCount(String userId);
}
