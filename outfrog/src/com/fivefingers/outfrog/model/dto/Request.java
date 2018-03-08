package com.fivefingers.outfrog.model.dto;

public class Request {

	private int requestNum;
	private String contestTitle;
	private String contestSponsor;
	private String contestField;
	private String contestBenefit;
	private String dueDate;
	private String userId;
	private long groupNum;
	private String contestContents;
	private String contestFile;

	public Request() {
	}
	
	public Request(int requestNum, String contestTitle, String contestSponsor, String contestField,
			String contestBenefit, String dueDate, String userId, long groupNum,
			String contestContents, String contestFile) {
		super();
		this.requestNum = requestNum;
		this.contestTitle = contestTitle;
		this.contestSponsor = contestSponsor;
		this.contestField = contestField;
		this.contestBenefit = contestBenefit;
		this.dueDate = dueDate;
		this.userId = userId;
		this.groupNum = groupNum;
		this.contestContents = contestContents;
		this.contestFile = contestFile;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(requestNum);
		builder.append(", ");
		builder.append(contestTitle);
		builder.append(", ");
		builder.append(contestSponsor);
		builder.append(", ");
		builder.append(contestField);
		builder.append(", ");
		builder.append(contestBenefit);
		builder.append(", ");
		builder.append(dueDate);
		builder.append(", ");
		builder.append(userId);
		builder.append(", ");
		builder.append(groupNum);
		builder.append(", ");
		builder.append(contestContents);
		builder.append(", ");
		builder.append(contestFile);
		return builder.toString();
	}

	public int getRequestNum() {
		return requestNum;
	}

	public void setRequestNum(int requestNum) {
		this.requestNum = requestNum;
	}

	public String getContestTitle() {
		return contestTitle;
	}

	public void setContestTitle(String contestTitle) {
		this.contestTitle = contestTitle;
	}

	public String getContestSponsor() {
		return contestSponsor;
	}

	public void setContestSponsor(String contestSponsor) {
		this.contestSponsor = contestSponsor;
	}

	public String getContestField() {
		return contestField;
	}

	public void setContestField(String contestField) {
		this.contestField = contestField;
	}

	public String getContestBenefit() {
		return contestBenefit;
	}

	public void setContestBenefit(String contestBenefit) {
		this.contestBenefit = contestBenefit;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(long groupNum) {
		this.groupNum = groupNum;
	}

	public String getContestContents() {
		return contestContents;
	}

	public void setContestContents(String contestContents) {
		this.contestContents = contestContents;
	}

	public String getContestFile() {
		return contestFile;
	}

	public void setContestFile(String contestFile) {
		this.contestFile = contestFile;
	}

}
