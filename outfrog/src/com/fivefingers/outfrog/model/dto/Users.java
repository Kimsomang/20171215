/**
 * 
 */
package com.fivefingers.outfrog.model.dto;

/**
 * @author kosta
 *
 */
public class Users {

	private String userId;
	private String userPw;
	private String userNickname;
	private String userName;
	private String userPhone1;
	private String userPhone2;
	private String userField;
	private String userGrade;
	private String userEmail;
	private String userGetmail;
	private String userGetsms;
	private String contestSponsor;
	private long groupNum;
	
	public Users() {
		
	}

	/**
	 * @param userId
	 * @param userPw
	 * @param userNickname
	 * @param userName
	 * @param userPhone1
	 * @param userPhone2
	 * @param userField
	 * @param userGrade
	 * @param userEmail
	 * @param userGetmail
	 * @param userGetsms
	 * @param contestSponsor
	 * @param groupNum
	 */
	public Users(String userId, String userPw, String userNickname, String userName, String userPhone1,
			String userPhone2, String userField, String userGrade, String userEmail, String userGetmail,
			String userGetsms, String contestSponsor, long groupNum) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userNickname = userNickname;
		this.userName = userName;
		this.userPhone1 = userPhone1;
		this.userPhone2 = userPhone2;
		this.userField = userField;
		this.userGrade = userGrade;
		this.userEmail = userEmail;
		this.userGetmail = userGetmail;
		this.userGetsms = userGetsms;
		this.contestSponsor = contestSponsor;
		this.groupNum = groupNum;
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the userPw
	 */
	public String getUserPw() {
		return userPw;
	}

	/**
	 * @param userPw the userPw to set
	 */
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	/**
	 * @return the userNickname
	 */
	public String getUserNickname() {
		return userNickname;
	}

	/**
	 * @param userNickname the userNickname to set
	 */
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the userPhone1
	 */
	public String getUserPhone1() {
		return userPhone1;
	}

	/**
	 * @param userPhone1 the userPhone1 to set
	 */
	public void setUserPhone1(String userPhone1) {
		this.userPhone1 = userPhone1;
	}

	/**
	 * @return the userPhone2
	 */
	public String getUserPhone2() {
		return userPhone2;
	}

	/**
	 * @param userPhone2 the userPhone2 to set
	 */
	public void setUserPhone2(String userPhone2) {
		this.userPhone2 = userPhone2;
	}

	/**
	 * @return the userField
	 */
	public String getUserField() {
		return userField;
	}

	/**
	 * @param userField the userField to set
	 */
	public void setUserField(String userField) {
		this.userField = userField;
	}

	/**
	 * @return the userGrade
	 */
	public String getUserGrade() {
		return userGrade;
	}

	/**
	 * @param userGrade the userGrade to set
	 */
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	/**
	 * @return the userEmail
	 */
	public String getUserEmail() {
		return userEmail;
	}

	/**
	 * @param userEmail the userEmail to set
	 */
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	/**
	 * @return the userGetmail
	 */
	public String getUserGetmail() {
		return userGetmail;
	}

	/**
	 * @param userGetmail the userGetmail to set
	 */
	public void setUserGetmail(String userGetmail) {
		this.userGetmail = userGetmail;
	}

	/**
	 * @return the userGetsms
	 */
	public String getUserGetsms() {
		return userGetsms;
	}

	/**
	 * @param userGetsms the userGetsms to set
	 */
	public void setUserGetsms(String userGetsms) {
		this.userGetsms = userGetsms;
	}

	/**
	 * @return the contestSponsor
	 */
	public String getContestSponsor() {
		return contestSponsor;
	}

	/**
	 * @param contestSponsor the contestSponsor to set
	 */
	public void setContestSponsor(String contestSponsor) {
		this.contestSponsor = contestSponsor;
	}

	/**
	 * @return the groupNum
	 */
	public long getGroupNum() {
		return groupNum;
	}

	/**
	 * @param groupNum the groupNum to set
	 */
	public void setGroupNum(long groupNum) {
		this.groupNum = groupNum;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("userId=");
		builder.append(userId);
		builder.append(", userPw=");
		builder.append(userPw);
		builder.append(", userNickname=");
		builder.append(userNickname);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", userPhone1=");
		builder.append(userPhone1);
		builder.append(", userPhone2=");
		builder.append(userPhone2);
		builder.append(", userField=");
		builder.append(userField);
		builder.append(", userGrade=");
		builder.append(userGrade);
		builder.append(", userEmail=");
		builder.append(userEmail);
		builder.append(", userGetmail=");
		builder.append(userGetmail);
		builder.append(", userGetsms=");
		builder.append(userGetsms);
		builder.append(", contestSponsor=");
		builder.append(contestSponsor);
		builder.append(", groupNum=");
		builder.append(groupNum);
		return builder.toString();
	}
	
}
