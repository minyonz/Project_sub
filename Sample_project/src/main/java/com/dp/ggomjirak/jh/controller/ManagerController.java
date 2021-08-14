package com.dp.ggomjirak.jh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dp.ggomjirak.jh.service.AskService;
import com.dp.ggomjirak.jh.service.EventService;
import com.dp.ggomjirak.jh.service.MainService;
import com.dp.ggomjirak.jh.service.ManagerService;
import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.LoginTimeVo;
import com.dp.ggomjirak.vo.ManagerVo;
import com.dp.ggomjirak.vo.MemberActivVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.WorkroomVo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("manager")
public class ManagerController {
	
	@Inject
	private ManagerService managerService;
	
	@Inject
	private MainService mainService;
	
	@Inject
	private AskService askService;
	
	@Inject
	private EventService eventService;
	
	// 홈
	@RequestMapping(value="/managerHome", method=RequestMethod.GET)
	public String managerHome(Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		List<MemberVo> popularMemberList = managerService.selectPopularMemberList();
		List<HobbyVo> popularHobby = mainService.getPopularHobbyList();
		int memberCount = managerService.getMemberCount();
		int askCount = askService.getCountQnAMain();
		int eventCount = eventService.getCountBanner(pagingDto);
		int eventListCount = eventService.getCountEvent(pagingDto);
		List<Integer> gradeList = managerService.getAllUserGrade();
		List<Integer> loginList = managerService.getAllLoginTime();
		
		model.addAttribute("popularMemberList", popularMemberList);
		model.addAttribute("popularHobby", popularHobby);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("askCount", askCount);
		model.addAttribute("eventCount", eventCount);
		model.addAttribute("eventListCount", eventListCount);
		model.addAttribute("gradeList", JSONArray.fromObject(gradeList));
		model.addAttribute("loginList", JSONArray.fromObject(loginList));
		if (session.getAttribute("loginVo") != null) {
			MemberVo lo_memberVo = (MemberVo)session.getAttribute("loginVo");
			String lo_user_id = lo_memberVo.getUser_id();
			model.addAttribute("lo_user_id", lo_user_id);
		}
		return "manager/manager_home";
	}
	
	// 회원 리스트
	@RequestMapping(value="/managerMemberList", method=RequestMethod.GET)
	public String managerMemberList(Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		int count = managerService.getCountMemberList(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<MemberVo> memberList = managerService.showMemberList(pagingDto);
		
		model.addAttribute("memberList", memberList);
		if (session.getAttribute("loginVo") != null) {
			MemberVo lo_memberVo = (MemberVo)session.getAttribute("loginVo");
			String lo_user_id = lo_memberVo.getUser_id();
			model.addAttribute("lo_user_id", lo_user_id);
		}
		return "manager/member/manager_member_list";
	}

	// 탈퇴 회원 리스트
	@RequestMapping(value="/managerMemberListLeave", method=RequestMethod.GET)
	public String managerMemberLeaveInfo(Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		int count = managerService.getCountMemberListLeave(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<MemberVo> memberLeaveList = managerService.showMemberListLeave(pagingDto);
		model.addAttribute("leaveList", memberLeaveList);
		if (session.getAttribute("loginVo") != null) {
			MemberVo lo_memberVo = (MemberVo)session.getAttribute("loginVo");
			String lo_user_id = lo_memberVo.getUser_id();
			model.addAttribute("lo_user_id", lo_user_id);
		}
		return "manager/member/manager_member_list_leave";
	}
	// 회원 상세페이지
	@RequestMapping(value="/managerMemberContent", method=RequestMethod.GET)
	public String managerMemberContent(String user_id, Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		MemberVo memberVo = managerService.selectMemberById(user_id);
		CateStrVo cateVo = managerService.selectCateStr(user_id);
		String grade = managerService.selectGradeById(user_id);
		MemberActivVo activVo = managerService.selectMemberActivById(user_id);
		String intro = managerService.selectMemberIntroById(user_id);
		LoginTimeVo loginTimeVo = managerService.selectLoginTime(user_id);
		int countLogin = managerService.getCountLoginTime(user_id);
		int contentCnt = managerService.getContentCnt(user_id);
		int QnACnt = managerService.getQnACnt(user_id);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("cateVo", cateVo);
		model.addAttribute("grade", grade);
		model.addAttribute("activVo", activVo);
		model.addAttribute("intro", intro);
		model.addAttribute("loginTime", loginTimeVo);
		model.addAttribute("countLogin", countLogin);
		model.addAttribute("contentCnt", contentCnt);
		model.addAttribute("QnACnt", QnACnt);
		model.addAttribute("pagingDto", pagingDto);
		if (session.getAttribute("loginVo") != null) {
			MemberVo lo_memberVo = (MemberVo)session.getAttribute("loginVo");
			String lo_user_id = lo_memberVo.getUser_id();
			model.addAttribute("lo_user_id", lo_user_id);
		}
		return "manager/member/manager_member_content";
	}
	// 회원 상세 정보 수정
	@RequestMapping(value="/managerMemberContentModify", method=RequestMethod.GET)
	public String managerMemberContentModify(String user_id, Model model, HttpSession session) throws Exception {
		MemberVo memberVo = managerService.selectMemberById(user_id);
		CateStrVo cateVo = managerService.selectCateStr(user_id);
		String grade = managerService.selectGradeById(user_id);
		MemberActivVo activVo = managerService.selectMemberActivById(user_id);
		String intro = managerService.selectMemberIntroById(user_id);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("cateVo", cateVo);
		model.addAttribute("grade", grade);
		model.addAttribute("activVo", activVo);
		model.addAttribute("intro", intro);
		if (session.getAttribute("loginVo") != null) {
			MemberVo lo_memberVo = (MemberVo)session.getAttribute("loginVo");
			String lo_user_id = lo_memberVo.getUser_id();
			model.addAttribute("user_id", lo_user_id);
		}
		return "manager/member/manager_member_content_modify";
	}
	// 회원 상세 정보 수정 실행
	@RequestMapping(value="/managerMemberContentModifyRun", method=RequestMethod.POST)
	public String managerMemberContentModifyRun(MemberVo memberVo, WorkroomVo workroomVo, RedirectAttributes rttr) throws Exception {
		managerService.updateMember(memberVo, workroomVo);
		rttr.addFlashAttribute("updateMsg", "success");
		String user_id = memberVo.getUser_id();
		return "redirect:/manager/managerMemberContent?user_id=" + user_id;
	}
	// 회원 상세 정보 삭제 실행
	@RequestMapping(value="/managerMemberDeleteRun", method=RequestMethod.GET)
	public String managerMemberDeleteRun(String user_id, RedirectAttributes rttr) throws Exception {
		managerService.deleteMember(user_id);
		rttr.addFlashAttribute("deleteMsg", "success");
		return "redirect:/manager/managerMemberListLeave";
	}
	// 회원 상세 정보 삭제 취소실행
	@RequestMapping(value="/managerCancelMemberDeleteRun", method=RequestMethod.GET)
	public String managerCancelMemberDeleteRun(String user_id, RedirectAttributes rttr) throws Exception {
		managerService.cancleDeleteMember(user_id);
		rttr.addFlashAttribute("cancleDeleteMsg", "success");
		return "redirect:/manager/managerMemberList";
	}
	
	
	// 관리자 리스트
	@RequestMapping(value="/managerManagerList", method=RequestMethod.GET)
	public String managerManagerList(Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		int count = managerService.getCountManager(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<ManagerVo> managerList = managerService.showManagerList(pagingDto);
		model.addAttribute("managerList", managerList);
		if (session.getAttribute("loginVo") != null) {
			MemberVo lo_memberVo = (MemberVo)session.getAttribute("loginVo");
			String lo_user_id = lo_memberVo.getUser_id();
			model.addAttribute("lo_user_id", lo_user_id);
		}
		return "manager/manager/manager_manager_list";
	}
	// 관리자 등록 가능 회원 리스트
	@RequestMapping(value="/managerManagerPermission", method=RequestMethod.GET)
	public String managerManagerPermission(Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		int count = managerService.getCountMemberList(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<MemberVo> memberList = managerService.showMemberList(pagingDto);
		model.addAttribute("memberList", memberList);
		if (session.getAttribute("loginVo") != null) {
			MemberVo lo_memberVo = (MemberVo)session.getAttribute("loginVo");
			String lo_user_id = lo_memberVo.getUser_id();
			model.addAttribute("lo_user_id", lo_user_id);
		}
		return "manager/manager/manager_manager_permission";
	}
	// 관리자 등록
	@RequestMapping(value="/managerInsertManager", method=RequestMethod.GET)
	public String managerInsertManager(ManagerVo managerVo) throws Exception {
		managerService.insertManager(managerVo);
		return "redirect:/manager/managerManagerList";
	}
	// 관리자 삭제
	@RequestMapping(value="/managerDeleteManager", method=RequestMethod.GET)
	public String managerDeleteManager(String user_id) throws Exception {
		managerService.deleteManager(user_id);
		System.out.println(user_id);
		return "redirect:/manager/managerManagerList";
	}
	
	


}
