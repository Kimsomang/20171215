/**
 * 
 */
package com.fivefingers.outfrog.model.dto;

/**
 * 자주 묻는 질문 DTO 클래스
 * - 자주 묻는 질문 등록 수정 삭제에 필요한 데이터를 담는 클래스
 * 
 * @author 김지환
 * @version v1.0
 * @since jdk1.8
 */
public class OftenAsk {

	private int askNum;
	private String askCategory;
	private String askTitle;
	private String askComment;
	
	/** 기본 생성자 */
	public OftenAsk() {}

	/**
	 * 자주 묻는 질문 전체 데이터를 매개변수로 하는 생성자
	 * 
	 * @param askNum 질문 고유번호
	 * @param askCategory 질문 유형
	 * @param askTitle 질문 제목
	 * @param askComment 질문 답변
	 */
	public OftenAsk(int askNum, String askCategory, String askTitle, String askComment) {
		super();
		this.askNum = askNum;
		this.askCategory = askCategory;
		this.askTitle = askTitle;
		this.askComment = askComment;
	}

	/**
	 * 자주 묻는 질문 등록을 위한 데이터를 매개변수로 하는 생성자
	 * 
	 * @param askCategory 질문 유형
	 * @param askTitle 질문 제목
	 * @param askComment 질문 답변
	 */
	public OftenAsk(String askCategory, String askTitle, String askComment) {
		this.askCategory = askCategory;
		this.askTitle = askTitle;
		this.askComment = askComment;
	}
	
	public int getAskNum() {
		return askNum;
	}

	public void setAskNum(int askNum) {
		this.askNum = askNum;
	}

	public String getAskCategory() {
		return askCategory;
	}

	public void setAskCategory(String askCategory) {
		this.askCategory = askCategory;
	}

	public String getAskTitle() {
		return askTitle;
	}

	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}

	public String getAskComment() {
		return askComment;
	}

	public void setAskComment(String askComment) {
		this.askComment = askComment;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("askNum=");
		builder.append(askNum);
		builder.append(", askCategory=");
		builder.append(askCategory);
		builder.append(", askTitle=");
		builder.append(askTitle);
		builder.append(", askComment=");
		builder.append(askComment);
		return builder.toString();
	}
	
}
