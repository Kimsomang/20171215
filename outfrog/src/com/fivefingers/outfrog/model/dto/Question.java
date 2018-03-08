/**
 * 
 */
package com.fivefingers.outfrog.model.dto;

/**
 * 1:1 질문 DTO 클래스
 * - 1:1 질문 등록 수정 삭제에 필요한 데이터를 담는 클래스
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
public class Question {
	
	private int questionNum;
	private String userNickname;
	private String questionTitle;
	private String questionContent;
	private String writeDate;
	private String questionComment;
	private String commentState;
	
	/** 기본 생성자 */
	public Question() {}

	/**
	 * 1:1질문 전체 데이터를 매개변수로 하는 생성자
	 * 
	 * @param questionNum 질문 고유번호
	 * @param userNickname 사용자 별명
	 * @param questionTitle 질문 제목
	 * @param questionContent 질문 내용
	 * @param writeDate 작성날짜
	 * @param questionComment 질문 댓글
	 * @param commentState 댓글상태
	 */
	public Question(int questionNum, String userNickname, String questionTitle, String questionContent,
			String writeDate, String questionComment, String commentState) {
		super();
		this.questionNum = questionNum;
		this.userNickname = userNickname;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.writeDate = writeDate;
		this.questionComment = questionComment;
		this.commentState = commentState;
	}

	/**
	 * 1:1질문 등록을 위한 데이터를 매개변수로 하는 생성자
	 * 
	 * @param userNickname 사용자 별명
	 * @param questionTitle 질문 제목
	 * @param questionContent 질문 내용
	 * @param questionComment 질문 댓글
	 * @param commentState 댓글상태
	 */
	public Question(String userNickname, String questionTitle, String questionContent,
			String questionComment, String commentState) {
		super();
		this.userNickname = userNickname;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionComment = questionComment;
		this.commentState = commentState;
	}
	
	public int getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getQuestionComment() {
		return questionComment;
	}

	public void setQuestionComment(String questionComment) {
		this.questionComment = questionComment;
	}

	public String getCommentState() {
		return commentState;
	}

	public void setCommentState(String commentState) {
		this.commentState = commentState;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(questionNum);
		builder.append(", ");
		builder.append(userNickname);
		builder.append(", ");
		builder.append(questionTitle);
		builder.append(", ");
		builder.append(questionContent);
		builder.append(", ");
		builder.append(writeDate);
		builder.append(", ");
		builder.append(commentState);
		return builder.toString();
	}
	
}
