package com.dp.ggomjirak.kty.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dp.ggomjirak.kty.service.MyPageService;
import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.MemberVo;


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
		return "mypage/member_info";
	}

	// 로그인 폼
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String user_id, String user_pw, 
			RedirectAttributes rttr, HttpSession session) throws Exception {
		System.out.println("로그인 폼 컨트롤러 들어옴...");
		MemberVo memberVo = myPageService.login(user_id, user_pw);
	 	String msg = null;
	 	String page = null;
	 	if (memberVo != null) {
		 	//int notReadCount = messageService.notReadCount(user_id);
		 	//memberVo.setNotReadCount(notReadCount);
	 		msg = "success";
	 		page = "redirect:/mypage/infoForm";
	 		session.setAttribute("loginVo", memberVo);
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
	public String infoForm(String user_id, Model model, HttpSession session) throws Exception {
		System.out.println("회원 정보 폼 추가 중...");
		//System.out.println("user_id: " + user_id);		
//			MemberVo memberVo = myPageService.info(user_id);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		
	 	/*String page = null;
	 	if (memberVo != null) {
	 		page = "redirect:/mypage/member_info";
	 		session.setAttribute("loginVo", memberVo);
	 		String requestPath = (String)session.getAttribute("requestPath");
	 		session.removeAttribute("requestPath");
	 		if(requestPath != null) {
	 			page = "redirect:" + requestPath;
	 		}
	 	} else {
	 		page = "redirect:/mypage/member_login";
	 	}
	 	*/
	 	model.addAttribute("memberVo", memberVo);
		//return page;*/
		return "mypage/member_info";
	}

	// 마이 페이지 - 회원 가입
	@RequestMapping(value="/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) throws Exception {
		System.out.println("마이 페이지 컨트롤러의 회원 가입으로");
		System.out.println("취미 카테고리 불러오는 거 추가 중...");
	
		List<CateVo> list1 = myPageService.listHobbyCate1();
		model.addAttribute("list1", list1);
		System.out.println(list1);
		return "mypage/member_join";
	}
	
	// 마이 페이지 - 회원 가입 대분류 선택하면 연결되는 중분류만 나타나는 부분
	@RequestMapping(value="/changeCate", method = RequestMethod.GET)
	public String changeCate(int parent_cate_no, Model model) throws Exception {
		System.out.println("회원 가입 대분류 선택하면 연결되는 중분류만 나타나는 부분 추가 중...");
		System.out.println("parent_cate_no:" + parent_cate_no);
				
		List<CateVo> list2 = myPageService.listHobbyCate2(parent_cate_no);
		model.addAttribute("list2", list2);
		System.out.println("list2:" + list2);
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
	
	// 마이 페이지 - 회원 가입 처리 /mypage/joinRun
	@RequestMapping(value="/joinRun", method = RequestMethod.POST)
	public String joinRun(MemberVo memberVo,
			RedirectAttributes rttr) throws Exception {
		System.out.println("회원 가입 처리 컨트롤러에 들어 감");
		
		System.out.println("memberVo.toString(): " + memberVo.toString());
		myPageService.insertMember(memberVo);
		// ??? 
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/mypage/joinForm";
	}
	
	
	
	// 마이 페이지 - 회원 정보 수정 폼
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm(Model model, HttpSession session) throws Exception {
		System.out.println("회원 정보 수정 폼 들어옴...");
		//System.out.println("user_id: " + user_id);
		
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
		return "redirect:/mypage/modifyForm?user_id="+ memberVo.getUser_id();
	}


	// 마이 페이지 - 나의 프로필 수정 폼
	@RequestMapping(value = "/profileForm", method = RequestMethod.GET)
	public String profileForm() throws Exception {
		return "mypage/member_profile";
	}

	// 마이 페이지 - 회원 탈퇴 - 추가하게 될지 미정
	@RequestMapping(value = "/withdrawalForm", method = RequestMethod.GET)
	public String withdrawalForm() throws Exception {
		return "mypage/member_login";
	}

	// 마이 페이지 - 알람 설정 폼
	@RequestMapping(value = "/alarmSetup", method = RequestMethod.GET)
	public String alarmSetup() throws Exception {
		return "mypage/member_setup";
	}

}