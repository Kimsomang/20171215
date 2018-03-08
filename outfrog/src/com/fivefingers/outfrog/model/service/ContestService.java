package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;
import java.util.List;

import com.fivefingers.outfrog.model.dto.Contest;

public interface ContestService {
	/**
	 * 기업이 의뢰한 공모를 등록하는 메서드
	 * 
	 * @param dto 공모 dto 객체
	 * @return int 공모 등록 결과 값
	 */
	public int insertContest(Contest dto);
	
	/**
	 * 공모 데이터 전체를 담는 모든 컬럼을 불러오는 메서드
	 * 
	 * @return 공모 컬럼 모두를 담는 list 객체
	 */
	public ArrayList<Contest> selectContest();
	
	/**
	 * Top 공모에 해당하는 공모 컬럼을 모두 가져오는 메서드
	 * -즐겨찾기(bookmark)수 순서대로 내림차순 조회
	 * 
	 * @return Top 공모 컬럼 모두를 담는 list 객체
	 */
	public ArrayList<Contest> selectTopContest();
	
	/**
	 * 공모 고유번호를 통해 특정 공모 컬럼을 불러오는 메서드
	 * 
	 * @param contestNum 공모 고유번호
	 * @return 특정 공모 컬럼 dto 객체
	 */
	public Contest contestView(int contestNum);
	
	/**
	 * 특정 공모의 수상자를 채택하는 메서드
	 * - 시상 내역을 바탕으로 contestBenefit 컬럼 수정
	 * 
	 * @param contestBenefit 공모 혜택
	 * @param contestNum 공모 고유번호
	 */
	public void chooseContest(String contestBenefit, int contestNum);
	
	/**
	 * 공모 검색 결과 조회
	 * @param searchType 검색 조건
	 * @param searchText 검색하고자 하는 키워드
	 * @return 검색 조건과 키워드에 해당하는 공모 정보들
	 */
	public List searchContest(String searchType, String searchText);

	/**
	 * 회원의 관심분야 공모 리스트
	 * @param userId 회원 아이디
	 * @return 회원의 관심분야에 해당하는 공모 리스트
	 */
	public List userField(String userId);
	
	/**
	 * 회원의 즐겨찾기 공모 리스트
	 * @param userId 회원 아이디
	 * @return 회원이 즐겨찾기 해놓은 공모 리스트
	 */
	public List userBookmark(String userId);
	
	/**
	 * 회원의 공모 리스트 조회
	 * @param userId 회원 아이디
	 * @return 조회된 공모 리스트
	 */
	public List selectContest(String userId);
	
	/**
	 * 즐겨찾기 유무 체크
	 * @param contestNum 공모 번호
	 * @param userId 회원 아이디
	 * @return 즐겨찾기 되어있으면 true, 아니면 false 반환
	 */
	public boolean isBookmark(int contestNum, String userId);
	
	/**
	 * 즐겨찾기 추가
	 * @param contestNum 공모 번호
	 * @param userId 회원 아이디
	 */
	public void insertBookmark(int contestNum, String userId);
	
	/**
	 * 즐겨찾기 삭제
	 * @param contestNum 공모 번호
	 * @param userId 회원 아이디
	 */
	public void deleteBookmark(int contestNum, String userId);
	
	/**
	 * 사용자의 통합 검색 결과를 처리하는 메서드
	 * 
	 * @param str 검색 값
	 * @return 검색 결과에 대한 모든 공모 list 객체
	 */
	public ArrayList<Contest> totalSearch(String str);
	
	/**
	 * 특정 분야에 해당하는 검색을 처리하는 메서드
	 * 
	 * @param field 공모 분야
	 * @param str 검색 값
	 * @return 특정 분야에 해당하는 모든 공모 list 객체
	 */
	public ArrayList<Contest> fieldTotalSearch(String field, String str);
	
	/**
	 * 마감이 다가오는 공모 목록을 불러오는 메서드
	 * 
	 * @return 마감이 다가오는 공모 목록 list 객체
	 */
	public List<Contest> dueDateList();
}
