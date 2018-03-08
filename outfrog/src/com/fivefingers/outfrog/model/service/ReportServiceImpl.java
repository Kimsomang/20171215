package com.fivefingers.outfrog.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fivefingers.outfrog.model.dao.ReportDaoImpl;
import com.fivefingers.outfrog.model.dao.WorkDaoImpl;
import com.fivefingers.outfrog.model.dto.Report;
import com.fivefingers.outfrog.model.dto.Work;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDaoImpl reportDao;

	public ReportServiceImpl() {}
	public ReportServiceImpl(ReportDaoImpl reportDao) {
		this.reportDao = reportDao;
	}

	/** 신고 등록 */
	@Override
	public int insertReport(Report report) {
		return reportDao.insertReport(report);
	}

	/** 유형별 신고 리스트 */
	@Override
	public ArrayList<Report> selectReport(String reportType) {
		return reportDao.selectReport(reportType);
	}

	/** 신고 수정 */
	@Override
	public void updateReport(String process, int typeNum, int replyNum, String what) {
		reportDao.updateReport(process, typeNum, replyNum, what);
	}

	/** 처리된 신고 리스트 */
	@Override
	public ArrayList<Report> selectReportAfter() {
		return reportDao.selectReportAfter();
	}

	/** 아이디 검색 처리된 신고 리스트 */
	@Override
	public ArrayList<Report> searchReportAfter(String id) {
		return reportDao.searchReportAfter(id);
	}

	/** 신고유무 확인 */
	@Override
	public boolean isReport(int typeNum, int replyNum, String userId) {
		return reportDao.isReport(typeNum, replyNum, userId);
	}
	
	/** 정지사유 확인 */
	@Override
	public String whyBan(String userId) {
		return reportDao.whyBan(userId);
	}
	
	/** 신고수 조회 */
	@Override
	public int reportCount(String userId) {
		return reportDao.reportCount(userId);
	}

}
