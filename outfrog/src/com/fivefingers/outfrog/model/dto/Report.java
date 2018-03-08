/**
 * 
 */
package com.fivefingers.outfrog.model.dto;

/**
 * @author kosta
 *
 */
public class Report {

	private String reportType;
	private int typeNum;
	private int replyNum;
	private String title;
	private String writer;
	private String reportReason;
	private String reporter;
	private String process;
	
	public Report() {
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public int getTypeNum() {
		return typeNum;
	}

	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public Report(String reportType, int typeNum, int replyNum, String title, String writer, String reportReason,
			String reporter, String process) {
		super();
		this.reportType = reportType;
		this.typeNum = typeNum;
		this.replyNum = replyNum;
		this.title = title;
		this.writer = writer;
		this.reportReason = reportReason;
		this.reporter = reporter;
		this.process = process;
	}

	@Override
	public String toString() {
		return "Report [reportType=" + reportType + ", typeNum=" + typeNum + ", replyNum=" + replyNum + ", title="
				+ title + ", writer=" + writer + ", reportReason=" + reportReason + ", reporter=" + reporter
				+ ", process=" + process + "]";
	}

	
}
