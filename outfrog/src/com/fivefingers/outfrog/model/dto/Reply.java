package com.fivefingers.outfrog.model.dto;

public class Reply {
	
	private String boardId;
	private int boardNum;
	private int replyNum;
	private String replyDate;
	private String userId;
	private String userNickname;
	private String replyContents;
	private int reportCount;
	
	public Reply() {
		
	}

	public Reply(String boardId, int boardNum, int replyNum, String replyDate, String userId, String userNickname,
			String replyContents, int reportCount) {
		super();
		this.boardId = boardId;
		this.boardNum = boardNum;
		this.replyNum = replyNum;
		this.replyDate = replyDate;
		this.userId = userId;
		this.userNickname = userNickname;
		this.replyContents = replyContents;
		this.reportCount = reportCount;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

}
