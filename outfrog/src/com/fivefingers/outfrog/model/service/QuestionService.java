package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import com.fivefingers.outfrog.model.dto.Question;

/**
 * 1:1질문 Service 인터페이스
 * - Controller에서 요청하는 공통 필수 서비스를 DAO에 전달
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
public interface QuestionService {
	/** 1:1질문 등록 메서드 */
	public int insertQuestion(Question dto);
	
	/** 1:1질문 단일 조회 메서드 */
	public Question selectQuestion(int questionNum);
	
	/** 1:1질문 다중 조회 메서드 (개인) */
	public ArrayList<Question> selectAllQuestion(String userNickname);
	
	/** 1:1질문 다중 조회 메서드 (관리자) */
	public ArrayList<Question> selectAllQuestion();
	
	/** 1:1질문 수정 메서드 */
	public int updateQuestion(int questionNum, String questionTitle, String questionContent);
	
	/** 1:1질문 삭제 메서드 */
	public int deleteQuestion(int questionNum);
	
	/** 1:1질문 답변대기중인 질문 조회 메서드 */
	public ArrayList<Question> selectAllReadyComment();
	
	/** 관리자 답변 시 답변 관련 컬럼 수정 메서드 */
	public int updateComment(int questionNum, String questionComment);
}
