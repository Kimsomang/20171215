package com.fivefingers.outfrog.model.dao;

import java.util.ArrayList;

import com.fivefingers.outfrog.model.dto.Question;

/**
 * 1:1질문 DAO 인터페이스
 * - DAO 공통 기능 및 필수 구현 메서드 구축하는 인터페이스
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
public interface QuestionDao {

	/** 
	 * 1:1질문 등록 메서드
	 * 
	 * @param dto Question 객체
	 * @return result 결과 int 값 
	*/
	public int insertQuestion(Question dto);
	
	/** 
	 * 1:1질문 단일 조회 메서드
	 * 
	 * @param questionNum 질문 고유번호
	 * @return 1:1질문 단일 객체
	*/
	public Question selectQuestion(int questionNum);
	
	/** 
	 * 1:1질문 다중 조회 메서드
	 * - 질문리스트를 모두 담아 VIEW에 뿌리기 위한 메서드
	 * - 사용자가 개인 질문리스트 보기
	 *
	 * @return 1:1질문 리스트를 담은 객체
	 */
	public ArrayList<Question> selectAllQuestion(String userNickname);
	
	/** 
	 * 1:1질문 다중 조회 메서드
	 * - 질문리스트를 모두 담아 VIEW에 뿌리기 위한 메서드
	 *
	 * @return 1:1질문 리스트를 담은 객체
	*/
	public ArrayList<Question> selectAllQuestion();
	
	/** 
	 * 1:1질문 수정 메서드
	 * -사용자가 질문 수정에 대한 요청을 처리하는 메서드
	 *
	 * @param questionNum 질문 고유번호
	 * @param questionTitle 수정할 질문 제목
	 * @param questionContent 수정할 질문 내용
	 * @return int 수정 결과값
	 * 			
	*/
	public int updateQuestion(int questionNum, String questionTitle, String questionContent);
	
	/** 
	 * 1:1질문 삭제 메서드 
	 * - 사용자가 등록한 질문을 삭제하는 메서드
	 * 
	 * @param questionNum 질문 고유번호
	 * @return int 삭제 결과 값
	*/
	public int deleteQuestion(int questionNum);
	
	/** 
	 * 1:1질문 답변대기중인 질문 조회 메서드 
	 * -사용자가 올린 질문 중 답변대기 상태인 질문들을 조회하는 메서드
	 * 
	 * @return 답변대기 질문 리스트 객체
	*/
	public ArrayList<Question> selectAllReadyComment();
	
	/** 관리자 답변 시 답변 관련 컬럼 수정 메서드 
	 *
	 * @param questionNum 질문 고유번호
	 * @param questionComment 수정할 질문 내용
	 * @return int 관리자 답변 수정 결과 값
	*/
	public int updateComment(int questionNum, String questionComment);
}
