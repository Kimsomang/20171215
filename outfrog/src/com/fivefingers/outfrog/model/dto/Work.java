package com.fivefingers.outfrog.model.dto;

/**
 * 작품DTO
 * @author kosta
 *
 */
public class Work {

	/** 공모 번호*/
	private int contestNum;
	/** 작품 번호*/
	private int workNum;
	/** 작성자 아이디*/
	private String userId;
	/** 작성자 닉네임*/
	private String userNickname;
	/** 작품 제목*/
	private String workTitle;
	/** 작품 내용*/
	private String workContent;
	/** 작품 대표사진*/
	private String workPicture;
	/** 작품 파일*/
	private String workFile;
	/** 작품 투표수*/
	private int voteCount;
	/** 작품 신고수*/
	private int reportCount;
	/** 작품 제출일*/
	private String subDate;
	/** 작품 수상*/
	private String prize;
	
	public Work() {
		
	}
	
	public Work(int contestNum, int workNum, String userId, String userNickname, String workTitle, String workContent,
			String workPicture, String workFile, int voteCount, int reportCount, String subDate,String prize) {
		super();
		this.contestNum = contestNum;
		this.workNum = workNum;
		this.userId = userId;
		this.userNickname = userNickname;
		this.workTitle = workTitle;
		this.workContent = workContent;
		this.workPicture = workPicture;
		this.workFile = workFile;
		this.voteCount = voteCount;
		this.reportCount = reportCount;
		this.subDate = subDate;
		this.prize = prize;
	}

	public int getContestNum() {
		return contestNum;
	}

	public void setContestNum(int contestNum) {
		this.contestNum = contestNum;
	}

	public int getWorkNum() {
		return workNum;
	}

	public void setWorkNum(int workNum) {
		this.workNum = workNum;
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

	public String getWorkTitle() {
		return workTitle;
	}

	public void setWorkTitle(String workTitle) {
		this.workTitle = workTitle;
	}

	public String getWorkContent() {
		return workContent;
	}

	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}

	public String getWorkPicture() {
		return workPicture;
	}

	public void setWorkPicture(String workPicture) {
		this.workPicture = workPicture;
	}

	public String getWorkFile() {
		return workFile;
	}

	public void setWorkFile(String workFile) {
		this.workFile = workFile;
	}

	public int getVoteCount() {
		return voteCount;
	}

	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public String getSubDate() {
		return subDate;
	}

	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}

	public String getPrize() {
		return prize;
	}

	public void setPrize(String prize) {
		this.prize = prize;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(contestNum);
		builder.append(", ");
		builder.append(workNum);
		builder.append(", ");
		builder.append(userId);
		builder.append(", ");
		builder.append(userNickname);
		builder.append(", ");
		builder.append(workTitle);
		builder.append(", ");
		builder.append(workContent);
		builder.append(", ");
		builder.append(workPicture);
		builder.append(", ");
		builder.append(workFile);
		builder.append(", ");
		builder.append(voteCount);
		builder.append(", ");
		builder.append(reportCount);
		builder.append(", ");
		builder.append(subDate);
		builder.append(", ");
		builder.append(prize);
		return builder.toString();
	}
}
