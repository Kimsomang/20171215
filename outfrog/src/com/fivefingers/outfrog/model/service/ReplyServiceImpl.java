package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fivefingers.outfrog.model.dao.BoardDao;
import com.fivefingers.outfrog.model.dao.ReplyDao;
import com.fivefingers.outfrog.model.dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	
	private ReplyDao replyDao;
	
	@Autowired
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	/**
	 * 댓글 작성
	 * @param writeReply 댓글작성에 필요한 Dto
	 * @return 댓글 작성 성공/실패
	 */
	@Override
	public int writeReply(Reply writeReply) {
		return replyDao.writeReply(writeReply);
	}

	/**
	 * 댓글 수정
	 * @param writeReply 댓글수정에 필요한 Dto
	 * @return 댓글 수정 성공/실패
	 */
	@Override
	public int updateReply(Reply writeReply) {
		return replyDao.updateReply(writeReply);
	}


	/**
	 * 게시글에 작성된 댓글들 목록
	 * @param boardId 게시판 아이디
	 * @param boardNum 게시글 번호
	 * @return 자유게시판 게시글에 등록된 게시글 리스트
	 */
	@Override
	public ArrayList<Reply> selectReply(String boardId,int boardNum) {
		return replyDao.selectReply(boardId,boardNum);
	}

	/**
	 * 댓글 삭제
	 * @param boardId 게시판 아이디
	 * @param boardNum 게시글 번호
	 * @param replyNum 댓글 번호
	 * @return 댓글 삭제 성공/실패
	 */
	@Override
	public int deleteReply(String boardId, int boardNum, int replyNum) {
		return replyDao.deleteReply(boardId,boardNum,replyNum);
	}

	/**
	 * 댓글 작성자 아이디 확인
	 * @param boardNum 게시글 번호
	 * @param replyNum 댓글 번호
	 * @return 댓글 작성자 아이디
	 */
	@Override
	public String writerId(int boardNum, int replyNum) {
		return replyDao.writerId(boardNum, replyNum);
	}
}
