package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import com.fivefingers.outfrog.model.dto.Reply;

public interface ReplyService {
	/**
	 * 댓글 작성
	 * @param writeReply 댓글작성에 필요한 Dto
	 * @return 댓글 작성 성공/실패
	 */
	public int writeReply(Reply writeReply);
	/**
	 * 댓글 수정
	 * @param writeReply 댓글수정에 필요한 Dto
	 * @return 댓글 수정 성공/실패
	 */
	public int updateReply(Reply writeReply);
	/**
	 * 댓글 삭제
	 * @param boardId 게시판 아이디
	 * @param boardNum 게시글 번호
	 * @param replyNum 댓글 번호
	 * @return 댓글 삭제 성공/실패
	 */
	public int deleteReply(String boardId,int boardNum,int replyNum);
	/**
	 * 게시글에 작성된 댓글들 목록
	 * @param boardId 게시판 아이디
	 * @param boardNum 게시글 번호
	 * @return 자유게시판 게시글에 등록된 게시글 리스트
	 */
	public ArrayList<Reply> selectReply(String boardId,int boardNum);
	/**
	 * 댓글 작성자 아이디 확인
	 * @param boardNum 게시글 번호
	 * @param replyNum 댓글 번호
	 * @return 댓글 작성자 아이디
	 */
	public String writerId(int boardNum, int replyNum);
}
