package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import com.fivefingers.outfrog.model.dto.OftenAsk;

/**
 * 자주 묻는 질문 Service 인터페이스
 * - Controller에서 요청하는 공통 필수 서비스를 DAO에 전달
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
public interface OftenAskService {
	/** 자주 묻는 질문 등록 메서드 */
	public int insertOftenAsk(OftenAsk dto);
	
	/** 자주 묻는 질문 다중 조회 메서드 */
	public ArrayList<OftenAsk> selectAllOftenAsk();
	
	/** 자주 묻는 질문 수정 메서드 */
	public int updateOftenAsk(int askNum, String askComment);
	
	/** 자주 묻는 질문 삭제 메서드 */
	public int deleteOftenAsk(int askNum);
}
