package com.dp.ggomjirak.kty.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.TIMEOUT;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dp.ggomjirak.HomeController;
import com.dp.ggomjirak.kty.service.MyPageService;
import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.LoginVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.twelvemonkeys.util.Time;


@Controller
@RequestMapping(value="/mypage")
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;

	// 팀플 - 마이 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String mypageForm() throws Exception {
		return "mypage/member_login";
	}

	// 로그인 폼
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return "mypage/member_login";
	}

	// 로그인 폼
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(Locale locale, String user_id, String user_pw, 
			RedirectAttributes rttr, HttpSession session) throws Exception {
		System.out.println("로그인 폼 컨트롤러 들어옴...");
		MemberVo memberVo = myPageService.login(user_id, user_pw);
	 	String msg = null;
	 	String page = null;
	 	if (memberVo != null) {
		 	
	 		//HomeController.userID = memberVo.getUser_id();
	 		//System.out.println("로그인 아이디: " + HomeController.userID);
	 	
	 		Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			//HomeController.userFormattedDate = dateFormat.format(date);
	 		//System.out.println("접속 시간: " + HomeController.userFormattedDate);
	 		
	 		msg = "success";
	 		page = "redirect:/mypage/infoForm";
	 		
	 		session.setAttribute("loginVo", memberVo);
	 		
	 		System.out.println("loginVo 세션 설정함");
	 		
	 		LoginVo loginVo = new LoginVo(memberVo.getUser_id(), null);
	 		System.out.println(loginVo);
	 		
	 		//System.out.println("로그인 했을 때 회원 정보를 읽어서 loginVo를 담아 두는?");
	 		String requestPath = (String)session.getAttribute("requestPath");
	 		session.removeAttribute("requestPath");
	 		if(requestPath != null) {
	 			page = "redirect:" + requestPath;
	 		}
	 	} else {
	 		msg = "fail";
	 		page = "redirect:/mypage/loginForm";
	 	}
	 	rttr.addFlashAttribute("msg", msg);
	 	//rttr.addFlashAttribute("memberVo", memberVo);
		return page;
		//return "mypage/member_login";
	}
		
	
	// 마이 페이지 - 회원 정보  폼 -> 수정하기 버튼이 있고 버튼을 누르면 수정하기 폼으로 들어가도록 구현
	@RequestMapping(value = "/infoForm", method = RequestMethod.GET)
	public String infoForm(String user_id, MemberVo memberVo, Model model, HttpSession session) throws Exception {
		System.out.println("마이 페이지 컨트롤러의 회원 정보 폼 입장");
		//System.out.println("받아온 user_id: " + user_id);
		//if(user_id == null) {
		//	memberVo = (MemberVo)session.getAttribute("loginVo");
//		} else {
//			memberVo = myPageService.info(user_id);
//		}
		//System.out.println(memberVo);
		
		System.out.println("loginVo라는 세션에 저장한 내용 memberVo에 다시 저장");
		memberVo = (MemberVo)session.getAttribute("loginVo");
		
		memberVo = myPageService.info(memberVo.getUser_id());
		System.out.println(memberVo);
		
	 	model.addAttribute("memberVo", memberVo);
		return "mypage/member_info";
	}

	// 마이 페이지 - 회원 가입
	@RequestMapping(value="/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) throws Exception {
		System.out.println("마이 페이지 컨트롤러의 회원 가입폼 들어감");
	
		// 회원 프로필로 옮겨야 될 내용
		//List<CateVo> list1 = myPageService.listHobbyCate1();
		//model.addAttribute("list1", list1);
		//System.out.println(list1);
		return "mypage/member_join";
	}
	
	
	// 마이 페이지 - 회원 가입 처리 /mypage/joinRun
	@RequestMapping(value="/joinRun", method = RequestMethod.POST)
	public String joinRun(MemberVo memberVo,
			RedirectAttributes rttr) throws Exception {
		System.out.println("회원 가입 처리 컨트롤러에 들어 감");
		System.out.println("memberVo.toString(): " + memberVo.toString());
		myPageService.insertMember(memberVo);
		rttr.addFlashAttribute("msg", "success");
		//return "redirect:/mypage/infoForm?user_id=" + memberVo.getUser_id();
		// 회원 가입 처리 후 다시 로그인
		return "redirect:/mypage/loginForm";
	}
	
	
	// 마이 페이지 - 회원 가입 대분류 선택하면 연결되는 중분류만 나타나는 부분 	// 회원 프로필로 옮겨야 될 내용
	@RequestMapping(value="/changeCate", method = RequestMethod.GET)
	public String changeCate(int parent_cate_no, Model model) throws Exception {
		System.out.println("회원 가입 대분류 선택하면 연결되는 중분류만 나타나는 부분 추가 중...");
		System.out.println("parent_cate_no:" + parent_cate_no);
				
		//List<CateVo> list2 = myPageService.listHobbyCate2(parent_cate_no);
		//model.addAttribute("list2", list2);
		//System.out.println("list2:" + list2);
		return "mypage/member_join";
	}
		
	

	// 마이 페이지 - 회원 가입 - 아이디 중복 확인 버튼 클릭시 비동기 방식으로 요청 확인 부분 
	@RequestMapping(value="/checkDupId", method=RequestMethod.GET)
	@ResponseBody
	public String checkDupId(String user_id) throws Exception {
		System.out.println("마이 페이지 컨트롤러의 아이디 중복 확인 들어갑니다.");
		boolean result = myPageService.checkDupId(user_id);
		return String.valueOf(result);
	}
	
	// 마이 페이지 - 회원 정보 수정 - 닉네임 중복 확인 버튼 클릭시 비동기 방식으로 요청 확인 부분 
	@RequestMapping(value="/checkDupNick", method=RequestMethod.GET)
	@ResponseBody
	public String checkDupNick(String user_nick) throws Exception {
		System.out.println("마이 페이지 컨트롤러의 닉네임 중복 확인 들어갑니다.");
		boolean result = myPageService.checkDupNick(user_nick);
		return String.valueOf(result);
	}
	
	// 마이 페이지 - 회원 정보 수정 폼
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm(Model model, HttpSession session) throws Exception {
		System.out.println("회원 정보 수정 폼 들어옴...");
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		model.addAttribute("memberVo", memberVo); // ??? 
		return "mypage/member_modify";
	}
	

	// 마이 페이지 - 회원 정보 수정 폼
	@RequestMapping(value = "/modifyRun", method = RequestMethod.POST)
	public String modifyRun(MemberVo memberVo, RedirectAttributes rttr) throws Exception {
		System.out.println("회원 정보 수정 실행 들어옴...");
		System.out.println("memberVo: " + memberVo.toString());
			
		myPageService.modifyRun(memberVo);
		rttr.addFlashAttribute("msg", "success");
		//MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		//model.addAttribute("memberVo", memberVo); // ??? 
		//return "redirect:/mypage/modifyForm?user_id="+ memberVo.getUser_id();
		return "redirect:/mypage/infoForm?user_id="+ memberVo.getUser_id();
	}

	// 마이 페이지 - 알람 설정 폼
	@RequestMapping(value = "/alarmSetUpRun", method = RequestMethod.POST)
	public String alarmSetUpRun(String onOff, MemberVo memberVo, LoginVo loginVo, RedirectAttributes rttr) throws Exception {
		System.out.println("회원 알림 정보 수정 실행 들어옴...");
		System.out.println("onOff: " + onOff);
		
		//myPageService.alarmSetUpRun(HomeController.userID, onOff);
		//memberVo.setUser_id(HomeController.userID);
		memberVo.setUser_id(loginVo.getUser_id());
		memberVo.setOnOff(onOff);
		
		myPageService.alarmSetUpRun(memberVo);
		rttr.addFlashAttribute("msg", "success");
		
		//return "redirect:/mypage/alarmSetUpRun?user_id="+ memberVo.getUser_id();
		return "mypage/member_setup";
	}
	
	// 마이 페이지 - 알람 설정 수정
	@RequestMapping(value="/alarmSetUp", method=RequestMethod.POST)
	@ResponseBody
	public String alarmSetUp(MemberVo memberVo) throws Exception {
		System.out.println("회원 알림 정보 수정 들어옴...");
		System.out.println(memberVo);
		//myPageService.alarmSetUpRun(HomeController.userID, onOff);
		//memberVo.setUser_id(HomeController.userID);
		//memberVo.setOnOff(onOff);
		
		myPageService.alarmSetUpRun(memberVo);
//		rttr.addFlashAttribute("msg", "success");
//		return "mypage/member_setup";
		return "success";
	}
		
		
		
	// 마이 페이지 - 나의 프로필 수정 폼
	@RequestMapping(value = "/profileForm", method = RequestMethod.GET)
	public String profileForm(MemberVo memberVo, HttpSession session, Model model) throws Exception {
		System.out.println("마이 페이지 프로필 수정에 들어감");
		System.out.println("마이 페이지 프로필 내용 읽어오는 추가 중");
		
		memberVo = (MemberVo)session.getAttribute("loginVo");
		memberVo = myPageService.info(memberVo.getUser_id());
		System.out.println(memberVo);
		
		model.addAttribute("memberVo", memberVo); // ??? 

		return "mypage/member_profile";
	}

	// 마이 페이지 - 나의 프로필 수정 실행
	@RequestMapping(value = "/modifyProfileRun", method = RequestMethod.POST)
	public String modifyProfileRun(MemberVo memberVo, HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		System.out.println("나의 프로필 수정 실행 들어옴...");
		//memberVo.setUser_id((MemberVo)session.getAttribute("loginVo"));
		System.out.println("로그인 아이디 memberVo.getUser_id(): " + memberVo.getUser_id());
		System.out.println("memberVo.getUser_nick(): " + memberVo.getUser_nick());
		System.out.println("memberVo.getCate_etc(): " + memberVo.getCate_etc());
		myPageService.modifyProfileRun(memberVo);

		model.addAttribute("memberVo", memberVo);
		return "redirect:/mypage/infoForm?user_id=" + memberVo.getUser_id();
	}
		
	// 마이 페이지 - 회원 탈퇴 - 추가하게 될지 미정
	@RequestMapping(value = "/withdrawalForm", method = RequestMethod.GET)
	public String withdrawalForm() throws Exception {
		return "mypage/member_login";
	}

	// 마이 페이지 - 알람 설정 폼
	@RequestMapping(value = "/alarmSetUp", method = RequestMethod.GET)
	public String alarmSetup(MemberVo memberVo, HttpSession session, Model model) throws Exception {
		System.out.println("마이 페이지 - 알람 설정 폼에 들어감");
		
		memberVo = (MemberVo)session.getAttribute("loginVo");
		memberVo = myPageService.info(memberVo.getUser_id());
		System.out.println(memberVo);
		
		model.addAttribute("memberVo", memberVo); // ??? 

		return "mypage/member_setup";
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		System.out.println("마이페이지 - 로그아웃");
		session.invalidate(); // 현재 세션 무효화
							  // removeAttribute() 모두
 		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		//HomeController.userFormattedDate = dateFormat.format(date);
 		//System.out.println("종료 시간: " + HomeController.userFormattedDate);
 		
		return "redirect:/mypage/loginForm";
	}
}