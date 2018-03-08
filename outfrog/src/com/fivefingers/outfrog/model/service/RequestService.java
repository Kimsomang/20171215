package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import com.fivefingers.outfrog.model.dto.Request;

public interface RequestService {
	/**
	 * 의뢰 삭제
	 * @param requestNum 의뢰 번호
	 * @return 삭제 성공 행수
	 */
	public int deleteRequest(int requestNum);
	
	/**
	 * 의뢰 등록
	 * @param dto 의뢰DTO
	 * @return 등록 성공 행수
	 */
	public int insertRequest(Request dto);
	
	/**
	 * 의뢰 리스트
	 * @return 의뢰 리스트
	 */
	public ArrayList<Request> selectRequest();
	
	/**
	 * 의뢰 상세 보기
	 * @param requestNum 의뢰 번호
	 * @return 의뢰DTO
	 */
	public Request requestView(int requestNum);
}
