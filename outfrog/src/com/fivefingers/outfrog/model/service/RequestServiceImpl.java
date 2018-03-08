package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fivefingers.outfrog.model.dao.RequestDaoImpl;
import com.fivefingers.outfrog.model.dto.Request;


@Service
public class RequestServiceImpl implements RequestService {

	@Autowired
	private RequestDaoImpl requestDao;
		
	public RequestServiceImpl() {}
	public RequestServiceImpl(RequestDaoImpl requestDao) {
		this.requestDao = requestDao;
	}

	/** 의뢰 삭제 */
	@Override
	public int deleteRequest(int requestnum) {
		// TODO Auto-generated method stub
		return requestDao.deleteRequest(requestnum);
	}

	/** 의뢰 등록 */
	@Override
	public int insertRequest(Request dto) {
		// TODO Auto-generated method stub
		return requestDao.insertRequest(dto);
	}

	/** 의뢰 리스트 */
	@Override
	public ArrayList<Request> selectRequest() {
		// TODO Auto-generated method stub
		return requestDao.selectRequest();
	}
	
	/** 의뢰 상세 보기 */
	@Override
	public Request requestView(int requestNum) {
		// TODO Auto-generated method stub
		return requestDao.requestView(requestNum);
	}
}
