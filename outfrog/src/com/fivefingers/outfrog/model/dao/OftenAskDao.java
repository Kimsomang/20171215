package com.fivefingers.outfrog.model.dao;

import java.util.ArrayList;

import com.fivefingers.outfrog.model.dto.OftenAsk;

/**
 * 자주 묻는 질문 DAO 인터페이스
 * - DAO 공통 기능 및 필수 구현 메서드 구축하는 인터페이스
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
public interface OftenAskDao {

	/** 
	 * 자주 묻는 질문 등록 메서드
	 * 
	 * @param dto OftenAsk객체
	 * @return 생성 결과 int 값 성공/실패 
	*/
	public int insertOftenAsk(OftenAsk dto);
	
	/** 
	 * 자주 묻는 질문 다중 조회 메서드
	 * - 질문리스트를 모두 담아 VIEW에 뿌리기 위한 메서드
	 *
	 * @return 자주 묻는 질문 리스트를 담은 객체
	*/
	public ArrayList<OftenAsk> selectAllOftenAsk();
	
	/** 
	 * 자주 묻는 질문 수정 메서드
	 * -관리자가 질문 내용 수정에 대한 요청을 처리하는 메서드
	 *
	 * @param askNum 질문 고유번호
	 * @param askComment 답변 내용
	 * @return int 수정 결과값
	 * 			
	*/
	public int updateOftenAsk(int askNum, String askComment);
	
	/** 자주 묻는 질문 삭제 메서드 
	 * 
	 * @param askNum 질문 고유번호
	 * @return int 질문 삭제 결과 값
	*/
	public int deleteOftenAsk(int askNum);
}
