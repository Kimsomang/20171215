package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fivefingers.outfrog.model.dao.QuestionDaoImpl;
import com.fivefingers.outfrog.model.dto.Question;

/**
 * 1:1질문 Service 클래스
 * - Controller에서 요청하는 공통 필수 서비스를 DAO에 전달
 * - 추가적인 서비스 DAO에 전달
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
@Service
public class QuestionServiceImpl implements QuestionService {
	// DAO injection ----------------------------------------
	@Autowired
	public QuestionDaoImpl questionDao;
	
	public void setQuestionDao(QuestionDaoImpl questionDao) {
		this.questionDao = questionDao;
	}
	//--------------------------------------------------------
	
	/** 1:1질문 등록 메서드 */
	@Override
	public int insertQuestion(Question dto) {
		return questionDao.insertQuestion(dto);
	}

	/** 1:1질문 단일 조회 메서드 */
	@Override
	public Question selectQuestion(int questionNum) {
		return questionDao.selectQuestion(questionNum);
	}
	
	/** 1:1질문 다중 조회 메서드 (개인) */
	@Override
	public ArrayList<Question> selectAllQuestion(String userNickname) {
		return questionDao.selectAllQuestion(userNickname);
	}

	/** 1:1질문 다중 조회 메서드 (관리자) */
	@Override
	public ArrayList<Question> selectAllQuestion() {
		return questionDao.selectAllQuestion();
	}

	/** 1:1질문 수정 메서드 */
	@Override
	public int updateQuestion(int questionNum, String questionTitle, String questionContent) {
		return questionDao.updateQuestion(questionNum, questionTitle, questionContent);
	}

	/** 1:1질문 삭제 메서드 */
	@Override
	public int deleteQuestion(int questionNum) {
		return questionDao.deleteQuestion(questionNum);
	}
	
	/** 1:1질문 답변대기중인 질문 조회 메서드 */
	@Override
	public ArrayList<Question> selectAllReadyComment(){
		return questionDao.selectAllReadyComment();
	}

	/** 관리자 답변 시 답변 관련 컬럼 수정 메서드 */
	@Override
	public int updateComment(int questionNum, String questionComment) {
		return questionDao.updateComment(questionNum, questionComment);
	}
}
