package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import com.fivefingers.outfrog.model.dto.Board;

public interface BoardService {
	
	/**
	 * 자유 게시판 등록
	 * @param board
	 * @return 자유게시판 게시글 등록 성공/실패
	 */
	public int freeBoardWrite(Board board);
	/**
	 * 자유 게시판 전체 확인
	 * @return 자유 게시판 전체 리스트
	 */
	public ArrayList<Board> selectAllBoard();
	/**
	 * 자유게시판 게시글 상세 보기
	 * @param boardId 게시판아이디(T/F)
	 * @param bNum 게시글번호
	 * @return 선택 게시글 상세정보
	 */
	public Board freeBoardView(String boardId, int bNum);
	/**
	 * 자유게시판 게시글 삭제
	 * @param bId 게시판아이디
	 * @param bNum 게시글 번호
	 * @return 선택 게시글 삭제 성공/실패
	 */
	public int deleteBoard(int bNum, String bId);
	/**
	 * 자유게시판 게시글 수정
	 * @param bNum 게시글 번호
	 * @param bId 게시판아이디
	 * @param textarea 수정 내용
	 * @return 선택 게시글 수정 성공/실패
	 */
	public int updateBoard(int bNum, String bId, String textarea);
	/**
	 * 공지게시글 등록
	 * @param boardWriteDto 공지게시글 등록 Dto
	 * @return 공지게시글 등록 성공/실패
	 */
	public int noticeBoardWrite(Board boardWriteDto);
	/**
	 * 전체 공지게시글 보기
	 * @return 전체 공지게시글 리스트
	 */
	public ArrayList<Board> selectAllNoticeBoard();
	/**
	 * 선택한 공지 게시판 게시글 상세확인
	 * @param bNum 게시글 번호
	 * @return 선택한 게시글 
	 */
	public Board noticeBoardView(int bNum);
	/**
	 * 공지게시판 게시글 삭제
	 * @param bNum 게시글 번호
	 * @return 공지게시판 게시글 삭제 성공/실패
	 */
	public int noticeDeleteBoard(int bNum);
	/**
	 * 공지게시판 게시글 수정
	 * @param bNum 게시글 번호
	 * @param textarea 수정 내용
	 * @return 게시글 수정 성공/실패
	 */
	public int noticeUpdateBoard(int bNum, String textarea);
	/**
	 * 자유게시판 카테고리 [자유] 선택시 전체 보기
	 * @return [자유] 태그 게시글만 전체 확인
	 */
	public ArrayList<Board> selectAllFreeBoard();
	/**
	 * 자유게시판 카테고리 [TIP] 선택시 전체 보기
	 * @return [꿀팁] 태그 게시글만 전체 확인
	 */
	public ArrayList<Board> selectAllTipBoard();
	/**
	 * 제목으로 게시글 검색 
	 * @param title 검색할 게시글 제목
	 * @return 검색한 게시글 제목에 해당하는 게시글 목록
	 */
	public ArrayList<Board> searchTitleBoard(String title);
	/**
	 * 내용으로 게시글 검색
	 * @param contents 검색할 게시글 내용
	 * @return 검색한 게시글 내용에 해당하는 게시글 목록
	 */
	public ArrayList<Board> searchContentsBoard(String contents);
	/**
	 * 제목+내용으로 게시글 검색
	 * @param title 검색할 게시글 제목
	 * @param contents 검색할 게시글 내용
	 * @return 검색한 게시글 제목or내용에 해당하는 게시글 목록들
	 */
	public ArrayList<Board> searchTitleContentsBoard(String title, String contents);
	/**
	 * 작성자 아이디로 게시글 검색
	 * @param Id 작성자 아이디
	 * @return 작성자 아이디로 검색한 게시글 목록들
	 */
	public ArrayList<Board> searchIdBoard(String Id);
	/**
	 * 게시글 신고 수 정보
	 * @param boardNum 게시글 번호
	 * @return 게시글이 신고 받은 횟수
	 */
	public int boardReportCount(int boardNum);
	/**
	 * 게시글 신고 카운트 증가
	 * @param boardNum 게시글 번호
	 * @param count 신고받은 수
	 */
	public void updateReportCount(int boardNum, int count);
	/**
	 * 게시글 상세 정보 확인
	 * @param bNum 게시글 번호
	 * @return 해당 게시글 상제 정보
	 */
	public Board freeBoardView(int bNum);
}
