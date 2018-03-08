package com.fivefingers.outfrog;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fivefingers.outfrog.bo.NaverLoginBO;
import com.fivefingers.outfrog.model.dto.Board;
import com.fivefingers.outfrog.model.dto.Contest;
import com.fivefingers.outfrog.model.dto.OftenAsk;
import com.fivefingers.outfrog.model.dto.Question;
import com.fivefingers.outfrog.model.dto.Reply;
import com.fivefingers.outfrog.model.dto.Report;
import com.fivefingers.outfrog.model.dto.Request;
import com.fivefingers.outfrog.model.dto.Users;
import com.fivefingers.outfrog.model.dto.Work;
import com.fivefingers.outfrog.model.service.BoardService;
import com.fivefingers.outfrog.model.service.ContestService;
import com.fivefingers.outfrog.model.service.OftenAskService;
import com.fivefingers.outfrog.model.service.QuestionService;
import com.fivefingers.outfrog.model.service.ReplyService;
import com.fivefingers.outfrog.model.service.ReportService;
import com.fivefingers.outfrog.model.service.RequestService;
import com.fivefingers.outfrog.model.service.UserService;
import com.fivefingers.outfrog.model.service.WorkService;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// UserService injection---------------------------------------------
	private UserService userService;
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//-------------------------------------------------------------------

	// RequestService injection------------------------------------------
	private RequestService requestService;

	@Autowired
	public void RequestService(RequestService requestService) {
		this.requestService = requestService;
	}
	//-------------------------------------------------------------------
	
	// ContestService injection------------------------------------------
	private ContestService contestService;
	
	@Autowired
	public void ContestService(ContestService contestService) {
		this.contestService = contestService;
	}
	//-------------------------------------------------------------------

	// WorkService injection---------------------------------------------
	private WorkService workService;

	@Autowired
	public void WorkService(WorkService workService) {
		this.workService = workService;
	}
	//-------------------------------------------------------------------
	
	// BoardService injection--------------------------------------------
	private BoardService boardService;
	
	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	//-------------------------------------------------------------------

	// ReplyService injection--------------------------------------------
	private ReplyService replyService;

	@Autowired
	public void ReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	//-------------------------------------------------------------------
	
	// OftenAskService injection-----------------------------------------
	@Autowired
	public OftenAskService oftenAskService;

	public void setOftenAskService(OftenAskService oftenAskService) {
		this.oftenAskService = oftenAskService;
	}
	//-------------------------------------------------------------------

	// QuestionService injection-----------------------------------------
	@Autowired
	public QuestionService questionService;

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}
	//-------------------------------------------------------------------

	// ReportService injection-------------------------------------------
	private ReportService reportService;

	@Autowired
	public void ReportService(ReportService reportService) {
		this.reportService = reportService;
	}
	//-------------------------------------------------------------------
	
	// naverIdLogin injection-----------------------------------------
	private NaverLoginBO naverLoginBO;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
	//-------------------------------------------------------------------
	
	
/**----------------------------------------------------------- VIEW 관련 메서드 ----------------------------------------------------- */
	/**
	 * 시작 페이지 이동
	 * 
	 * @return 시작 화면 이동 경로
	 */
	@RequestMapping("index.do")
	public String index() {
		return "index";
	}
	
	
	/**
	 * 로그인 페이지 이동
	 * 
	 * @return 로그인 화면 이동 경로 및 객체 전달 값
	 */
	//로그인 화면
	@RequestMapping("login.do")
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("flag", true);
		request.setAttribute("flag", false);
		mv.setViewName("login");
		return mv;
	}
	
	/**
	 * 회원가입 페이지 이동
	 * 
	 * @return 회원가입 화면 이동 경로
	 */
	@RequestMapping("join.do")
	public String join() {
		return "join";
	}
	
	//'G'등급 사용자 메인 화면
	/**
	 * 사용자(G등급) 메인 화면 이동
	 * 
	 * @param session 세션
	 * @return 메인 화면 이동 경로 및 객체 전달 값
	 */
	@RequestMapping("userMain.do")
	public ModelAndView userMainView(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String id = (String)session.getAttribute("userId");
		String grade = (String)session.getAttribute("userGrade");
		if(grade.equals("null")) {
			mv.setViewName("member/login");
		}

		else if(grade.equals("G")) {
			List fieldList = workService.myWorkList(id);
			if(fieldList != null && fieldList.size() != 0) {
				mv.addObject("fieldList", fieldList);
			}
			List bookmarkList = contestService.userBookmark(id);
			if(bookmarkList != null && bookmarkList.size() != 0) {
				mv.addObject("bookmarkList", bookmarkList);
			}
			List voteList = workService.userVote(id);
			if(voteList != null && voteList.size() != 0) {
				mv.addObject("voteList", voteList);
			}
			mv.setViewName("userMain");
		}

		else if(grade.equals("S")) {
			List<Contest> list = contestService.selectContest(id);
			ArrayList<Map<String,Integer>> benefitList = new ArrayList<>();
			if(list != null && list.size() != 0) {
				mv.addObject("list", list);
				for(int i = 0; i < list.size(); i++) {
					if(workService.isChoose(list.get(i).getContestNum()) != 0) {
						Map<String, Integer> workMap = new HashMap<>();
						workMap.put("contestNum", list.get(i).getContestNum());
						benefitList.add(workMap);
					}
				}
				mv.addObject("benefitList", benefitList);
			}
			List<Contest> contestList = contestService.selectContest(id);
			for(int index = 0; index < contestList.size(); index++) {
				for(int j = 0; j < benefitList.size(); j++) {
					if(contestList.get(index).getContestNum() == benefitList.get(j).get("contestNum")) {
						contestList.remove(index);
						index--;
					}
				}
			}
			mv.addObject("contestList", contestList);
			mv.setViewName("semiAdminMain");
		}
		else if(grade.equals("A")) {
			List requestList = requestService.selectRequest();
			if(requestList != null && requestList.size() != 0) {
				mv.addObject("requestList", requestList);
			}
			List reportWorkList = reportService.selectReport("작품");
			if(reportWorkList != null && reportWorkList.size() != 0) {
				mv.addObject("reportWorkList", reportWorkList);
			}
			List reportBoardList = reportService.selectReport("게시글");
			if(reportBoardList != null && reportBoardList.size() != 0) {
				mv.addObject("reportBoardList", reportBoardList);
			}
			List reportReplyList = reportService.selectReport("댓글");
			if(reportReplyList != null && reportReplyList.size() != 0) {
				mv.addObject("reportReplyList", reportReplyList);
			}
			List questionList = questionService.selectAllReadyComment();
			if(questionList != null && questionList.size() != 0) {
				mv.addObject("questionList", questionList);
			}
			List workList = workService.selectPrize();
			if(workList != null && workList.size() != 0) {
				mv.addObject("workList", workList);
			}
			List<Users> banList = userService.selectBanUser();
			ArrayList<Map<String, String>> banUserList = new ArrayList<>();
			if(banList != null && banList.size() != 0) {
				for(int i = 0; i < banList.size(); i++) {
					Map<String, String> ban = new HashMap<>();
					ban.put("userId", banList.get(i).getUserId());
					ban.put("userGrade", banList.get(i).getUserGrade());
					ban.put("reportCount", reportService.reportCount(banList.get(i).getUserId())+"");
					banUserList.add(ban);
				}
			}
			List dueDateList = contestService.dueDateList();
			if(dueDateList != null && dueDateList.size() != 0) {
				mv.addObject("dueDateList", dueDateList);
			}
			mv.addObject("banList", banUserList);
			mv.setViewName("adminMain");
		}
		return mv;
	}

	//'S'등급 사용자 메인 화면
	/**
	 * 사용자(S등급) 메인 화면 이동
	 * 
	 * @param session 세션
	 * @return 메인 화면 이동 경로 및 객체 전달 값
	 */
	@RequestMapping("semiAdminMain.do")
	public ModelAndView semiAdminMainView(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String id = (String)session.getAttribute("userId");
		String grade = (String)session.getAttribute("userGrade");
		if(grade.equals("null")) {
			mv.setViewName("member/login");
		}

		else if(grade.equals("G")) {
			List fieldList = contestService.userField(id);
			if(fieldList != null && fieldList.size() != 0) {
				mv.addObject("fieldList", fieldList);
			}
			List bookmarkList = contestService.userBookmark(id);
			if(bookmarkList != null && bookmarkList.size() != 0) {
				mv.addObject("bookmarkList", bookmarkList);
			}
			List voteList = workService.userVote(id);
			if(voteList != null && voteList.size() != 0) {
				mv.addObject("voteList", voteList);
			}
			mv.setViewName("userMain");
		}

		else if(grade.equals("S")) {
			List<Contest> list = contestService.selectContest(id);
			ArrayList<Map<String,Integer>> benefitList = new ArrayList<>();
			if(list != null && list.size() != 0) {
				mv.addObject("list", list);
				for(int i = 0; i < list.size(); i++) {
					if(workService.isChoose(list.get(i).getContestNum()) != 0) {
						Map<String, Integer> workMap = new HashMap<>();
						workMap.put("contestNum", list.get(i).getContestNum());
						benefitList.add(workMap);
					}
				}
				mv.addObject("benefitList", benefitList);
			}
			List<Contest> contestList = contestService.selectContest(id);
			for(int index = 0; index < contestList.size(); index++) {
				for(int j = 0; j < benefitList.size(); j++) {
					if(contestList.get(index).getContestNum() == benefitList.get(j).get("contestNum")) {
						contestList.remove(index);
						index--;
					}
				}
			}
			mv.addObject("contestList", contestList);
			mv.setViewName("semiAdminMain");
		}
		else if(grade.equals("A")) {
			List requestList = requestService.selectRequest();
			if(requestList != null && requestList.size() != 0) {
				mv.addObject("requestList", requestList);
			}
			List reportWorkList = reportService.selectReport("작품");
			if(reportWorkList != null && reportWorkList.size() != 0) {
				mv.addObject("reportWorkList", reportWorkList);
			}
			List reportBoardList = reportService.selectReport("게시글");
			if(reportBoardList != null && reportBoardList.size() != 0) {
				mv.addObject("reportBoardList", reportBoardList);
			}
			List reportReplyList = reportService.selectReport("댓글");
			if(reportReplyList != null && reportReplyList.size() != 0) {
				mv.addObject("reportReplyList", reportReplyList);
			}
			List questionList = questionService.selectAllReadyComment();
			if(questionList != null && questionList.size() != 0) {
				mv.addObject("questionList", questionList);
			}
			List workList = workService.selectPrize();
			if(workList != null && workList.size() != 0) {
				mv.addObject("workList", workList);
			}
			List<Users> banList = userService.selectBanUser();
			ArrayList<Map<String, String>> banUserList = new ArrayList<>();
			if(banList != null && banList.size() != 0) {
				for(int i = 0; i < banList.size(); i++) {
					Map<String, String> ban = new HashMap<>();
					ban.put("userId", banList.get(i).getUserId());
					ban.put("userGrade", banList.get(i).getUserGrade());
					ban.put("reportCount", reportService.reportCount(banList.get(i).getUserId())+"");
					banUserList.add(ban);
				}
			}
			List dueDateList = contestService.dueDateList();
			if(dueDateList != null && dueDateList.size() != 0) {
				mv.addObject("dueDateList", dueDateList);
			}
			mv.addObject("banList", banUserList);
			mv.setViewName("adminMain");
		}
		return mv;
	}
	
	//(?) 'S'등급 세션 확인
	@RequestMapping("semiAdmin.do")
	public ModelAndView semiAdminMain(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("S")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		List list = contestService.selectContest(userId);
		if(list != null && list.size() != 0) {
			mv.addObject("list", list);
		}
		mv.setViewName("semiAdminMain");
		return mv;
	}

	//'A'등급 사용자 메인 화면
	/**
	 * 사용자(A등급) 메인 화면 이동
	 * 
	 * @param session 세션
	 * @return 메인 화면 이동 경로 및 객체 전달 값
	 */
	@RequestMapping("adminMain.do")
	public ModelAndView adminMain(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		if(userGrade.equals("A")) {
			List requestList = requestService.selectRequest();
			if(requestList != null && requestList.size() != 0) {
				mv.addObject("requestList", requestList);
			}
			List reportWorkList = reportService.selectReport("작품");
			if(reportWorkList != null && reportWorkList.size() != 0) {
				mv.addObject("reportWorkList", reportWorkList);
			}
			List reportBoardList = reportService.selectReport("게시글");
			if(reportBoardList != null && reportBoardList.size() != 0) {
				mv.addObject("reportBoardList", reportBoardList);
			}
			List reportReplyList = reportService.selectReport("댓글");
			if(reportReplyList != null && reportReplyList.size() != 0) {
				mv.addObject("reportReplyList", reportReplyList);
			}
			List questionList = questionService.selectAllReadyComment();
			if(questionList != null && questionList.size() != 0) {
				mv.addObject("questionList", questionList);
			}
			List workList = workService.selectPrize();
			if(workList != null && workList.size() != 0) {
				mv.addObject("workList", workList);
			}
			List<Users> banList = userService.selectBanUser();
			ArrayList<Map<String, String>> banUserList = new ArrayList<>();
			if(banList != null && banList.size() != 0) {
				for(int i = 0; i < banList.size(); i++) {
					Map<String, String> ban = new HashMap<>();
					ban.put("userId", banList.get(i).getUserId());
					ban.put("userGrade", banList.get(i).getUserGrade());
					ban.put("reportCount", reportService.reportCount(banList.get(i).getUserId())+"");
					banUserList.add(ban);
				}
			}
			List dueDateList = contestService.dueDateList();
			if(dueDateList != null && dueDateList.size() != 0) {
				mv.addObject("dueDateList", dueDateList);
			}
			mv.addObject("banList", banUserList);
			mv.setViewName("adminMain");
		}
		mv.setViewName("adminMain");
		return mv;
	}

	//에러 처리 화면
	/**
	 * 에러 페이지 이동
	 * 
	 * @param request
	 * @param session
	 * @return 에러 처리 화면 이동 경로 및 객체 전달 값
	 */
	@RequestMapping(value = "error.do")
	public ModelAndView error(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String error = (String)request.getParameter("error");
		String userId = (String)session.getAttribute("userId");
		
		if(userId==null)
			mv.addObject("login", false);
		else
			mv.addObject("login", true);
		mv.addObject("error", error);
		mv.setViewName("error");
		return mv;
	}
	
	//회사 정보 보는 화면
	/**
	 * 회사 정보를 보는 화면으로 이동
	 * 
	 * @return 회장 정보 화면 이동 경로
	 */
	@RequestMapping("companyInfo.do")
	public String companyInfo() {
		return "contest/companyInfo";
	}
	
	//회사 위치 보는 화면
	/**
	 * 회사 위치를 보는 화면으로 이동
	 * 
	 * @return 회장 위치 화면 이동 경로
	 */
	@RequestMapping("locationInfo.do")
	public String locationInfo() {
		return "contest/locationInfo";
	}
/**------------------------------------------------------------------------------------------------------------------------------- */
	
	
	
	
	
/**======================================================= USER 관련 기능 ============================================================*/

	
//========================================================== 로그인  관련 ===============================================================
	@RequestMapping("naearo.do")
	public String naearo() {
		return "naearo";
	}

	@RequestMapping("naverLogin.do")
	public String naverLogin() {
		return "naverLogin";
	}

	@RequestMapping("callback.do")
	public String callback() {
		return "callback";
	}

	@RequestMapping("loginNaver.do")
	public ModelAndView loginNaver(HttpSession session) {
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		/* 생성한 인증 URL을 View로 전달 */
		return new ModelAndView("loginNaver", "url", naverAuthUrl);
	}

	public JSONObject stringToJson(String jsonStr, String key) {
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(jsonStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject jsonObj = (JSONObject) obj;

		JSONObject response = (JSONObject) jsonObj.get(key);
		//    
		//   String profile = (String)response.get("gender");
		//   System.out.println(profile);
		//    

		return response;
	}

	public String JsonToString(JSONObject jsonObj, String key) {
		String str = (String)jsonObj.get(key);

		return str;
	}
	private String apiResult = null;

	@RequestMapping("callbackNaver.do")
	public ModelAndView callbackNaver(HttpServletRequest request,  @RequestParam String code, @RequestParam String state, 
										HttpSession session) throws IOException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//Users naverUser = naverLoginBO.getUserProfile(oauthToken);
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		JSONObject jsonObj = stringToJson(apiResult, "response");
		String nickname = JsonToString(jsonObj, "nickname");
		String name = JsonToString(jsonObj, "name");
		String email = JsonToString(jsonObj, "email");

		Users user = userService.naverLogin(email);
		ModelAndView mv = new ModelAndView();

		//데이터 설정
		mv.addObject("userRequest", email);
		//이동 위한 응답 페이지 객체 설정
		if(user==null||user.getUserId()=="0") {
			request.setAttribute("message", "로그인에 실패했습니다. 네이버 아이디로 로그인하시려면 회원가입을 먼저 진행하세요.");
			request.setAttribute("id", email);
			mv.setViewName("login");

			return mv;
		}
		if(user.getUserGrade().equals("X")) {
			String whyBan = reportService.whyBan(email);
			request.setAttribute("message", "정지회원입니다. 고객센터(qudcjf125@naver.com / 070-5039-5815)에 문의해주세요. 사유 : "+whyBan);
			mv.setViewName("login");

			return mv;
		}

		session.setAttribute("userId", user.getUserId());
		session.setAttribute("userNickname", user.getUserNickname());
		session.setAttribute("userGrade", user.getUserGrade());


		Users userDto = userService.selectUser(user.getUserId());
		session.setAttribute("user", userDto);

		if(user.getUserGrade().equals("null")) {
			mv.setViewName("member/login");
		}

		else if(user.getUserGrade().equals("G")) {
			List fieldList = workService.myWorkList(email);
			if(fieldList != null && fieldList.size() != 0) {
				mv.addObject("fieldList", fieldList);
			}
			List bookmarkList = contestService.userBookmark(email);
			if(bookmarkList != null && bookmarkList.size() != 0) {
				mv.addObject("bookmarkList", bookmarkList);
			}
			List voteList = workService.userVote(email);
			if(voteList != null && voteList.size() != 0) {
				mv.addObject("voteList", voteList);
			}
			mv.setViewName("userMain");
		}

		else if(user.getUserGrade().equals("S")) {
			List<Contest> list = contestService.selectContest(email);
			ArrayList<Map<String,Integer>> benefitList = new ArrayList<>();
			if(list != null && list.size() != 0) {
				mv.addObject("list", list);
				for(int i = 0; i < list.size(); i++) {
					if(workService.isChoose(list.get(i).getContestNum()) != 0) {
						Map<String, Integer> workMap = new HashMap<>();
						workMap.put("contestNum", list.get(i).getContestNum());
						benefitList.add(workMap);
					}
				}
				mv.addObject("benefitList", benefitList);
			}
			List<Contest> contestList = contestService.selectContest(email);
			for(int index = 0; index < contestList.size(); index++) {
				for(int j = 0; j < benefitList.size(); j++) {
					if(contestList.get(index).getContestNum() == benefitList.get(j).get("contestNum")) {
						contestList.remove(index);
						index--;
					}
				}
			}
			mv.addObject("contestList", contestList);
			mv.setViewName("semiAdminMain");
		}
		else if(user.getUserGrade().equals("A")) {
			List requestList = requestService.selectRequest();
			if(requestList != null && requestList.size() != 0) {
				mv.addObject("requestList", requestList);
			}
			mv.setViewName("adminMain");
		}
		else {
			mv.setViewName("error");
		}
		return mv;

	}	
	
	@RequestMapping("findId.do")
	public String findId() {
		return "member/findId";
	}
	@RequestMapping("findPw.do")
	public String findPw() {
		return "member/findPw";
	}

	@RequestMapping("login2.do")
	public String login2() {
		return "member/login2";
	}
	
	/**
	 * <pre>
	 * 로그인 
	 * - 사용자의 로그인 요청을 처리
	 * </pre>
	 * 
	 * @param userId 로그인 하려는 사용자 id 입력 값
	 * @param userPw 로그인 하려는 사용자 pw 입력 값
	 * @param session 세션
	 * @return 요청 결과 처리 후 로그인 화면 이동 및 객체 전달 값
	 */
	@RequestMapping("logindb.do")
	public ModelAndView login(String userId, String userPw, HttpSession session, HttpServletRequest request) {

		Users user = userService.login(userId, userPw);
		ModelAndView mv = new ModelAndView();

		//데이터 설정
		mv.addObject("userRequest", userId);
		//이동 위한 응답 페이지 객체 설정
		if(user==null||user.getUserId()=="0") {
			request.setAttribute("message", "로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요.");
			request.setAttribute("id", userId);
			mv.setViewName("login");

			return mv;
		}
		if(user.getUserGrade().equals("X")) {
			String whyBan = reportService.whyBan(userId);
			request.setAttribute("message", "정지회원입니다. 고객센터(qudcjf125@naver.com / 070-5039-5815)에 문의해주세요. 사유 : "+whyBan);
			mv.setViewName("login");

			return mv;
		}

		session.setAttribute("userId", user.getUserId());
		session.setAttribute("userNickname", user.getUserNickname());
		session.setAttribute("userGrade", user.getUserGrade());


		Users userDto = userService.selectUser(user.getUserId());
		session.setAttribute("user", userDto);

		if(user.getUserGrade().equals("null")) {
			mv.setViewName("member/login");
		}

		else if(user.getUserGrade().equals("G")) {
			List fieldList = workService.myWorkList(userId);
			if(fieldList != null && fieldList.size() != 0) {
				mv.addObject("fieldList", fieldList);
			}
			List bookmarkList = contestService.userBookmark(userId);
			if(bookmarkList != null && bookmarkList.size() != 0) {
				mv.addObject("bookmarkList", bookmarkList);
			}
			List voteList = workService.userVote(userId);
			if(voteList != null && voteList.size() != 0) {
				mv.addObject("voteList", voteList);
			}
			mv.setViewName("userMain");
		}

		else if(user.getUserGrade().equals("S")) {
			List<Contest> list = contestService.selectContest(userId);
			ArrayList<Map<String,Integer>> benefitList = new ArrayList<>();
			if(list != null && list.size() != 0) {
				mv.addObject("list", list);
				for(int i = 0; i < list.size(); i++) {
					if(workService.isChoose(list.get(i).getContestNum()) != 0) {
						Map<String, Integer> workMap = new HashMap<>();
						workMap.put("contestNum", list.get(i).getContestNum());
						benefitList.add(workMap);
					}
				}
				mv.addObject("benefitList", benefitList);
			}
			List<Contest> contestList = contestService.selectContest(userId);
			for(int index = 0; index < contestList.size(); index++) {
				for(int j = 0; j < benefitList.size(); j++) {
					if(contestList.get(index).getContestNum() == benefitList.get(j).get("contestNum")) {
						contestList.remove(index);
						index--;
					}
				}
			}
			mv.addObject("contestList", contestList);
			mv.setViewName("semiAdminMain");
		}
		else if(user.getUserGrade().equals("A")) {
			List requestList = requestService.selectRequest();
			if(requestList != null && requestList.size() != 0) {
				mv.addObject("requestList", requestList);
			}
			List reportWorkList = reportService.selectReport("작품");
			if(reportWorkList != null && reportWorkList.size() != 0) {
				mv.addObject("reportWorkList", reportWorkList);
			}
			List reportBoardList = reportService.selectReport("게시글");
			if(reportBoardList != null && reportBoardList.size() != 0) {
				mv.addObject("reportBoardList", reportBoardList);
			}
			List reportReplyList = reportService.selectReport("댓글");
			if(reportReplyList != null && reportReplyList.size() != 0) {
				mv.addObject("reportReplyList", reportReplyList);
			}
			List questionList = questionService.selectAllReadyComment();
			if(questionList != null && questionList.size() != 0) {
				mv.addObject("questionList", questionList);
			}
			List workList = workService.selectPrize();
			if(workList != null && workList.size() != 0) {
				mv.addObject("workList", workList);
			}
			List<Users> banList = userService.selectBanUser();
			ArrayList<Map<String, String>> banUserList = new ArrayList<>();
			if(banList != null && banList.size() != 0) {
				for(int i = 0; i < banList.size(); i++) {
					Map<String, String> ban = new HashMap<>();
					ban.put("userId", banList.get(i).getUserId());
					ban.put("userGrade", banList.get(i).getUserGrade());
					ban.put("reportCount", reportService.reportCount(banList.get(i).getUserId())+"");
					banUserList.add(ban);
				}
			}
			mv.addObject("banList", banUserList);
			List dueDateList = contestService.dueDateList();
			if(dueDateList != null && dueDateList.size() != 0) {
				mv.addObject("dueDateList", dueDateList);
			}
			mv.setViewName("adminMain");
		}
		else {
			mv.setViewName("error");
		}
		return mv;
	}

	/**
	 * <pre>
	 * 로그아웃
	 * - 사용자 로그아웃 요청 처리
	 * </pre>
	 * 
	 * @param session 로그아웃 요청을 한 회원의 정보(아이디, 등급, 닉네임)를 담고 있는 session
	 * @return 로그인 페이지 이동 경로
	 */
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		request.setAttribute("flag",true);
		session.removeAttribute("userId");
		session.removeAttribute("userGrade");
		session.removeAttribute("userNickname");
		session.invalidate();
		return "login";
	}
//-----------------------------------------------------------------------------------------------------------------------------------

	
//=================================================== 회원 가입 / 탈퇴 관련 ==============================================================
	/**
	 * <pre>
	 * 회원가입 요청 처리
	 * -사용자가 입력한 회원 정보 DB에 저장 처리
	 * </pre>
	 * @param userId 아이디
	 * @param userPw 패스워드
	 * @param userName 이름
	 * @param userPhone1 휴대폰번호
	 * @param userPhone2 비상연락처
	 * @param userField 관심분야
	 * @param userGetmail 메일동의
	 * @param userGetsms 문자동의
	 * @return 결과 처리 후 로그인 화면 이동 및 객체 전달 값
	 */
	@RequestMapping(value="insertJoin.do", method=RequestMethod.POST)
	public ModelAndView insertJoin(String userId, String userPw, String userName, String userPhone1, String userPhone2, 
									String userField, String userGetmail, String userGetsms ) {
		ModelAndView mv = new ModelAndView();
		if(userGetmail == null) {
			userGetmail = "N";
		}
		if(userGetsms == null) {
			userGetsms = "N";
		}
		int idx = userId.indexOf("@");
		String nickname = userId.substring(0, idx);
		Users user = new Users(userId, userPw, nickname, userName, userPhone1, userPhone2, userField, "G", userId, userGetmail, 
								userGetsms, null, 0);

		if(userService.insertJoin(user) != 0) {
			mv.setViewName("login");
			return mv;
		}
		return null;
	}

	/**
	 * <pre>
	 * 가입시 입력된 회원 아이디의 중복 확인
	 * -사용자가 입력한 회원 아이디와 DB 아이디와 비교
	 * </pre>
	 * 
	 * @param request 요청 객체
	 * @param response 반응 객체
	 * @throws Exception
	 */
	@RequestMapping(value="idCheck.do", method=RequestMethod.POST)
	public void checkId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		try {
			String userId = (request.getParameter("userId") == null) ? "" : String.valueOf(request.getParameter("userId"));
			int checkNum = 0;
			if(userService.isCheckId(userId)) {
				checkNum = 1;
			}
			out.print(checkNum);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1");
		}
	}

	/**
	 * <pre>
	 * 닉네임 중복 확인
	 * -사용자가 입력한 닉네임과 DB 닉네임 비교
	 * </pre>
	 * 
	 * @param request 요청 객체
	 * @param response 반응 객체
	 * @throws Exception
	 */
	@RequestMapping(value="nicknameCheck.do", method=RequestMethod.POST)
	public void checkNickname(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		try {
			String userNickname = (request.getParameter("userNickname") == null) ? "" : String.valueOf(request.getParameter("userNickname"));
			int checkNum = 0;
			if(userService.isCheckNickname(userNickname)) {
				checkNum = 1;
			}
			out.print(checkNum);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1");
		}
	}
	
	/**
	 * 회원 탈퇴 페이지 이동
	 * 
	 * @return 각 등급별 탈퇴 페이지 이동 경로 및 객체 전달 값
	 */
	@RequestMapping("withdrawal.do")
	public ModelAndView withdrawal(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		mv.addObject("userId", userId);
		mv.addObject("selectMenu", "draw");
		String userGrade = (String) session.getAttribute("userGrade");
		if(userGrade.equals("G")) {
			mv.setViewName("member/withdrawal");
		} else if(userGrade.equals("S")) {
			mv.setViewName("member/withdrawal");
		} else if(userGrade.equals("A")) {
			mv.setViewName("member/withdrawal");
		}
		return mv;
	}

	/**
	 * 회원 탈퇴 요청 처리
	 * 
	 * @param session 탈퇴 요청을 한 회원의 정보(아이디, 등급, 닉네임)를 담고 있는 session
	 * @return 탈퇴 성공시 세션값 삭제 후 로그인 화면 이동 경로
	 */
	@RequestMapping("deleteUsers.do")
	public String deleteUsers(HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		if(userId != null) { //로그인 한 회원만 가능
			if(userService.deleteUsers(userId)) {
				session.removeAttribute("userId");
				session.removeAttribute("userNickname");
				session.removeAttribute("userGrade");
				session.invalidate();
				return "login";
			} else {
				return "index";
			}
		} else {
			return null;
		}
	}
//-----------------------------------------------------------------------------------------------------------------------------------

	
//====================================================== 사용자 정보 관련 ================================================================
	/**
	 * <pre>
	 * 내 정보 조회 (G/S/A 등급 사용자 해당)
	 * -DB에 저장된 사용자 정보 조회
	 * </pre>
	 * 
	 * @param session 정보 조회 요청을 한 회원의 정보(아이디, 등급, 닉네임)를 담고 있는 session
	 * @return 각 등급별 정보 조회 페이지 이동 경로 및 객체 전달 값
	 */
	@RequestMapping("myInfo.do")
	public ModelAndView myInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		mv.addObject("userId", userId);
		mv.addObject("selectMenu", "info");
		String userGrade = (String) session.getAttribute("userGrade");
		Users usersDto = userService.selectUser(userId);
		mv.addObject("usersDto",usersDto);
		ArrayList<Work> list = workService.myWorkList((String) session.getAttribute("userId"));
		mv.addObject("myWorkList", list);
		if(userGrade.equals("G")) {
			mv.setViewName("member/myInfo");
		} else if(userGrade.equals("S")) {
			mv.setViewName("member/myInfo");
		} else if(userGrade.equals("A")) {
			mv.setViewName("member/myInfo");
		}
		return mv;
	}
	
	/**
	 * <pre>
	 * 내 정보 수정 (G/S/A 등급 사용자 해당)
	 * -사용자가 입력한 수정 정보 처리
	 * </pre>
	 * 
	 * @param user 수정시 입력받은 정보를 담은 Users dto
	 * @param session 정보 수정을 요청한 회원의 아이디를 담고 있는 session
	 * @return 내 정보 보기 이동 화면 경로 및 객체 전달 값
	 */
	@RequestMapping("updateMyInfo.do")
	public ModelAndView updateMyInfo(Users user, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String userGrade = (String)session.getAttribute("userGrade");
		if(user.getUserGetmail() == null) {
			user.setUserGetmail("N");
		}
		if(user.getUserGetsms() == null) {
			user.setUserGetsms("N");
		}
		String userId = (String) session.getAttribute("userId");
		user.setUserId(userId);
		if(user.getUserId() != null) { //로그인 한 회원만 가능
			userService.updateMyInfo(user);
			ArrayList<Work> list = workService.myWorkList((String) session.getAttribute("userId"));
			mv.addObject("myWorkList", list);
			if(userGrade.equals("G")) {
				mv.setViewName("member/myInfo");
			} else if(userGrade.equals("S")) {
				mv.setViewName("member/myInfo");
			} else if(userGrade.equals("A")) {
				mv.setViewName("member/myInfo");
			}
			return mv;
		}
		return null;
	}

	/**
	 * 비밀번호 변경하는 화면으로 이동 (G/S/A 등급 사용자 해당)
	 * 
	 * @return 비밀번호 변경 화면 이동 경로 및 객체 전달 값
	 */
	@RequestMapping("changePw.do")
	public ModelAndView changePw(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		mv.addObject("userId", userId);
		mv.addObject("selectMenu", "chpw");
		String userGrade = (String) session.getAttribute("userGrade");
		if(userGrade.equals("G")) {
			mv.setViewName("member/changePw");
		} else if(userGrade.equals("S")) {
			Users usersDto = userService.selectUser(userId);
			mv.addObject("usersDto",usersDto);
			mv.setViewName("member/changePw");
		} else if(userGrade.equals("A")) {
			mv.setViewName("member/changePw");
		}
		return mv;
	}
	
	/**
	 * <pre>
	 * 비밀번호 변경시 기존 비밀번호 일치 여부 확인 (G/S/A 등급 사용자 해당)
	 * -사용자가 입력한 비밀번호와 DB의 비밀번호 비교
	 * </pre>
	 * 
	 * @param request 요청 객체
	 * @param response 반응 객체
	 * @param session 회원의 아이디를 담고 있는 session
	 */
	@RequestMapping(value="pwCheck.do", method=RequestMethod.POST)
	public void pwCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		PrintWriter out = response.getWriter();
		String userId = (String) session.getAttribute("userId");
		if(userId != null) {
			try {
				String userPw = (request.getParameter("userPw") == null) ? "" : String.valueOf(request.getParameter("userPw"));
				int checkNum = 0;
				if(userService.isCheckPw(userId, userPw)) {
					checkNum = 1;
				}
				out.print(checkNum);
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
				out.print("1");
			}
		}
	}

	/**
	 * <pre>
	 * 비밀번호 변경 (G/S/A 등급 사용자 해당)
	 * -사용자가 입력한 비밀번호로 수정 처리
	 * </pre>
	 * 
	 * @param newUserPw 변경할 비밀번호
	 * @param session 비밀번호 변경 요청을 한 회원의 정보(아이디, 등급, 닉네임)를 담고 있는 session
	 * @return 성공여부(성공시 등급별 비밀번호 변경 페이지 이동 경로)
	 */
	@RequestMapping("updateUserPw.do")
	public String updateUserPw(String newUserPw, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		if(userId != null) { //로그인 한 회원만 가능
			userService.updateUserPw(userId, newUserPw);
			return "member/changePw";
		} else {
			return null;
		}
	}
	
	/**
	 * 사용자 화면으로 이동 (S 등급 사용자 해당)
	 * 
	 * @param session 세션
	 * @return 사용자 화면 이동 경로 및 객체 전달 값
	 */
	@RequestMapping("semiAdminPage.do")
	public ModelAndView semiAdminPage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		Users usersDto = userService.selectUser(userId);
		mv.addObject("usersDto",usersDto);
		mv.setViewName("member/semiAdminPage");
		return mv;
	}	
	
	/**
	 * <pre>
	 * 사용자 기업 정보를 수정 (S 등급 사용자 해당)
	 * -사용자 기업 조회 후 입력한 값으로 수정 처리
	 * </pre>
	 * 
	 * @param user 사용자 수정 정보를 담는 dto 객체
	 * @param session 세션
	 * @param request 요청 객체
	 * @return 기업 정보 조회 화면 경로 및 객체 값
	 */
	@RequestMapping("updateMyCompanyInfo.do")
	public ModelAndView updateMyCompanyInfo(Users user, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		String userId = (String) session.getAttribute("userId");

		if(user.getUserGetmail() == null) {
			user.setUserGetmail("N");
		}
		if(user.getUserGetsms() == null) {
			user.setUserGetsms("N");
		}
		user.setUserId(userId);

		user.setContestSponsor(request.getParameter("contestSponsor") + "(" + request.getParameter("division") + ")");

		mv.setViewName("member/myCompanyInfo");
		if(user.getUserId() != null) { 
			userService.updateMyCompanyInfo(user);
		}
		Users usersDto = userService.selectUser(userId);
		mv.addObject("usersDto",usersDto);
		return mv;
	}

	/**
	 * <pre>
	 * 사용자 기업 정보 보기 (S 등급 사용자 해당)
	 * -사용자의 기업 정보를 조회하는 화면 이동
	 * </pre>
	 *  
	 * @param session 세션
	 * @return 기업 정보 화면 경로 및 객체 값 
	 */
	@RequestMapping("myCompanyInfo.do")
	public ModelAndView myCompanyInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Users usersDto = new Users();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("S")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}

		String userId = (String) session.getAttribute("userId");
		usersDto = userService.selectUser(userId);
		if (usersDto.getContestSponsor() == null || usersDto.getContestSponsor().indexOf("(") < 0) {
			System.out.println("없어요.");
		} else {
			usersDto.setContestSponsor(usersDto.getContestSponsor().substring(0, usersDto.getContestSponsor().indexOf("(")));
		}
		mv.addObject("usersDto",usersDto);
		mv.addObject("userId", userId);
		mv.addObject("selectMenu", "company");
		mv.setViewName("member/myCompanyInfo");
		return mv;
	}

	/**
	 * <pre>
	 * 회원관리 화면으로 이동 (A 등급 사용자[관리자] 해당)
	 * -회원 가입한 사용자들 관리 서비스 수행
	 * </pre>
	 * 
	 * @param session 세션
	 * @return 회원관리 화면 경로 및 회원 목록 정보 관련 객체 값
	 */
	@RequestMapping("userListView.do")
	public ModelAndView userListView(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		ArrayList<Users> userList = userService.selectAllUsers();
		ArrayList<String> usersId = new ArrayList<>();
		for(int i = 0; i < userList.size(); i++) {
			usersId.add(userList.get(i).getUserId());
		}
		ArrayList<HashMap<String, String>> countList = workService.selectCount(usersId);
		mv.addObject("userList", userList);
		mv.addObject("countList", countList);
		mv.addObject("selectMenu", "user");
		mv.setViewName("member/userListView");
		return mv;
	}

	/**
	 * <pre>
	 * 회원 등급을 변경 처리 (A 등급 사용자[관리자] 해당)
	 * -관리자가 사용자 ID 기반으로 조회된 사용자의 등급을 변경
	 * </pre>
	 * 
	 * @param request 요청 객체
	 * @param response 반응 객체
	 * @throws IOException
	 */
	@RequestMapping(value="updateUserGrade.do", method=RequestMethod.POST)
	public void updateUserGrade(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int updateNum = 0;
		try {
			String[] userId = request.getParameterValues("userId[]");
			String userGrade = request.getParameter("userGrade");
			if(userId != null && userGrade != null) {
				updateNum = userService.updateUserGrade(userId, userGrade);
			}
			out.print(updateNum);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("0");
		}
	}
	
	/**
	 * <pre>
	 * 회원 아이디 검색 (A 등급 사용자[관리자] 해당)
	 * -사용자 ID를 기반으로 사용자를 조회
	 * </pre>
	 *  
	 * @return 회원관리 화면 경로 및 회원 목록 정보 관련 객체 값
	 */
	@RequestMapping("userIdListView.do")
	public ModelAndView userIdListView(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		String searchText = (String)request.getParameter("searchText");
		ArrayList<String> searchIdList = workService.selectCount(searchText);
		ArrayList<Users> usersList = new ArrayList<>();
		for(int i=0;i<searchIdList.size();i++) {
			usersList.add(userService.selectUser(searchIdList.get(i)));
		}
		ArrayList<HashMap<String, String>> countList = workService.selectCount(searchIdList);
		mv.addObject("userList", usersList);
		mv.addObject("countList", countList);
		mv.addObject("selectMenu", "user");
		mv.setViewName("member/userListView");
		return mv;
	}

	/**
	 * <pre>
	 * 회원 등급 검색 (A 등급 사용자[관리자] 해당)
	 * -사용자 등급으로 회원을 조회
	 * </pre>
	 * 
	 * @return 회원관리 화면 경로 및 회원 목록 정보 관련 객체 값
	 */
	@RequestMapping("userGradeListView.do")
	public ModelAndView userGradeListView(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		String searchText = (String)request.getParameter("searchText");
		ArrayList<Users> userList = userService.selectAllUsers();
		for(int i=0;i<userList.size();i++) {
			if(!userList.get(i).getUserGrade().equals(searchText)) {
				userList.remove(i);
				i--;
			}
		}
		ArrayList<String> usersId = new ArrayList<>();
		for(int i = 0; i < userList.size(); i++) {
			usersId.add(userList.get(i).getUserId());
		}
		ArrayList<HashMap<String, String>> countList = workService.selectCount(usersId);
		mv.addObject("userList", userList);
		mv.addObject("countList", countList);
		mv.addObject("selectMenu", "user");
		mv.setViewName("member/userListView");
		return mv;
	}
//-----------------------------------------------------------------------------------------------------------------------------------
/**------------------------------------------------------------------------------------------------------------------------------- */

	
	
	
	
/**==================================================== 의뢰 / 공모 관련 기능 ===========================================================*/

	
//========================================================= 의뢰 관련 ==================================================================
	/**
	 * <pre>
	 * 의뢰 관련 약관 및 회사 정보 소개 화면 이동
	 * -의뢰 요청 서비스 제공
	 * </pre>
	 * 
	 * @param session 세션
	 * @return 화면 이동 경로 및 객체 값
	 */
	@RequestMapping("contactUs.do")
	public ModelAndView contactUs(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("selectMenu", "contact");
		String userGrade = (String) session.getAttribute("userGrade");
		if(userGrade.equals("G")) {
			mv.setViewName("contest/contactUs");
		} else if(userGrade.equals("S")) {
			mv.setViewName("contest/contactUs");
		}
		return mv;
	}

	/**
	 * 약관 동의 화면 이동
	 * 
	 * @param session 세션
	 * @return 약관 동의 화면 이동 경로 및 객체 값
	 */
	@RequestMapping("contract.do")
	public ModelAndView contract(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("selectMenu", "contract");

		String userGrade = (String)session.getAttribute("userGrade");

		if(userGrade.equals("G")) {
			mv.setViewName("contest/contract");
		} else if(userGrade.equals("S")) {
			mv.setViewName("contest/contract");
		} else if(userGrade.equals("A")) { 
			mv.setViewName("contest/contract");
		}
		return mv;
	}

	/**
	 * 의뢰 등록 페이지
	 * 
	 * @param session
	 * @return 의뢰 등록 페이지
	 */
	@RequestMapping("requestForm.do")
	public ModelAndView requestForm(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String userId = (String) session.getAttribute("userId");

		Users usersDto = new Users();
		usersDto = userService.selectUser(userId);
		if(usersDto.getContestSponsor()==null||usersDto.getContestSponsor().indexOf("(")<0) {
			System.out.println("없어요.");
		}else {
			usersDto.setContestSponsor(usersDto.getContestSponsor().substring(0, usersDto.getContestSponsor().indexOf("(")));
		}

		mv.addObject("userId", userId);
		mv.addObject("usersDto",usersDto);
		mv.setViewName("contest/requestForm");
		return mv;
	}

	/**
	 * 의뢰 등록
	 * @param request
	 * @param session
	 * @return 등급별 메인 페이지
	 */
	@RequestMapping(value = "insertRequest.do")
	public ModelAndView insertRequest(HttpServletRequest request, HttpSession session) {
		int fileSize = 500 * 1024 * 1024;
		ModelAndView mv = new ModelAndView();

		String uploadPath = "/home/hosting_users/qudcjf125/tomcat/webapps/ROOT/resources/upload";

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8",
					new DefaultFileRenamePolicy());
			String benefit = "";
			for (int count = 1; count < 6; count++) {
				if (multi.getParameter("contestBenefit" + count) != null) {
					benefit += multi.getParameter("contestBenefit" + count) + "/";
					benefit += multi.getParameter("contestBenefitNum" + count) + "명/";
					if(multi.getParameter("contestBenefit"+(count+1)) == null)
						benefit += multi.getParameter("contestBenefitMoney" + count) + "만원";
					else{
						benefit += multi.getParameter("contestBenefitMoney" + count) + "만원/";
					}
				}
			}

			String contestTitle = multi.getParameter("contestTitle");
			String contestField = multi.getParameter("contestField");
			String contestField2 = multi.getParameter("contestField2");

			if(contestField2!=null) {
				contestField += "("+contestField2+")";
			}
			long groupNum = Long.parseLong(multi.getParameter("groupNum"));
			String dueDate = multi.getParameter("dueDate");
			String contestContents = multi.getParameter("contestContents");
			String userId = (String) session.getAttribute("userId");
			String contestFile = multi.getFilesystemName("contestFile");

			Request dto = new Request();
			dto.setUserId(userId);
			dto.setContestTitle(contestTitle);
			dto.setContestBenefit(benefit);
			dto.setContestField(contestField);
			dto.setGroupNum(groupNum);
			dto.setDueDate(dueDate);
			dto.setContestContents(contestContents);
			dto.setContestSponsor(multi.getParameter("contestSponsor") + "(" + multi.getParameter("division") + ")");
			dto.setContestFile(contestFile);
			int result = requestService.insertRequest(dto);

			String userEmail = multi.getParameter("userEmail");
			String userPhone1 = multi.getParameter("userPhone1");
			String userPhone2 = multi.getParameter("userPhone2");
			String userGetmail = multi.getParameter("userGetmail");
			String userGetSMS = multi.getParameter("userGetSMS");

			Users userdto=new Users();
			userdto.setContestSponsor(multi.getParameter("contestSponsor") + "(" + multi.getParameter("division") + ")");
			userdto.setGroupNum(groupNum);
			userdto.setUserEmail(userEmail);
			userdto.setUserPhone1(userPhone1);
			userdto.setUserPhone2(userPhone2);
			if(userGetmail==null) {
				userdto.setUserGetmail("N");
			}else userdto.setUserGetmail("Y");
			if(userGetSMS==null) {
				userdto.setUserGetsms("N");
			}else userdto.setUserGetsms("Y");
			userdto.setUserId(userId);
			userService.updateMyCompanyInfo(userdto);

			if (result==1) {
				Users usersDto = new Users();

				String sessionId = (String) session.getAttribute("userId");
				usersDto = userService.selectUser(sessionId);

				mv.addObject("usersDto",usersDto);
				mv.addObject("userId", sessionId);
				mv.addObject("selectMenu", "requestForm");
				if(usersDto.getUserGrade().equals("fail")) {
					mv.setViewName("member/login");
				}

				else if(usersDto.getUserGrade().equals("G")) {
					mv.setViewName("userMain");
				}

				else if(usersDto.getUserGrade().equals("S")) {
					mv.setViewName("semiAdminMain");
				}
				else if(usersDto.getUserGrade().equals("A")) {
					mv.setViewName("adminMain");
				}
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("contest/requestForm");
		return mv;
	}

	/**
	 * 의뢰 리스트 페이지
	 * @param session
	 * @return 의뢰 리스트 페이지
	 */
	@RequestMapping("requestListView.do")
	public ModelAndView requestListView(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		String userId = (String) session.getAttribute("userId");
		ArrayList<Request> list = requestService.selectRequest();
		mv.addObject("allRequest", list);
		mv.addObject("userId", userId);
		mv.addObject("selectMenu", "request");
		mv.setViewName("member/requestListView");
		return mv;
	}
	
	/**
	 * 의뢰 상세 보기
	 * @param session
	 * @param requestNum 의뢰번호
	 * @return 의뢰보기 페이지
	 */
	@RequestMapping("requestView.do")
	public ModelAndView requestView(HttpSession session, int requestNum) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		Request request= new Request();
		String userId = (String) session.getAttribute("userId");

		Users usersDto = new Users();
		usersDto = userService.selectUser(userId);

		mv.addObject("userId", userId);
		mv.addObject("usersDto",usersDto);
		request = requestService.requestView(requestNum);
		mv.addObject("requestView", request);
		mv.setViewName("member/requestView");
		return mv;
	}

	/**
	 * 의뢰 삭제
	 * @param requestNum 의뢰 번호
	 * @param request
	 * @param session
	 * @return 관리자 메인 페이지
	 */
	@RequestMapping(value = "deleteRequest.do")
	public ModelAndView deleteRequest(int requestNum,HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		int result=requestService.deleteRequest(requestNum);
		ArrayList<Request> list = requestService.selectRequest();
		mv.addObject("allRequest", list);
		if(result==1) {
			mv.setViewName("adminMain");
			return mv; 
		}
		mv.setViewName("adminMain");
		return mv;
	}
//-----------------------------------------------------------------------------------------------------------------------------------
	
	
//========================================================= 공모 관련 ==================================================================
	@RequestMapping("myContestView.do")
	public String myContestView() {
		return "contest/myContestView";
	}

	/**
	 * 공모 분류
	 * @param request
	 * @param contestField
	 * @return
	 */
	@RequestMapping("contestFieldView.do")
	public ModelAndView contestFieldView(HttpServletRequest request, String contestField) {
		ModelAndView mv = new ModelAndView();

		List list = contestService.searchContest("공모 카테고리", contestField);
		mv.addObject("contestField", contestField);
		mv.addObject("allContest", list);
		mv.setViewName("contest/contestListView");
		return mv;
	}

	@RequestMapping("searchFieldContest.do")
	public ModelAndView searchFieldContest(HttpServletRequest request, String contestField) {
		ModelAndView mv = new ModelAndView();
		List list;

		String searchText = (String)request.getParameter("searchText");
		list = contestService.fieldTotalSearch(contestField, searchText);
		mv.addObject("result", "입력하신 \'"+searchText+"\'에 해당하는 검색결과입니다.");
		mv.addObject("searchContents", searchText);
		mv.addObject("contestField", contestField);

		mv.addObject("allContest", list);

		mv.setViewName("contest/contestListView");
		return mv;
	}


	/**
	 * <pre>
	 * 이미지 확대
	 * </pre>
	 * @param request
	 * @return mv
	 */
	@RequestMapping("bigImage.do")
	public ModelAndView bigImage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String fileName = (String)request.getParameter("fileName");
		mv.addObject("fileName", fileName);
		mv.setViewName("bigImage");
		return mv;
	}

	/**
	 * 공모 검색
	 * -헤더의 검색바를 통한 공모 검색
	 * 
	 * @param searchContest 검색창에 회원이 검색을 위해 입력한 키워드
	 * @param searchText 검색 타입
	 * @return 공모 검색 후 리스트 출력 페이지 이동
	 */
	@RequestMapping("searchContest.do")
	public ModelAndView searchContest(HttpServletRequest request, String searchContest, String searchText) {
		ModelAndView mv = new ModelAndView();
		List list;
		if(searchContest==null) {
			list = contestService.totalSearch(searchText);
			mv.addObject("result", "입력하신 \'"+searchText+"\'에 해당하는 검색결과입니다.");
			mv.addObject("searchContents", searchText);
		}
		else {
			list = contestService.totalSearch(searchContest);
			mv.addObject("result", "입력하신 \'"+searchContest+"\'에 해당하는 검색결과입니다.");
			mv.addObject("searchContents", searchContest);
		}
		mv.addObject("allContest", list);

		mv.setViewName("contest/contestListView");
		return mv;
	}

	/**
	 * 내 공모 목록보기
	 * 
	 * @param session 공모 목록보기를 요청한 회원의 정보(아이디, 등급, 닉네임)를 담고 있는 session
	 * @return 내가 등록한 공모 목록보기 페이지로 이동
	 */
	@RequestMapping("myContest.do")
	public ModelAndView myContest(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("selectMenu", "contest");
		String userId = (String) session.getAttribute("userId");
		List<Contest> list = contestService.selectContest(userId);
		if(list != null && list.size() != 0) {
			mv.addObject("list", list);
		}
		ArrayList<Integer> contestNums = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			contestNums.add(list.get(i).getContestNum());
		}
		ArrayList<HashMap<String, Integer>> countList = workService.selectWorkCount(contestNums);
		mv.addObject("countList", countList);
		mv.setViewName("member/myContest");
		return mv;
	}

	/**
	 * 즐겨찾기 등록
	 * - 즐겨찾기 여부를 먼저 검색한 뒤 즐겨찾기 하지 않은 공모의 경우 즐겨찾기 추가
	 * 
	 * @param session
	 * @param contestNum 즐겨찾기 등록할 공모의 고유번호
	 * @return 공모 상세보기 페이지로 이동
	 */
	@RequestMapping(value = "insertBookmark.do", method=RequestMethod.POST)
	public String insertBookmark(HttpSession session, String contestNum) {
		int cNum = Integer.parseInt(contestNum);
		if(!contestService.isBookmark(cNum, (String)session.getAttribute("userId"))) {
			contestService.insertBookmark(cNum, (String)session.getAttribute("userId"));
		}
		return "forward:/workListView.do";
	}

	/**
	 * 즐겨찾기 삭제
	 * - 즐겨찾기 여부를 먼저 검색한 뒤 즐겨찾기 되어있는 공모의 경우 즐겨찾기 삭제
	 * 
	 * @param session
	 * @param contestNum 즐겨찾기 삭제할 공모의 고유번호
	 * @return 공모 상세보기 페이지로 이동
	 */
	@RequestMapping(value = "deleteBookmark.do", method=RequestMethod.POST)
	public String deleteBookmark(HttpSession session, String contestNum) {
		int cNum = Integer.parseInt(contestNum);
		if(contestService.isBookmark(cNum, (String)session.getAttribute("userId"))) {
			contestService.deleteBookmark(cNum, (String)session.getAttribute("userId"));
		}
		return "forward:/workListView.do";
	}

	@RequestMapping(value = "chooseView.do")
	public ModelAndView chooseView(HttpServletRequest request, HttpSession session) {
		String contestNum = (String)request.getParameter("contestNum");
		Contest contest = contestService.contestView(Integer.parseInt(contestNum));
		ModelAndView mv = new ModelAndView();
		if(!session.getAttribute("userId").equals(contest.getUserId())) {
			mv.addObject("error", "해당 공모의 작성자가 아닙니다.");
			mv.setViewName("error");
			return mv;
		}
		ArrayList<Work> list = workService.workList(Integer.parseInt(contestNum));
		String contestBenefit = contest.getContestBenefit();
		mv.addObject("contestTitle", contest.getContestTitle());
		mv.addObject("contestNum", Integer.parseInt(contestNum));
		mv.addObject("contestBenefit", contestBenefit);
		mv.addObject("workList", list);
		mv.setViewName("contest/myContestView");
		return mv;
	}

	@RequestMapping(value = "choose.do")
	public String choose(HttpServletRequest request) {
		String contestNum = (String)request.getParameter("contestNum");
		Contest contest = contestService.contestView(Integer.parseInt(contestNum));
		String prize1 = (String)request.getParameter("prize1");
		String prize2 = (String)request.getParameter("prize2");
		String prize3 = (String)request.getParameter("prize3");
		String prize4 = (String)request.getParameter("prize4");
		String prize5 = (String)request.getParameter("prize5");

		String prize11[] = prize1.split("/");
		String prize22[] = prize2.split("/");
		String prize33[] = prize3.split("/");
		String prize44[] = prize4.split("/");
		String prize55[] = prize5.split("/");

		String id1 = "";
		String id2 = "";
		String id3 = "";
		String id4 = "";
		String id5 = "";

		Work work = new Work();
		if(prize1 != "") {
			for(int i=0;i<prize11.length;i++) {
				workService.prizeWork("대상", Integer.parseInt(prize11[i]));
				work = workService.workView(Integer.parseInt(prize11[i]));
				id1 += work.getUserId()+" ";
			}
		}
		if(prize2 != "") {
			for(int i=0;i<prize22.length;i++) {
				workService.prizeWork("최우수상", Integer.parseInt(prize22[i]));
				work = workService.workView(Integer.parseInt(prize22[i]));
				id2 += work.getUserId()+" ";
			}
		}
		if(prize3 != "") {
			for(int i=0;i<prize33.length;i++) {
				workService.prizeWork("우수상", Integer.parseInt(prize33[i]));
				work = workService.workView(Integer.parseInt(prize33[i]));
				id3 += work.getUserId()+" ";
			}
		}
		if(prize4 != "") {
			for(int i=0;i<prize44.length;i++) {
				workService.prizeWork("장려상", Integer.parseInt(prize44[i]));
				work = workService.workView(Integer.parseInt(prize44[i]));
				id4 += work.getUserId()+" ";
			}
		}
		if(prize5 != "") {
			for(int i=0;i<prize55.length;i++) {
				workService.prizeWork("입상", Integer.parseInt(prize55[i]));
				work = workService.workView(Integer.parseInt(prize55[i]));
				id5 += work.getUserId()+" ";
			}
		}

		ModelAndView mv = new ModelAndView();
		String contestBenefit = contest.getContestBenefit();
		String benefits[] = contestBenefit.split("/");
		for(int i=0;i<benefits.length;i++) {
			if(i%3==0) {
				if(benefits[i].equals("대상")) {
					benefits[i+1] = id1;
				}
				else if(benefits[i].equals("최우수상")) {
					benefits[i+1] = id2;
				}
				else if(benefits[i].equals("우수상")) {
					benefits[i+1] = id3;
				}
				else if(benefits[i].equals("장려상")) {
					benefits[i+1] = id4;
				}
				else if(benefits[i].equals("입상")) {
					benefits[i+1] = id5;
				}
			}
		}
		contestBenefit = "";
		for(int i=0;i<benefits.length;i++) {
			contestBenefit += benefits[i]+"/";
		}

		contestService.chooseContest(contestBenefit, Integer.parseInt(contestNum));
		return "forward:/workListView.do";
	}

	@RequestMapping("contestListView.do")
	public ModelAndView contestListView(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String userId = (String) session.getAttribute("userId");
		Users usersDto = userService.selectUser(userId);
		mv.addObject("usersDto",usersDto);

		ArrayList<Contest> list = contestService.selectContest();
		mv.addObject("allContest", list);
		mv.setViewName("contest/contestListView");
		return mv;
	}


	@RequestMapping(value = "insertContest.do")
	public ModelAndView insertContest(int requestNum, Contest dto, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		String userId = (String) request.getParameter("userId");
		int result = contestService.insertContest(dto);
		if (result == 1) {
			userService.updateUserGrade(userId);
			requestService.deleteRequest(requestNum);
			ArrayList<Request> list = requestService.selectRequest();
			mv.addObject("allRequest", list);
			mv.setViewName("member/requestListView");
			return mv;
		} else {
			Request requestView= new Request();
			Users usersDto = new Users();
			usersDto = userService.selectUser(userId);

			mv.addObject("userId", userId);
			mv.addObject("usersDto",usersDto);
			requestView = requestService.requestView(requestNum);
			mv.addObject("requestView", requestView);
			mv.setViewName("member/requestView");
			return mv;
		}
	}

	@RequestMapping("finishedContest.do")
	public ModelAndView finishedContest(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String userId = (String) session.getAttribute("userId");
		Users usersDto = userService.selectUser(userId);
		mv.addObject("usersDto",usersDto);

		ArrayList<Contest> list = contestService.selectContest();
		mv.addObject("allContest", list);
		mv.setViewName("member/finishedContest");
		return mv;
	}

	@RequestMapping("finishedContestSearch.do")
	public ModelAndView finishedContestSearch(HttpServletRequest request, String searchContest, String searchText) {
		ModelAndView mv = new ModelAndView();

		ArrayList<Contest> list = new ArrayList<>();
		if(searchContest==null) {
			list = contestService.totalSearch(searchText);
			mv.addObject("result", "입력하신 \'"+searchText+"\'에 해당하는 검색결과입니다.");
			mv.addObject("searchContents", searchText);
		}
		else {
			list = contestService.totalSearch(searchContest);
			mv.addObject("result", "입력하신 \'"+searchContest+"\'에 해당하는 검색결과입니다.");
			mv.addObject("searchContents", searchContest);
		}
		mv.addObject("allContest", list);
		mv.setViewName("member/finishedContest");
		return mv;
	}

	@RequestMapping("topContestList.do")
	public ModelAndView topContestList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		ArrayList<Contest> list = contestService.selectTopContest();
		mv.addObject("topContest", list);
		mv.setViewName("contest/topContestList");
		return mv;
	}
//-----------------------------------------------------------------------------------------------------------------------------------
/**--------------------------------------------------------------------------------------------------------------------------------*/


	
	
	
/**====================================================== 작품 관련 기능 ==============================================================*/	
	/**
	 * 내 작품 목록보기
	 * 
	 * @param session 작품 목록보기를 요청한 회원의 정보(아이디, 등급, 닉네임)를 담고 있는 session
	 * @return 내가 등록한 작품 목록보기 페이지로 이동
	 */
	@RequestMapping("myWorkList.do")
	public ModelAndView myWorkList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		ArrayList<Work> list = workService.myWorkList(userId);
		mv.addObject("userId", userId);
		mv.addObject("selectMenu", "work");
		mv.addObject("myWorkList", list);
		mv.setViewName("member/myWorkList");
		return mv;
	}
	
	/**
	 * 공모의 작품 리스트 보기
	 * @param session
	 * @param contestNum 공모 번호
	 * @return 작품 리스트 페이지
	 */
	@RequestMapping(value = "workListView.do")
	public ModelAndView workListView(HttpSession session, @RequestParam("contestNum") String contestNum) {
		int cNum = Integer.parseInt(contestNum);
		Contest contest = contestService.contestView(cNum);
		String dueDate = contest.getDueDate();
		ModelAndView mv = new ModelAndView();
		ArrayList<Work> list = workService.workList(cNum);
		int isChoose = workService.isChoose(cNum);
		String userId = (String)session.getAttribute("userId");
		boolean isBookmark = contestService.isBookmark(cNum, userId);
		mv.addObject("userId", userId);
		mv.addObject("contest", contest);
		mv.addObject("dueDate", dueDate);
		mv.addObject("isChoose", isChoose);
		mv.addObject("contestNum", contestNum);
		mv.addObject("workList", list);
		mv.addObject("isBookmark", isBookmark);
		mv.setViewName("workListView");
		return mv;
	}

	/**
	 * 작품 등록 페이지 이동하기
	 * @param request
	 * @return 작품 등록 페이지 이동하기
	 */
	@RequestMapping(value = "workMake.do")
	public ModelAndView workMake(HttpServletRequest request) {

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("YYYY년MM월dd일");

		String today = formatter.format(new java.util.Date());

		String contestNum = (String)request.getParameter("contestNum");
		Contest contest = contestService.contestView(Integer.parseInt(contestNum));
		String dueDate = contest.getDueDate();

		if(today.compareTo(dueDate)>0) {
			ModelAndView mv = new ModelAndView();
			request.setAttribute("error", "마감일이 지났습니다.");
			mv.setViewName("error");
			return mv;
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("contest", contest);
		mv.addObject("dueDate", dueDate);
		mv.addObject("contestNum", contestNum);
		mv.setViewName("work/workMake");
		return mv;
	}

	/**
	 * 작품 상세보기
	 * @param session
	 * @param workNum 작품 번호
	 * @param contestNum 공모 번호
	 * @return 작품 상세보기 페이지
	 */
	@RequestMapping(value = "workView.do")
	public ModelAndView workView(HttpSession session, @RequestParam("workNum") int workNum, 
									@RequestParam("contestNum") String contestNum) {
		ModelAndView mv = new ModelAndView();
		Work work = workService.workView(workNum);
		Contest contest = contestService.contestView(Integer.parseInt(contestNum));
		String dueDate = contest.getDueDate();
		boolean isVote = workService.isVote(workNum, (String)session.getAttribute("userId"));
		boolean isReport = reportService.isReport(workNum, 0, (String)session.getAttribute("userId"));

		mv.addObject("isReport", isReport);
		mv.addObject("UserId", session.getAttribute("userId"));
		mv.addObject("UserGrade", session.getAttribute("userGrade"));
		mv.addObject("contestNum",contestNum);
		mv.addObject("dueDate", dueDate);
		mv.addObject("workView",work);
		mv.addObject("isVote", isVote);
		mv.setViewName("work/workView");
		return mv;
	}

	/**
	 * 작품 등록
	 * @param session
	 * @param request
	 * @return 작품 리스트 보기 페이지
	 */
	@RequestMapping(value = "insertWork.do")
	public String insertWork(HttpSession session, HttpServletRequest request) {

		int fileSize = 500*1024*1024;
		String a = "";
		String uploadPath ="/home/hosting_users/qudcjf125/tomcat/webapps/ROOT/resources/upload";

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());

			String workTitle = multi.getParameter("workTitle");
			String workContent = multi.getParameter("workContent");
			String contestNum = multi.getParameter("contestNum");
			String pictureName = multi.getFilesystemName("workPicture");
			String fileName = multi.getFilesystemName("workFile");
			a = contestNum;
			Work work = new Work();
			work.setContestNum(Integer.parseInt(contestNum));
			work.setUserId((String)session.getAttribute("userId"));
			work.setUserNickname((String)session.getAttribute("userNickname"));
			work.setWorkTitle(workTitle);
			work.setWorkContent(workContent);
			work.setWorkFile(fileName);
			work.setWorkPicture(pictureName);

			boolean result = workService.insertWork(work);

			if(result) {
				return "forward:/workListView.do?contestNum="+contestNum;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("작품등록 오류");
		}
		return "forward:/workListView.do?contestNum="+a;
	}

	/**
	 * 작품 검색하기
	 * @param request
	 * @param session
	 * @return 작품 리스트 페이지
	 */
	@RequestMapping(value = "workSearch.do")
	public ModelAndView workSearch(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String contestNum = (String)request.getParameter("contestNum");
		String dueDate = (String)request.getParameter("dueDate");
		int conNum = Integer.parseInt(contestNum);
		String option = (String)request.getParameter("selectOption");
		String str = (String)request.getParameter("searchWork");
		Contest contest = contestService.contestView(Integer.parseInt(contestNum));

		ArrayList<Work> list = null;

		if(option.equals("제목")) {
			list = workService.workSearchTitle(conNum, str);
		}
		else if(option.equals("내용")) {
			list = workService.workSearchContent(conNum, str);
		}
		else if(option.equals("제목+내용")) {
			list = workService.workSearchTitleContent(conNum, str);
		}
		else if(option.equals("작성자")) {
			list = workService.workSearchName(conNum, str);
		}
		else {
			list = workService.workList(conNum);
		}
		int isChoose = workService.isChoose(conNum);
		boolean isBookmark = contestService.isBookmark(conNum, (String)session.getAttribute("userId")); 
		mv.addObject("isBookmark", isBookmark);
		mv.addObject("contest", contest);
		mv.addObject("isChoose", isChoose);
		mv.addObject("dueDate", dueDate);
		mv.addObject("contestNum", contestNum);
		mv.addObject("workList", list);
		mv.setViewName("workListView");
		return mv;
	}

	/**
	 * 첨부파일 다운로드하기
	 * @param request
	 * @param response
	 * @param fileName 파일 이름
	 * @return
	 */
	@RequestMapping(value = "fileDownload.do")
	public String fileDownload(HttpServletRequest request, HttpServletResponse response, @RequestParam("fileName") String fileName) {
		String uploadPath ="/home/hosting_users/qudcjf125/tomcat/webapps/ROOT/resources/upload";
		String filePath = uploadPath + "/" + fileName;

		try {

			File file = new File(filePath);
			byte b[] = new byte[(int) file.length()];

			response.reset();
			response.setContentType("application/octet-stream");

			String encoding = new String(fileName.getBytes("UTF-8"),"8859_1");

			response.setHeader("Content-Disposition", "attachment;filename="+ encoding);
			response.setHeader("Content-Length", String.valueOf(file.length()));

			if (file.isFile())
			{

				FileInputStream fileInputStream = new FileInputStream(file);
				ServletOutputStream servletOutputStream = response.getOutputStream();

				int readNum = 0;
				while ( (readNum = fileInputStream.read(b)) != -1) {
					servletOutputStream.write(b, 0, readNum);
				}

				servletOutputStream.close();
				fileInputStream.close();
			}

		} catch (Exception e) {
			System.out.println("Download Exception : " + e.getMessage());
		}

		return null;
	}

	/**
	 * 투표 등록하기
	 * @param session
	 * @param request
	 * @return 작품 상세보기 페이지
	 */
	@RequestMapping(value = "insertVote.do")
	public String insertVote(HttpSession session, HttpServletRequest request) {
		int contestNum = Integer.parseInt((String)request.getParameter("contestNum"));
		int workNum = Integer.parseInt((String)request.getParameter("workNum"));
		if(!workService.isVote(workNum, (String)session.getAttribute("userId"))) {
			workService.insertVote(contestNum, workNum, (String)session.getAttribute("userId"));
			int count = workService.voteCount(workNum);
			workService.updateVote(workNum, count+1);
		}

		return "forward:/workView.do?workNum="+workNum;
	}

	/**
	 * 투표 취소
	 * @param session
	 * @param request
	 * @return 작품 상세보기 페이지
	 */
	@RequestMapping(value = "deleteVote.do")
	public String deleteVote(HttpSession session, HttpServletRequest request) {
		int workNum = Integer.parseInt((String)request.getParameter("workNum"));
		if(workService.isVote(workNum, (String)session.getAttribute("userId"))) {
			workService.deleteVote(workNum, (String)session.getAttribute("userId"));
			int count = workService.voteCount(workNum);
			workService.updateVote(workNum, count-1);
		}
		return "forward:/workView.do?workNum="+workNum;
	}

	/**
	 * 작품 삭제
	 * @param request
	 * @param session
	 * @return 작품리스트 페이지
	 */
	@RequestMapping(value = "deleteWork.do")
	public String deleteWork(HttpServletRequest request, HttpSession session) {

		int workNum = Integer.parseInt((String)request.getParameter("workNum"));
		String contestNum = (String)request.getParameter("contestNum");
		String workFile = (String)request.getParameter("workFile");
		String workPicture = (String)request.getParameter("workPicture");
		String uploadPath ="/home/hosting_users/qudcjf125/upload";
		String filePath = uploadPath + "/" + workFile;
		String picturePath = uploadPath + "/" + workPicture;
		String userId = (String) session.getAttribute("userId");
		String userGrade = (String) session.getAttribute("userGrade");
		Work dto = workService.workView(workNum);
		if(!userId.equals(dto.getUserId()) && !userGrade.equals("A")) {
			request.setAttribute("error", "잘못된 접근입니다.");
			return "forward:/error.do";
		}
		workService.deleteVote(workNum);
		workService.deleteWork(workNum);
		reportService.updateReport("삭제", workNum, 0, "작품");
		File fileFile = new File(filePath);
		File pictureFile = new File(picturePath);

		if(fileFile.exists())
			fileFile.delete();
		if(pictureFile.exists())
			pictureFile.delete();
		return "forward:/workListView.do";
	}

	/**
	 * 작품 수정 페이지 이동
	 * @param request
	 * @param session
	 * @return 작품 수정 페이지
	 */
	@RequestMapping(value = "updateWorkView.do")
	public ModelAndView updateWorkView(HttpServletRequest request, HttpSession session) {
		int workNum = Integer.parseInt((String)request.getParameter("workNum"));
		String contestNum = (String)request.getParameter("contestNum");
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		String userGrade = (String) session.getAttribute("userGrade");
		Work dto = workService.workView(workNum);
		if(!userId.equals(dto.getUserId()) && !userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		Work work = workService.workView(workNum);
		Contest contest = contestService.contestView(Integer.parseInt(contestNum));

		String dueDate = contest.getDueDate();
		mv.addObject("contest", contest);
		mv.addObject("contestNum", contestNum);
		mv.addObject("dueDate", dueDate);
		mv.addObject("work",work);
		mv.setViewName("work/workMake");
		return mv;
	}

	/**
	 * 작품 수정
	 * @param request
	 * @return 작품 리스트 페이지
	 */
	@RequestMapping(value = "updateWork.do")
	public String updateWork(HttpServletRequest request) {
		int fileSize = 500*1024*1024;
		String a = "";
		String uploadPath ="/home/hosting_users/qudcjf125/tomcat/webapps/ROOT/resources/upload";

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			String contestNum = multi.getParameter("contestNum");
			String workFile = multi.getParameter("preFile");
			String workPicture = multi.getParameter("prePicture");
			String workTitle = multi.getParameter("workTitle");
			String workContent = multi.getParameter("workContent");
			String workNum = multi.getParameter("workNum");
			String pictureName = multi.getFilesystemName("workPicture");
			String fileName = multi.getFilesystemName("workFile");
			a = contestNum;
			if(fileName!=null) {
				String filePath = uploadPath + "/" + workFile;
				File fileFile = new File(filePath);
				if(fileFile.exists())
					fileFile.delete();
			}
			else {
				fileName = workFile;
			}
			if(pictureName!=null) {
				String picturePath = uploadPath + "/" + workPicture;
				File pictureFile = new File(picturePath);
				if(pictureFile.exists())
					pictureFile.delete();
			}
			else {
				pictureName = workPicture;
			}

			Work work = new Work();
			work.setWorkNum(Integer.parseInt(workNum));
			work.setWorkTitle(workTitle);
			work.setWorkContent(workContent);
			work.setWorkFile(fileName);
			work.setWorkPicture(pictureName);

			workService.updateWork(work);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("작품 수정 오류");
		}
		return "forward:/workListView.do?contestNum="+a;
	}

/**--------------------------------------------------------------------------------------------------------------------------------*/

	
	
	
	
//======================================================== 게시판 관련 =================================================================	
	/**
	 * 자유게시판 전체 보기
	 * @return 자유게시판 페이지로 이동
	 */
	@RequestMapping("freeBoard.do")
	public ModelAndView freeBoard() {
		ModelAndView mv = new ModelAndView();

		ArrayList<Board> list = boardService.selectAllBoard();
		mv.addObject("select", "none");
		mv.addObject("freeBoardList", list);
		mv.setViewName("boards/freeBoard");
		return mv;
	}

	/**
	 * 자유게시판 [자유]태그 게시글 확인
	 * @return [자유] 태그가 붙은 게시글 목록 페이지로 이동
	 */
	@RequestMapping("freeTapBoard.do")
	public ModelAndView freeTapBoard() {
		ModelAndView mv = new ModelAndView();

		ArrayList<Board> list = boardService.selectAllFreeBoard();
		mv.addObject("select", "F");
		mv.addObject("freeBoardList", list);
		mv.setViewName("boards/freeBoard");
		return mv;
	}
	/**
	 * 자유게시판 [TIP] 태그 게시글 확인
	 * @return [꿀팁] 태그가 붙은 게시글 목록 페이지로 이동
	 */
	@RequestMapping("tipTapBoard.do")
	public ModelAndView tipTapBoard() {
		ModelAndView mv = new ModelAndView();

		ArrayList<Board> list = boardService.selectAllTipBoard();
		mv.addObject("select", "T");
		mv.addObject("freeBoardList", list);
		mv.setViewName("boards/freeBoard");
		return mv;
	}

	/**
	 * 자유 게시글 상세확인
	 * 
	 * @param session 세션아이디를 받기 위함.
	 * @param boardNum 받아온 게시글 번호
	 * @return 게시글 정보 받아온 후 상세 보기 페이지 이동
	 */
	@RequestMapping("freeBoardView.do")
	public ModelAndView freeBoardView(HttpSession session,  @RequestParam("boardNum") String boardNum) {
		ModelAndView mv = new ModelAndView();

		int bNum = Integer.parseInt(boardNum);
		Board boardView = boardService.freeBoardView(bNum);
		String boardId = boardView.getBoardId();
		ArrayList<Reply> replyList = replyService.selectReply(boardId, bNum);

		boolean isReport = reportService.isReport(bNum, 0, (String)session.getAttribute("userId"));
		boolean isReports[] = new boolean[replyList.size()];
		for(int i=0; i<replyList.size();i++) {
			isReports[i] = reportService.isReport(replyList.get(i).getBoardNum(), replyList.get(i).getReplyNum(), 
													(String)session.getAttribute("userId"));
		}

		mv.addObject("isReport", isReport);
		mv.addObject("isReports", isReports);
		mv.addObject("boardView", boardView);
		mv.addObject("replyList", replyList);
		mv.setViewName("boards/freeBoardView");

		return mv;
	}
	/**
	 * 자유 게시글 작성 폼
	 * @param session 세션에 남아있는 로그인 아이디를 가져오기 위함
	 * @return 자유 게시글 작성 폼으로 이동
	 */
	@RequestMapping("freeBoardWriteForm.do")
	public ModelAndView freeBoardWriteForm(HttpSession session) {

		String id = (String)session.getAttribute("userId");
		String nick = (String)session.getAttribute("userNickname");

		ModelAndView mv = new ModelAndView();
		mv.addObject("userId", id);
		mv.addObject("userNickName", nick);
		mv.setViewName("boards/freeBoardWriteForm");
		return mv;
	}
	/**
	 * 게시글 검색
	 * -제목 , 내용, 제목+내용, 아이디 검색
	 * @param request 검색한 내용 받아오기 위함
	 * @return 검색한  내용에 해당하는 게시글 목록 받아온 페이지 이동
	 */
	@RequestMapping("searchBoard.do")
	public ModelAndView searchBoard(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String searchCategory = (String)request.getParameter("searchCategory");
		String searchInput = (String)request.getParameter("searchInput");
		ArrayList<Board> list = new ArrayList<>();
		if(searchCategory.equals("제목")) {
			list = boardService.searchTitleBoard(searchInput);
			mv.addObject("freeBoardList", list);
		}
		else if(searchCategory.equals("내용")) {
			list = boardService.searchContentsBoard(searchInput);
			mv.addObject("freeBoardList", list);
		}
		else if(searchCategory.equals("제목+내용")) {
			list = boardService.searchTitleContentsBoard(searchInput, searchInput);
			mv.addObject("freeBoardList", list);
		}
		else if(searchCategory.equals("아이디")) {
			list = boardService.searchIdBoard(searchInput);
			mv.addObject("freeBoardList", list);
		}
		mv.addObject("select", "none");
		mv.addObject("searchInput", searchInput);
		mv.addObject("searchCategory", searchCategory);
		mv.setViewName("boards/freeBoard");
		return mv;
	}

	/**
	 * 게시판 등록
	 * @return 전체 게시글 목록 페이지로 이동
	 */
	@RequestMapping("freeBoardWrite.do")
	public ModelAndView freeBoardWrite(HttpSession session, HttpServletRequest request) {

		String boardId = request.getParameter("category");	
		String boardTitle = request.getParameter("boardTitle");
		String userId = request.getParameter("userId");
		String userNickname = request.getParameter("userNickname");
		String boardContents = request.getParameter("boardContents");


		if(boardId.trim().equals("F")) {
			boardTitle = "[자유]"+boardTitle;
		}
		else if(boardId.trim().equals("T")) {
			boardTitle = "[꿀팁]"+boardTitle;
		}
		Board boardWriteDto = new Board(boardId, boardTitle, userId, userNickname, boardContents);


		ModelAndView mv = new ModelAndView();
		int result = boardService.freeBoardWrite(boardWriteDto); 

		ArrayList<Board> list = boardService.selectAllBoard();

		mv.addObject("freeBoardList", list);
		mv.addObject("select", "none");
		mv.setViewName("boards/freeBoard");
		return mv;
	}

	/**
	 * 게시글 삭제
	 * @return 전체 게시글 목록 페이지로 이동
	 */
	@RequestMapping("deleteBoard.do")
	public ModelAndView deleteBoard(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		String userGrade = (String) session.getAttribute("userGrade");
		int bNum = Integer.parseInt(request.getParameter("boardNum"));
		Board board = boardService.freeBoardView(bNum);

		if(!userId.equals(board.getUserId()) && !userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}

		String bId = request.getParameter("boardId");

		int deleteResult = boardService.deleteBoard(bNum, bId);

		ArrayList<Board> list = boardService.selectAllBoard();


		mv.addObject("select", "none");
		mv.addObject("freeBoardList", list);
		mv.setViewName("boards/freeBoard");
		return mv;
	}

	/**
	 * 게시글 수정
	 * @return 수정한 게시글 상세 조회 페이지로 이동
	 */
	@RequestMapping("updateBoard.do")
	public ModelAndView updateBoard(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userId = (String) session.getAttribute("userId");
		String userGrade = (String) session.getAttribute("userGrade");
		int bNum = Integer.parseInt(request.getParameter("boardNum"));
		Board dto = boardService.freeBoardView(bNum);
		if(!userId.equals(dto.getUserId()) && !userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}

		String textarea = request.getParameter("ta_contents");

		String bId = request.getParameter("boardId");

		int updateResult = boardService.updateBoard(bNum, bId, textarea);

		ArrayList<Reply> replyList = replyService.selectReply(bId, bNum);
		Board boardView = boardService.freeBoardView(bId, bNum);

		mv.addObject("replyList", replyList);
		mv.addObject("boardView", boardView);
		String boardId = boardView.getBoardId();

		boolean isReport = reportService.isReport(bNum, 0, (String)session.getAttribute("userId"));
		boolean isReports[] = new boolean[replyList.size()];
		for(int i=0; i<replyList.size();i++) {
			isReports[i] = reportService.isReport(replyList.get(i).getBoardNum(), replyList.get(i).getReplyNum(), 
													(String)session.getAttribute("userId"));
		}
		mv.addObject("isReport", isReport);
		mv.addObject("isReports", isReports);
		mv.addObject("boardView", boardView);
		mv.addObject("replyList", replyList);
		mv.addObject("boardNum", bNum);
		mv.setViewName("boards/freeBoardView");

		return mv;
	}

	/**
	 * 공지게시판 게시글 목록 리스트
	 * @return 전체 공지게시판 목록 페이지로 이동
	 */
	@RequestMapping("noticeBoard.do")
	public ModelAndView noticeBoard(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		ArrayList<Board> list = boardService.selectAllNoticeBoard();
		if(list.size()>0) {
			mv.addObject("noticeBoardList", list);
		}else {
			mv.addObject("isEmpty", "공지가 없습니다.");
		}
		mv.addObject("UserGrade", session.getAttribute("userGrade"));
		mv.setViewName("boards/noticeBoard");
		return mv;
	}

	/**
	 * 공지게시판 상세보기
	 * @return 공지게시판 게시글 상세 조회 페이지로 이동
	 */
	@RequestMapping("noticeBoardView.do")
	public ModelAndView noticeBoardView(HttpSession session, @RequestParam("boardNum") String boardNum) {

		int bNum = Integer.parseInt(boardNum);

		Board noticeboardView = boardService.noticeBoardView(bNum);

		ModelAndView mv = new ModelAndView();
		mv.addObject("noticeboardView", noticeboardView);
		mv.setViewName("boards/noticeBoardView");

		return mv;
	}

	/**
	 * 공지사항 작성하기 버튼 클릭
	 * @return 공지사항 작성하는 폼으로 이동
	 */
	@RequestMapping("noticeBoardWriteForm.do")
	public ModelAndView noticeBoardWriteForm(HttpSession session) {

		String id = (String)session.getAttribute("userId");
		String nick = (String)session.getAttribute("userNickname");

		ModelAndView mv = new ModelAndView();

		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		mv.addObject("userId", id);
		mv.addObject("userNickName", nick);
		mv.setViewName("boards/noticeBoardWriteForm");
		return mv;
	}

	/**
	 * 공지게시판 공지사항 등록
	 * 공지사항 등록 폼에서 등록 버튼을 누르면 실행
	 * @return 등록 완료 시 전체 공지 게시글 목록 페이지로 이동/실패시 에러페이지
	 */
	@RequestMapping("noticeBoardWrite.do")
	public ModelAndView noticeBoardWrite(HttpSession session, HttpServletRequest request) {
		String userId = (String) session.getAttribute("userId");
		String boardId = "K";
		String boardTitle = request.getParameter("boardTitle");
		String userNickname = (String)session.getAttribute("userNickname");
		String boardContents = request.getParameter("boardContents");


		Board boardWriteDto = new Board(boardId, boardTitle,userId, userNickname, boardContents);


		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		int result = boardService.noticeBoardWrite(boardWriteDto); 

		ArrayList<Board> list = boardService.selectAllNoticeBoard();

		mv.addObject("noticeBoardList", list);

		mv.setViewName("boards/noticeBoard");
		return mv;

	}

	/**
	 * 공지사항 삭제
	 * -권한: 어드민(A).유일 
	 * @return 삭제 성공 시 전체 공지사항 페이지로 이동/실패 시 에러페이지
	 */
	@RequestMapping("noticeDeleteBoard.do")
	public ModelAndView noticeDeleteBoard(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int bNum = Integer.parseInt(request.getParameter("boardNum"));
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		int noticeDeleteResult = boardService.noticeDeleteBoard(bNum);

		ArrayList<Board> list = boardService.selectAllNoticeBoard();

		mv.addObject("noticeBoardList", list);
		mv.setViewName("boards/noticeBoard");
		return mv;
	}

	/**
	 * 공지사항 수정
	 * -권한 : 관리자(A)
	 * @return 수정 완료 시 전체 공지사항 페이지로 이동/실패 시 에러페이지
	 */
	@RequestMapping("noticeUpdateBoard.do")
	public ModelAndView noticeUpdateBoard(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		String textarea = request.getParameter("ta_contents");
		int bNum = Integer.parseInt(request.getParameter("boardNum"));

		int noticeUpdateResult = boardService.noticeUpdateBoard(bNum, textarea);


		ArrayList<Board> list = boardService.selectAllNoticeBoard();

		mv.addObject("noticeBoardList", list);


		mv.setViewName("boards/noticeBoard");

		return mv;
	}
//-----------------------------------------------------------------------------------------------------------------------------------
	
	
//========================================================= 댓글 관련 ==================================================================
	/**
	 * 댓글 작성
	 * @param boardNum 작성하는 게시글 번호
	 * @param boardId 작성하는 게시판 아이디
	 * @return 해당 게시글 상세보기 페이지로 유지
	 */
	@RequestMapping("writeReply.do")
	public ModelAndView writeReply(HttpServletRequest request,HttpSession session, @RequestParam("boardNum") int boardNum, 
									@RequestParam("boardId") String boardId) {

		//boardId, boardNum, 댓글번호(seq), sysdate, userId, userNick, textarea, 신고수

		String replyId = (String)session.getAttribute("userId");
		String replyNickname = (String)session.getAttribute("userNickname");
		String replyContents = (String)request.getParameter("replyContents");

		Reply replyWrite = new Reply(boardId, boardNum, 0, "?", replyId, replyNickname, replyContents, 0);

		replyService.writeReply(replyWrite);

		ModelAndView mv = new ModelAndView();
		Board boardView = boardService.freeBoardView(boardId, boardNum);
		ArrayList<Reply> replyList = replyService.selectReply(boardId, boardNum);

		boolean isReport = reportService.isReport(boardNum, 0, (String)session.getAttribute("userId"));
		boolean isReports[] = new boolean[replyList.size()];
		for(int i=0; i<replyList.size();i++) {
			isReports[i] = reportService.isReport(replyList.get(i).getBoardNum(), replyList.get(i).getReplyNum(), 
													(String)session.getAttribute("userId"));
		}

		mv.addObject("isReport", isReport);
		mv.addObject("isReports", isReports);
		mv.addObject("boardView", boardView);
		mv.addObject("replyList", replyList);

		mv.setViewName("boards/freeBoardView");
		return mv;
	}
	
	/**
	 * 댓글 삭제
	 * -권한 : 관리자or작성자
	 * @return 해당 게시글 상세보기 페이지 유지 
	 */
	@RequestMapping("deleteReply.do")
	public ModelAndView deleteReply(HttpServletRequest request,HttpSession session) {
		//boardId, boardNum, 댓글번호(seq), sysdate, userId, userNick, textarea, 신고수
		ModelAndView mv = new ModelAndView();
		String boardId = (String)request.getParameter("boardId");
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		int replyNum = Integer.parseInt(request.getParameter("replyNum"));

		String userId = (String) session.getAttribute("userId");
		String userGrade = (String) session.getAttribute("userGrade");
		ArrayList<Reply> list = replyService.selectReply(boardId, boardNum);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getReplyNum()==replyNum) {
				if(!userId.equals(list.get(i).getUserId()) && !userGrade.equals("A")) {
					mv.addObject("error", "잘못된 접근입니다.");
					mv.setViewName("error");
					return mv;
				}
			}
		}

		replyService.deleteReply(boardId,boardNum,replyNum);

		ArrayList<Reply> replyList = replyService.selectReply(boardId, boardNum);
		Board boardView = boardService.freeBoardView(boardId, boardNum);
		boolean isReport = reportService.isReport(boardNum, 0, (String)session.getAttribute("userId"));
		boolean isReports[] = new boolean[replyList.size()];
		for(int i=0; i<replyList.size();i++) {
			isReports[i] = reportService.isReport(replyList.get(i).getBoardNum(), replyList.get(i).getReplyNum(), 
													(String)session.getAttribute("userId"));
		}

		mv.addObject("isReport", isReport);
		mv.addObject("isReports", isReports);
		mv.addObject("replyList", replyList);
		mv.addObject("boardView", boardView);

		mv.setViewName("boards/freeBoardView");
		return mv;

	}

	/**
	 * 댓글 수정
	 * -권한 : 관리자or작성자
	 * @param boardNum 게시글 번호
	 * @param boardId 게시판 아이디
	 * @return 해당 게시글 상세보기 페이지 유지
	 */
	@RequestMapping("updateReply.do")
	public ModelAndView updateReply(HttpSession session, HttpServletRequest request,@RequestParam("boardNum") int boardNum, 
									@RequestParam("boardId") String boardId) {
		ModelAndView mv = new ModelAndView();
		String replyId = (String)session.getAttribute("userId");
		String replyNickname = (String)session.getAttribute("userNickname");
		String replyContents = request.getParameter("replyContents");
		int replyNum = Integer.parseInt(request.getParameter("replyNum"));
		Reply replyWrite = new Reply(boardId, boardNum, replyNum, null, replyId, replyNickname, replyContents, 0);
		String userId = (String) session.getAttribute("userId");
		String userGrade = (String) session.getAttribute("userGrade");
		ArrayList<Reply> list = replyService.selectReply(boardId, boardNum);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getReplyNum()==replyNum) {
				if(!userId.equals(list.get(i).getUserId()) && !userGrade.equals("A")) {
					mv.addObject("error", "잘못된 접근입니다.");
					mv.setViewName("error");
					return mv;
				}
			}
		}

		replyService.updateReply(replyWrite); 


		ArrayList<Reply> replyList = replyService.selectReply(boardId, boardNum);
		Board boardView = boardService.freeBoardView(boardId, boardNum);
		boolean isReport = reportService.isReport(boardNum, 0, (String)session.getAttribute("userId"));
		boolean isReports[] = new boolean[replyList.size()];
		for(int i=0; i<replyList.size();i++) {
			isReports[i] = reportService.isReport(replyList.get(i).getBoardNum(), replyList.get(i).getReplyNum(), 
													(String)session.getAttribute("userId"));
		}

		mv.addObject("isReport", isReport);
		mv.addObject("isReports", isReports);
		mv.addObject("replyList", replyList);
		mv.addObject("boardView", boardView);

		mv.setViewName("boards/freeBoardView");
		return mv;

	}
//-----------------------------------------------------------------------------------------------------------------------------------
/**--------------------------------------------------------------------------------------------------------------------------------*/

	
		
		
			
/**==================================================== 고객센터 관련 기능 =============================================================*/


//===================================================== 자주 묻는 질문 관련 ===============================================================	
	@RequestMapping("askFormView.do")
	public ModelAndView askFormView(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		mv.addObject("selectMenu", "ask");
		mv.setViewName("member/askForm");
		return mv;
	}


	/**
	 * 자주 묻는 질문 등록 데이터를 처리하는 메서드
	 * 
	 * @param request 요청 객체
	 * @param response 반응 객체
	 * @param session 세션
	 * @return 
	 */
	@RequestMapping("askForm.do")
	public ModelAndView askForm(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String userGrade = (String)session.getAttribute("userGrade");

		String askCategory = request.getParameter("askCategory");
		String askTitle = request.getParameter("askTitle");
		String askComment = request.getParameter("askComment");

		int result = oftenAskService.insertOftenAsk(new OftenAsk(askCategory, askTitle, askComment));

		if(result==1) {
			mv.addObject("userGrade", userGrade);
			mv.addObject("message", "질문 등록 성공!");
			return askListView(request, session);
			//mv.setViewName("userMain");
		}else {
			mv.addObject("error", "질문 등록 실패!");
			mv.setViewName("error");
		}
		return mv;
	}

	/**
	 * 관리자가 등록한 질문 리스트를 화면에 뿌려주는 메서드
	 * 
	 * @param request 요청 객체
	 * @param session 세션
	 * @return 자주 묻는 질문 리스트 화면 이동
	 */
	@RequestMapping("askListView.do")
	public ModelAndView askListView(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		ArrayList<OftenAsk> askList = oftenAskService.selectAllOftenAsk();
		ArrayList<OftenAsk> loginList = new ArrayList<>();
		ArrayList<OftenAsk> myInfoList = new ArrayList<>();
		ArrayList<OftenAsk> boardList = new ArrayList<>();
		ArrayList<OftenAsk> contestList = new ArrayList<>();
		ArrayList<OftenAsk> workList = new ArrayList<>();
		ArrayList<OftenAsk> requestList = new ArrayList<>();
		ArrayList<OftenAsk> reportList = new ArrayList<>();
		ArrayList<OftenAsk> etceteraList = new ArrayList<>();
		String userGrade = (String)session.getAttribute("userGrade");
		for(int i = 0; i < askList.size(); i++) {
			if(askList.get(i).getAskCategory().equals("로그인 관련")) {
				loginList.add(askList.get(i));
			} else if(askList.get(i).getAskCategory().equals("내 정보 관련")) {
				myInfoList.add(askList.get(i));
			} else if(askList.get(i).getAskCategory().equals("게시판 관련")) {
				boardList.add(askList.get(i));
			} else if(askList.get(i).getAskCategory().equals("공모 관련")) {
				contestList.add(askList.get(i));
			} else if(askList.get(i).getAskCategory().equals("작품 관련")) {
				workList.add(askList.get(i));
			} else if(askList.get(i).getAskCategory().equals("의뢰 관련")) {
				requestList.add(askList.get(i));
			} else if(askList.get(i).getAskCategory().equals("신고 관련")) {
				reportList.add(askList.get(i));
			} else {
				etceteraList.add(askList.get(i));
			}
		}
		mv.addObject("userGrade", userGrade);
		mv.addObject("loginList", loginList);
		mv.addObject("myInfoList", myInfoList);
		mv.addObject("boardList", boardList);
		mv.addObject("contestList", contestList);
		mv.addObject("workList", workList);
		mv.addObject("requestList", requestList);
		mv.addObject("reportList", reportList);
		mv.addObject("etceteraList", etceteraList);
		mv.setViewName("customerCenter/askListView");
		return mv;
	}
	
	/**
	 * 관리자가 수정한 답변 내용을 처리하는 메서드
	 * 
	 * @param request 요청 객체
	 * @param session 세션
	 * @return 자주 묻는 질문 리스트 화면 이동
	 */
	@RequestMapping("oftenAskUpdate.do")
	public ModelAndView oftenAskUpdate(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		String askNum = request.getParameter("askNum");
		String askComment = request.getParameter("askComment");

		int result = oftenAskService.updateOftenAsk(Integer.parseInt(askNum), askComment);

		if(result==1) {
			request.setAttribute("message", "답변 수정 완료!");
		}else {
			mv.addObject("error", "답변 수정 실패!");
			mv.setViewName("error");         
		}
		return askListView(request, session);
	}

	/**
	 * 사용자의 질문 삭제를 처리하는 메서드
	 * 
	 * @param request 요청 객체
	 * @param session 세션
	 * @return 1:1질문리스트 화면 이동
	 */
	@RequestMapping("oftenAskDelete.do")
	public ModelAndView oftenAskDelete(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		String askNum = request.getParameter("askNum");

		int   result = oftenAskService.deleteOftenAsk(Integer.parseInt(askNum));         
		if(result==1) {
			request.setAttribute("message", "삭제 완료!");
		}else {
			mv.addObject("error", "답변 삭제 실패!");
			mv.setViewName("error");         
		}
		return askListView(request, session);
	}
//-----------------------------------------------------------------------------------------------------------------------------------

	
//======================================================= 1:1 질문 관련 ================================================================	
	/**
	 * 1:1질문 작성 페이지로 이동하는 메서드
	 * 
	 * @return 1:1질문 작성 페이지 이동
	 */
	@RequestMapping("questionFormView.do")
	public String questionFormView() {
		return "customerCenter/questionForm";
	}

	/**
	 * 1:1질문 등록 데이터를 처리하는 메서드
	 * 
	 * @param request 요청 객체
	 * @param response 반응 객체
	 * @param session 세션
	 * @return 성공 시 사용자 메인화면, 실패 시 에러처리화면 이동
	 */
	@RequestMapping("questionForm.do")
	public ModelAndView questionForm(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String userNickname = (String)session.getAttribute("userNickname");
		String questionTitle = request.getParameter("questionTitle");
		String questionContent = request.getParameter("questionContent");

		int result = questionService.insertQuestion(new Question(userNickname, questionTitle, 
				questionContent, "", "답변대기"));
		if(result==1) {
			return questionListView(session);
		}else {
			mv.addObject("error", "질문 등록 실패!");
			mv.setViewName("error");
		}
		return mv;
	}

	/**
	 * 1:1질문리스트에 다중의 질문 뿌려주는 메서드
	 * - 사용자가 개인이 올린 질문 리스트 보기
	 * 
	 * @param session 세션
	 * @return 1:1질문리스트 화면 이동
	 */
	@RequestMapping("questionList.do")
	public ModelAndView questionListView(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String userNickname = (String)session.getAttribute("userNickname");

		ArrayList<Question> questionList = questionService.selectAllQuestion(userNickname);

		mv.addObject("questionList", questionList);
		mv.setViewName("customerCenter/questionList");
		return mv;
	}

	/**
	 * 1:1질문리스트에 다중의 질문 뿌려주는 메서드
	 * - 관리자가 모든 질문 리스트 보기
	 * 
	 * @param session 세션
	 * @return 1:1질문리스트 화면 이동
	 */
	@RequestMapping("questionListView.do")
	public ModelAndView questionListViewForAdmin(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");

		String userNickname = (String)session.getAttribute("userNickname");
		ArrayList<Question> questionList = questionService.selectAllQuestion(userNickname);
		ArrayList<Question> questionManageList = questionService.selectAllQuestion();
		mv.addObject("questionList", questionList);
		mv.addObject("questionManageList", questionManageList);
		mv.addObject("userGrade", userGrade);
		mv.setViewName("customerCenter/questionList");
		return mv;
	}

	/**
	 * 1:1질문 상세보기에 단일 질문 뿌려주는 메서드
	 * 
	 * @param request 요청 객체
	 * @param session 세션
	 * @return 1:1질문 상세보기화면 이동
	 */
	@RequestMapping("questionView.do")
	public ModelAndView questionView(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		int questionNum = Integer.parseInt(request.getParameter("questionNum"));

		String userGrade = (String)session.getAttribute("userGrade");

		Question dto = questionService.selectQuestion(questionNum);

		String userNickname = (String) session.getAttribute("userNickname");

		request.setAttribute("questionNum", dto.getQuestionNum());
		request.setAttribute("userNickname", dto.getUserNickname());
		request.setAttribute("questionTitle", dto.getQuestionTitle());
		request.setAttribute("questionComment", dto.getQuestionComment());
		request.setAttribute("questionContent", dto.getQuestionContent());
		request.setAttribute("writeDate", dto.getWriteDate());
		request.setAttribute("commentState", dto.getCommentState());

		mv.addObject("userGrade", userGrade);
		mv.setViewName("customerCenter/questionView");

		return mv;
	}

	/**
	 * 사용자가 수정한 질문을 처리하는 메서드
	 * 
	 * @param session 세션
	 * @param request 요청 객체
	 * @return 1:1질문리스트 화면 이동
	 */
	@RequestMapping("questionUpdate.do")
	public ModelAndView questionUpdate(HttpServletRequest request, HttpSession session) {
		String questionNum = request.getParameter("questionNum");
		String questionTitle = request.getParameter("questionTitle");
		String questionContent = request.getParameter("questionContent");

		int result = 0;

		Question dto = questionService.selectQuestion(Integer.parseInt(questionNum));

		ModelAndView mv = new ModelAndView();
		String userNickname = (String) session.getAttribute("userNickname");
		String userGrade = (String) session.getAttribute("userGrade");

		if(questionTitle.equals(dto.getQuestionTitle()) && questionContent.equals(dto.getQuestionContent())) {
			result = -1;
		}else {
			result = questionService.updateQuestion(Integer.parseInt(questionNum), questionTitle, questionContent);         
		}

		if(result==1) {
			request.setAttribute("message", "수정 완료!");
		}else {
			request.setAttribute("message", null);         
		}
		return questionListView(session);
	}

	/**
	 * 사용자의 질문 삭제를 처리하는 메서드
	 * 
	 * @param session 세션
	 * @param request 요청 객체
	 * @return 1:1질문리스트 화면 이동
	 */
	@RequestMapping("questionDelete.do")
	public ModelAndView questionDelete(HttpServletRequest request, HttpSession session) {
		String questionNum = request.getParameter("questionNum");
		Question dto = questionService.selectQuestion(Integer.parseInt(questionNum));
		ModelAndView mv = new ModelAndView();
		String userNickname = (String) session.getAttribute("userNickname");
		String userGrade = (String) session.getAttribute("userGrade");

		int   result = questionService.deleteQuestion(Integer.parseInt(questionNum));         
		if(result==1) {
			request.setAttribute("message", "삭제 완료!");
		}else {
			request.setAttribute("message", null);         
		}
		return questionListView(session);
	}

	/**
	 * 1:1문의 답변대기중인 질문들을 화면에 뿌려주는 메서드
	 * - 관리자가 답변대기중인 질문들을 관리
	 * 
	 * @return 1:1문의 관리화면 이동
	 */
	@RequestMapping("questionManage.do")
	public ModelAndView questionManageView(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");

		ArrayList<Question> list = questionService.selectAllReadyComment();

		mv.addObject("questionList", list);
		mv.addObject("selectMenu", "question");
		mv.setViewName("member/questionManage");
		return mv;
	}

	/**
	 * 관리자가 답변 시 답변에 관련된 서비스를 수행하는 메서드
	 * - 답변 상태 변경(답변대기 후 답변완료)
	 * 
	 * @param session 세션
	 * @param request 요청 객체
	 * @return 1:1문의 리스트 화면으로 이동
	 */
	@RequestMapping("commentSubmit.do")
	public ModelAndView commentSubmit(HttpServletRequest request, HttpSession session) {
		String questionNum = request.getParameter("questionNum");
		String questionComment = request.getParameter("questionComment");

		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		int result = questionService.updateComment(Integer.parseInt(questionNum), questionComment);
		if(result==1) {
			request.setAttribute("message", "답변완료!");
		}else {
			request.setAttribute("message", null);
		}
		return questionListViewForAdmin(session);
	}

	/**
	 * 관리자가 답변 수정을 수행하는 메서드
	 * - 사실상 CommentSubmit()과 거의 동일
	 * 
	 * @param session 세션
	 * @param request 요청 객체
	 * @return 1:1문의 리스트 화면으로 이동
	 */
	@RequestMapping("commentUpdate.do")
	public ModelAndView commentUpdate(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String questionNum = request.getParameter("questionNum");
		String questionComment = request.getParameter("questionUpdateComment");
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}

		int result = questionService.updateComment(Integer.parseInt(questionNum), questionComment);
		if(result==1) {
			request.setAttribute("message", "답변 수정 완료!");
		}else {
			request.setAttribute("message", null);
		}
		return questionListViewForAdmin(session);
	}
//-----------------------------------------------------------------------------------------------------------------------------------
/**--------------------------------------------------------------------------------------------------------------------------------*/
	
	
	
	

/**====================================================== 신고 관련 기능 ==============================================================*/	
	
	/**
	 * 게시글 신고 리스트 보기
	 * @param session
	 * @return 게시글 신고 리스트 페이지
	 */
	@RequestMapping("reportBoardList.do")
	public ModelAndView reportBoardListView(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		ArrayList<Report> reportList = reportService.selectReport("게시글");
		int boardNum[] = new int[reportList.size()];
		for(int i=0;i<reportList.size();i++) {
			boardNum[i] = boardService.freeBoardView(reportList.get(i).getTypeNum()).getBoardNum();
		}
		mv.addObject("boardNum", boardNum);
		mv.addObject("reportList", reportList);
		mv.addObject("selectMenu", "board");
		mv.setViewName("member/reportBoardList");
		return mv;
	}

	/**
	 * 작품 신고 리스트 보기
	 * @param session
	 * @return 작품 신고 리스트 페이지
	 */
	@RequestMapping("reportWorkList.do")
	public ModelAndView reportWorkListView(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		ArrayList<Report> reportList = reportService.selectReport("작품");
		int contestNum[] = new int[reportList.size()];
		for(int i=0;i<reportList.size();i++) {
			contestNum[i] = workService.workView(reportList.get(i).getTypeNum()).getContestNum();
		}
		mv.addObject("contestNum", contestNum);
		mv.addObject("reportList", reportList);
		mv.addObject("selectMenu", "work");
		mv.setViewName("member/reportWorkList");
		return mv;
	}

	/**
	 * 댓글 신고 페이지 보기
	 * @param session
	 * @return 댓글 신고 페이지
	 */
	@RequestMapping("reportReplyList.do")
	public ModelAndView reportReplyListView(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		ArrayList<Report> reportList = reportService.selectReport("댓글");
		int boardNum[] = new int[reportList.size()];
		for(int i=0;i<reportList.size();i++) {
			boardNum[i] = boardService.freeBoardView(reportList.get(i).getTypeNum()).getBoardNum();
		}
		mv.addObject("boardNum", boardNum);
		mv.addObject("reportList", reportList);
		mv.addObject("selectMenu", "reply");
		mv.setViewName("member/reportReplyList");
		return mv;
	}

	/**
	 * 작품 신고하는 페이지
	 * @param workNum 작품 번호
	 * @param workTitle 작품 제목
	 * @return 작품 신고하는 페이지
	 */
	@RequestMapping("reportWork.do")
	public ModelAndView reportWork(@RequestParam("workNum") int workNum, @RequestParam("workTitle") String workTitle) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("field", "작품");
		mv.addObject("typeNum", workNum);
		mv.addObject("replyNum", 0);
		mv.addObject("title", workTitle);
		mv.addObject("writer", workService.workView(workNum).getUserId());
		mv.addObject("OK", 0);
		mv.setViewName("reportForm");
		return mv;
	}

	/**
	 * 신고 등록
	 * @param request
	 * @param session
	 */
	@RequestMapping("insertReport.do")
	public void insertReport(HttpServletRequest request, HttpSession session) {
		String field = (String)request.getParameter("field");
		int typeNum = Integer.parseInt((String)request.getParameter("typeNum"));
		int replyNum = Integer.parseInt((String)request.getParameter("replyNum"));
		String title = (String)request.getParameter("title");
		String writer = (String)request.getParameter("writer");
		String reportReason = (String)request.getParameter("reportWhy");
		Report report = new Report(field,typeNum,replyNum,title,writer,reportReason,(String)session.getAttribute("userId"),"");

		if(field.equals("작품")) {
			reportService.insertReport(report);
			int count = workService.reportCount(typeNum);
			workService.updateReportCount(typeNum, count+1);
		}
		else if(field.equals("게시글")) {
			reportService.insertReport(report);
			int count = boardService.boardReportCount(typeNum);
			boardService.updateReportCount(typeNum, count+1);
		}
		else if(field.equals("댓글")) {
			reportService.insertReport(report);
		}
	}

	/**
	 * 신고 확인 처리
	 * @param request
	 * @param session
	 * @return 해당 신고 리스트 페이지
	 */
	@RequestMapping("reportOK.do")
	public String reportOK(HttpServletRequest request, HttpSession session) {
		String process = (String)request.getParameter("process");
		String what = (String)request.getParameter("what");
		int typeNum = Integer.parseInt((String)request.getParameter("typeNum"));
		int replyNum = Integer.parseInt((String)request.getParameter("replyNum"));
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			request.setAttribute("error", "잘못된 접근입니다.");
			return "forward:/error.do";
		}
		reportService.updateReport(process, typeNum, replyNum, what);
		if(what.equals("작품"))
			return "forward:/reportWorkList.do";
		else if(what.equals("게시글"))
			return "forward:/reportBoardList.do";

		return "forward:/reportReplyList.do";
	}

	/**
	 * 게시글 신고 삭제 처리
	 * @param request
	 * @param session
	 * @return 게시글 신고 리스트 페이지
	 */
	@RequestMapping("reportBoardDelete.do")
	public String reportBoardDelete(HttpServletRequest request, HttpSession session) {
		String process = (String)request.getParameter("process");
		int typeNum = Integer.parseInt((String)request.getParameter("typeNum"));
		int replyNum = Integer.parseInt((String)request.getParameter("replyNum"));
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			request.setAttribute("error", "잘못된 접근입니다.");
			return "forward:/error.do";
		}
		reportService.updateReport(process, typeNum, replyNum, "게시글");
		int n = boardService.deleteBoard(typeNum, "N");
		if(n==0)
			n = boardService.deleteBoard(typeNum, "F");
		if(n==0)
			n = boardService.deleteBoard(typeNum, "T");

		return "forward:/reportBoardList.do";
	}

	/**
	 * 신고 댓글 삭제
	 * @param request
	 * @param session
	 * @return 댓글 신고 리스트 페이지
	 */
	@RequestMapping("reportReplyDelete.do")
	public String reportReplyDelete(HttpServletRequest request, HttpSession session) {
		String process = (String)request.getParameter("process");
		int typeNum = Integer.parseInt((String)request.getParameter("typeNum"));
		int replyNum = Integer.parseInt((String)request.getParameter("replyNum"));
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			request.setAttribute("error", "잘못된 접근입니다.");
			return "forward:/error.do";
		}
		reportService.updateReport(process, typeNum, replyNum, "댓글");
		int n = replyService.deleteReply("N", typeNum, replyNum);
		if(n==0)
			n = replyService.deleteReply("F", typeNum, replyNum);
		if(n==0)
			n = replyService.deleteReply("T", typeNum, replyNum);

		return "forward:/reportReplyList.do";
	}

	/**
	 * 신고 작품 삭제
	 * @param request
	 * @param session
	 * @return 작품 신고 리스트 페이지
	 */
	@RequestMapping("reportWorkDelete.do")
	public String reportWorkDelete(HttpServletRequest request, HttpSession session) {
		String process = (String)request.getParameter("process");
		int typeNum = Integer.parseInt((String)request.getParameter("typeNum"));
		int replyNum = Integer.parseInt((String)request.getParameter("replyNum"));
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			request.setAttribute("error", "잘못된 접근입니다.");
			return "forward:/error.do";
		}
		Work work = workService.workView(typeNum);
		String workFile = work.getWorkFile();
		String workPicture = work.getWorkPicture();
		String uploadPath ="/home/hosting_users/qudcjf125/upload";
		String filePath = uploadPath + "/" + workFile;
		String picturePath = uploadPath + "/" + workPicture;

		workService.deleteVote(typeNum);
		workService.deleteWork(typeNum);

		File fileFile = new File(filePath);
		File pictureFile = new File(picturePath);

		if(fileFile.exists())
			fileFile.delete();
		if(pictureFile.exists())
			pictureFile.delete();

		reportService.updateReport(process, typeNum, replyNum, "작품");
		return "forward:/reportWorkList.do";
	}

	/**
	 * 신고 게시글 삭제 후 회원정지
	 * @param request
	 * @param session
	 * @return 게시글 신고 리스트 페이지
	 */
	@RequestMapping("reportBoardBan.do")
	public String reportBoardBan(HttpServletRequest request, HttpSession session) {
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			request.setAttribute("error", "잘못된 접근입니다.");
			return "forward:/error.do";
		}
		String process = (String)request.getParameter("process");
		int typeNum = Integer.parseInt((String)request.getParameter("typeNum"));
		int replyNum = Integer.parseInt((String)request.getParameter("replyNum"));
		String writer[] = new String[1];
		writer[0] = (String)request.getParameter("writer");
		reportService.updateReport(process, typeNum, replyNum, "게시글");
		int n = boardService.deleteBoard(typeNum, "N");
		if(n==0)
			n = boardService.deleteBoard(typeNum, "F");
		if(n==0)
			n = boardService.deleteBoard(typeNum, "T");
		userService.updateUserGrade(writer, "X");
		return "forward:/reportBoardList.do";
	}

	/**
	 * 신고 댓글 삭제 후 회원정지
	 * @param request
	 * @param session
	 * @return 댓글 신고 리스트 페이지
	 */
	@RequestMapping("reportReplyBan.do")
	public String reportReplyBan(HttpServletRequest request, HttpSession session) {
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			request.setAttribute("error", "잘못된 접근입니다.");
			return "forward:/error.do";
		}
		String process = (String)request.getParameter("process");
		int typeNum = Integer.parseInt((String)request.getParameter("typeNum"));
		int replyNum = Integer.parseInt((String)request.getParameter("replyNum"));
		String writer[] = new String[1];
		writer[0] = (String)request.getParameter("writer");
		reportService.updateReport(process, typeNum, replyNum, "댓글");
		int n = replyService.deleteReply("N", typeNum, replyNum);
		if(n==0)
			n = replyService.deleteReply("F", typeNum, replyNum);
		if(n==0)
			n = replyService.deleteReply("T", typeNum, replyNum);
		userService.updateUserGrade(writer, "X");
		return "forward:/reportReplyList.do";
	}

	/**
	 * 신고 작품 삭제 후 회원정지
	 * @param request
	 * @param session
	 * @return 작품 신고 리스트 페이지
	 */
	@RequestMapping("reportWorkBan.do")
	public String reportBan(HttpServletRequest request, HttpSession session) {
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			request.setAttribute("error", "잘못된 접근입니다.");
			return "forward:/error.do";
		}
		String writer[] = new String[1];
		writer[0] = (String)request.getParameter("writer");
		String process = (String)request.getParameter("process");
		int typeNum = Integer.parseInt((String)request.getParameter("typeNum"));
		int replyNum = Integer.parseInt((String)request.getParameter("replyNum"));
		Work work = workService.workView(typeNum);
		String workFile = work.getWorkFile();
		String workPicture = work.getWorkPicture();
		String uploadPath ="/home/hosting_users/qudcjf125/upload";
		String filePath = uploadPath + "/" + workFile;
		String picturePath = uploadPath + "/" + workPicture;

		workService.deleteVote(typeNum);
		workService.deleteWork(typeNum);

		File fileFile = new File(filePath);
		File pictureFile = new File(picturePath);

		if(fileFile.exists())
			fileFile.delete();
		if(pictureFile.exists())
			pictureFile.delete();
		userService.updateUserGrade(writer, "X");
		reportService.updateReport(process, typeNum, replyNum, "작품");
		return "forward:/reportWorkList.do";
	}

	/**
	 * 신고 처리결과 보기 페이지
	 * @param session
	 * @return 신고 처리결과 보기 페이지
	 */
	@RequestMapping("reportAfterList.do")
	public ModelAndView reportAfterListView(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		ArrayList<Report> reportList = reportService.selectReportAfter();
		mv.addObject("reportList", reportList);
		mv.setViewName("member/reportAfterList");
		return mv;
	}

	/**
	 * 신고 처리결과 검색
	 * @param request
	 * @param session
	 * @return 신고 처리결과 보기 페이지
	 */
	@RequestMapping("reportAfterSearchList.do")
	public ModelAndView reportAfterSearchList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String userGrade = (String) session.getAttribute("userGrade");
		if(!userGrade.equals("A")) {
			mv.addObject("error", "잘못된 접근입니다.");
			mv.setViewName("error");
			return mv;
		}
		String search = (String)request.getParameter("tx_search");
		ArrayList<Report> reportList = reportService.searchReportAfter(search);
		mv.addObject("reportList", reportList);
		mv.setViewName("member/reportAfterList");
		return mv;
	}

	/**
	 * 게시글 신고하기 페이지
	 * @param boardNum 게시글 번호
	 * @param boardTitle 게시글 제목
	 * @param boardWriter 게시글 작성자
	 * @return 게시글 신고하기 페이지
	 */
	@RequestMapping("reportBoard.do")
	public ModelAndView reportBoard(@RequestParam("boardNum") int boardNum, @RequestParam("boardTitle") String boardTitle, 
									@RequestParam("boardWriter") String boardWriter) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("field", "게시글");
		mv.addObject("typeNum", boardNum);
		mv.addObject("replyNum", 0);
		mv.addObject("title", boardTitle);
		String writerId = boardService.freeBoardView(boardNum).getUserId();
		mv.addObject("writer", writerId);
		mv.addObject("OK", 0);
		mv.setViewName("reportForm");
		return mv;
	}

	/**
	 * 댓글 신고하기 페이지
	 * @param boardNum 게시글 번호
	 * @param replyNum 댓글 번호
	 * @param replyTitle 댓글 내용
	 * @param replyWriter 댓글 작성자
	 * @return 댓글 신고하기 페이지
	 */
	@RequestMapping("reportReply.do")
	public ModelAndView reportReply(@RequestParam("boardNum") int boardNum, @RequestParam("replyNum") int replyNum, 
									@RequestParam("replyTitle") String replyTitle, @RequestParam("replyWriter") String replyWriter) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("field", "댓글");
		mv.addObject("typeNum", boardNum);
		mv.addObject("replyNum", replyNum);
		mv.addObject("title", replyTitle);
		String writerId = replyService.writerId(boardNum, replyNum);
		mv.addObject("writer", writerId);
		mv.addObject("OK", 0);
		mv.setViewName("reportForm");
		return mv;
	}

/**--------------------------------------------------------------------------------------------------------------------------------*/
}