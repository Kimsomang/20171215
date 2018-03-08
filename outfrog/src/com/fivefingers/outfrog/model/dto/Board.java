package com.fivefingers.outfrog.model.dto;

public class Board {
	
	private String boardId;
	private int boardNum;
	private String boardTitle;
	private String postDate;
	private String userId;
	private String userNickname;
	private String boardContents;
	private int hits;
	private int reportCount;
	
	public Board() {
		
	}



	public Board(String boardId, String boardTitle, String userId, String userNickname, String boardContents) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.userId = userId;
		this.userNickname = userNickname;
		this.boardContents = boardContents;
	}

	public Board(String boardId, int boardNum, String boardTitle, String postDate, String userId,
			String userNickname, String boardContents, int hits, int reportCount) {
		super();
		this.boardId = boardId;
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.postDate = postDate;
		this.userId = userId;
		this.userNickname = userNickname;
		this.boardContents = boardContents;
		this.hits = hits;
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

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
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

	public String getBoardContents() {
		return boardContents;
	}


	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}


	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	

	
	
}
