package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fivefingers.outfrog.model.dao.ContestDaoImpl;
import com.fivefingers.outfrog.model.dto.Contest;

@Service
public class ContestServiceImpl implements ContestService {

	@Autowired
	private ContestDaoImpl contestDao;
		
	public ContestServiceImpl() {}
	public ContestServiceImpl(ContestDaoImpl contestDao) {
		this.contestDao = contestDao;
	}

	/** 기업이 의뢰한 공모를 등록하는 메서드 */
	@Override
	public int insertContest(Contest dto) {
		return contestDao.insertContest(dto);
	}

	/** 공모 데이터 전체를 담는 모든 컬럼을 불러오는 메서드 */
	@Override
	public ArrayList<Contest> selectContest() {
		return contestDao.selectContest();
	}
	
	/** Top 공모에 해당하는 공모 컬럼을 모두 가져오는 메서드 */
	@Override
	public ArrayList<Contest> selectTopContest() {
		return contestDao.selectTopContest();
	}
	
	/** 공모 고유번호를 통해 특정 공모 컬럼을 불러오는 메서드 */
	@Override
	public Contest contestView(int contestNum) {
		return contestDao.contestView(contestNum);
	}	
	
	/** 특정 공모의 수상자를 채택하는 메서드 */
	@Override
	public void chooseContest(String contestBenefit, int contestNum) {
		contestDao.chooseContest(contestBenefit, contestNum);
	}
	
	/** 공모 검색 결과를 조회하는 메서드 */
	@Override
	public List searchContest(String searchType, String searchText) {
		return contestDao.searchContest(searchType, searchText);
	}

	/** 회원의 관심분야 공모 리스트를 불러오는 메서드 */
	@Override
	public List userField(String userId) {
		return contestDao.userField(userId);
	}
	
	/** 회원의 즐겨찾기 공모 고유번호를 불러오는 메서드 */
	@Override
	public List userBookmark(String userId) {
		return contestDao.userBookmark(userId);
	}
	
	/** 회원의 공모 리스트를 조회하는 메서드 */
	@Override
	public List selectContest(String userId) {
		return contestDao.selectContest(userId);
	}
	
	/** 즐겨찾기 유무를 체크하는 메서드 */
	@Override
	public boolean isBookmark(int contestNum, String userId) {
		return contestDao.isBookmark(contestNum, userId);
	}
	
	/** 즐겨찾기를 추가하는 메서드 */
	@Override
	public void insertBookmark(int contestNum, String userId) {
		contestDao.insertBookmark(contestNum, userId);
	}
	
	/** 즐겨찾기 삭제하는 메서드 */
	@Override
	public void deleteBookmark(int contestNum, String userId) {
		contestDao.deleteBookmark(contestNum, userId);
	}
	
	/** 사용자의 통합 검색 결과를 처리하는 메서드 */
	@Override
	public ArrayList<Contest> totalSearch(String str) {
		return contestDao.totalSearch(str);
	}
	
	/** 특정 분야에 해당하는 검색을 처리하는 메서드 */
	@Override
	public ArrayList<Contest> fieldTotalSearch(String field, String str) {
		return contestDao.fieldTotalSearch(field, str);
	}
	
	/** 마감이 다가오는 공모 목록을 불러오는 메서드 */
	@Override
	public List<Contest> dueDateList() {
		return contestDao.dueDateList();
	}
}
