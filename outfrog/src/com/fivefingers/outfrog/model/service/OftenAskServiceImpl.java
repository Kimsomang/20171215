package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fivefingers.outfrog.model.dao.OftenAskDaoImpl;
import com.fivefingers.outfrog.model.dao.QuestionDaoImpl;
import com.fivefingers.outfrog.model.dto.OftenAsk;

/**
 * 자주 묻는 질문 Service 클래스
 * - Controller에서 요청하는 공통 필수 서비스를 DAO에 전달
 * - 추가적인 서비스 DAO에 전달
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
@Service
public class OftenAskServiceImpl implements OftenAskService {
	// DAO injection ----------------------------------------
	@Autowired
	public OftenAskDaoImpl oftenAskDao;
	
	public void setOftenAskDao(OftenAskDaoImpl oftenAskDao) {
		this.oftenAskDao = oftenAskDao;
	}
	//--------------------------------------------------------

	/** 자주 묻는 질문 등록 메서드 */
	@Override
	public int insertOftenAsk(OftenAsk dto) {
		return oftenAskDao.insertOftenAsk(dto);
	}

	/** 자주 묻는 질문 다중 조회 메서드 */
	@Override
	public ArrayList<OftenAsk> selectAllOftenAsk() {
		return oftenAskDao.selectAllOftenAsk();
	}

	/** 자주 묻는 질문 수정 메서드 */
	@Override
	public int updateOftenAsk(int askNum, String askComment) {
		return oftenAskDao.updateOftenAsk(askNum, askComment);
	}

	/** 자주 묻는 질문 삭제 메서드 */
	@Override
	public int deleteOftenAsk(int askNum) {
		return oftenAskDao.deleteOftenAsk(askNum);
	}

}
