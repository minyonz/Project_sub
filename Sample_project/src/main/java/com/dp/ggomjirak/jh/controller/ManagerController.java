package com.dp.ggomjirak.jh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dp.ggomjirak.jh.service.ManagerService;
import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.EventVo;
import com.dp.ggomjirak.vo.ManagerVo;
import com.dp.ggomjirak.vo.MemberActivVo;
import com.dp.ggomjirak.vo.MemberDetailVo;
import com.dp.ggomjirak.vo.MemberInfoVo;
import com.dp.ggomjirak.vo.MemberVo;

@Controller
@RequestMapping("manager")
public class ManagerController {
	
	@Inject
	private ManagerService managerService;
	
	// 홈
	@RequestMapping(value="/managerHome", method=RequestMethod.GET)
	public String managerHome() throws Exception {
		return "manager/manager_home";
	}
	
	// 회원 리스트
	@RequestMapping(value="/managerMemberList", method=RequestMethod.GET)
	public String managerMemberList(Model model) throws Exception {
		List<MemberVo> memberList = managerService.showMemberList();
		model.addAttribute("memberList", memberList);
		return "manager/member/manager_member_list";
	}

	@RequestMapping(value="/managerMemberActivInfo", method=RequestMethod.GET)
	public String managerMemberActivInfo(String user_id, Model model) throws Exception {
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
		return "manager/member/manager_member_activ_info";
	}
	// 탈퇴 회원 리스트
	@RequestMapping(value="/managerMemberListLeave", method=RequestMethod.GET)
	public String managerMemberLeaveInfo(Model model) throws Exception {
		List<MemberVo> memberLeaveList = managerService.showMemberListLeave();
		model.addAttribute("leaveList", memberLeaveList);
		return "manager/member/manager_member_list_leave";
	}
	// 회원 상세페이지
	@RequestMapping(value="/managerMemberContent", method=RequestMethod.GET)
	public String managerMemberContent(String user_id, Model model) throws Exception {
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
		return "manager/member/manager_member_content";
	}
	// 회원 상세 정보 수정
	@RequestMapping(value="/managerMemberContentModify", method=RequestMethod.GET)
	public String managerMemberContentModify(String user_id, Model model) throws Exception {
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
		return "manager/member/manager_member_content_modify";
	}
	// 회원 상세 정보 수정 실행
	@RequestMapping(value="/managerMemberContentModifyRun", method=RequestMethod.POST)
	public String managerMemberContentModifyRun(MemberVo memberVo, RedirectAttributes rttr) throws Exception {
		managerService.updateMember(memberVo);
		rttr.addFlashAttribute("updateMsg", "success");
		String user_id = memberVo.getUser_id();
		System.out.println(memberVo);
		return "redirect:/manager/managerMemberContent?user_id=" + user_id;
	}
	
	
	// 관리자 리스트
	@RequestMapping(value="/managerManagerList", method=RequestMethod.GET)
	public String managerManagerList(Model model) throws Exception {
		List<ManagerVo> managerList = managerService.showManagerList();
		model.addAttribute("managerList", managerList);
		return "manager/manager/manager_manager_list";
	}
	// 관리자 등록 가능 회원 리스트
	@RequestMapping(value="/managerManagerPermission", method=RequestMethod.GET)
	public String managerManagerPermission(Model model) throws Exception {
		List<ManagerVo> managerList = managerService.showManagerList();
		model.addAttribute("managerList", managerList);
		List<MemberVo> memberList = managerService.showMemberList();
		model.addAttribute("memberList", memberList);
		return "manager/manager/manager_manager_permission";
	}
	
	
	// 문의글 리스트
	@RequestMapping(value="/managerAsk", method=RequestMethod.GET)
	public String managerAsk() throws Exception {
		return "manager/ask/manager_ask";
	}
	// 문의글 상세페이지
	@RequestMapping(value="/managerAskContent", method=RequestMethod.GET)
	public String managerAskContent() throws Exception {
		return "manager/ask/manager_ask_content";
	}
	// 문의글 답변폼
	@RequestMapping(value="/managerAskAnswer", method=RequestMethod.GET)
	public String managerAskAnswer() throws Exception {
		return "manager/ask/manager_ask_answer";
	}
	// 이벤트 리스트
	@RequestMapping(value="/managerEvent", method=RequestMethod.GET)
	public String managerEvent(Model model) throws Exception {
		List<EventVo> eventList = managerService.showEventList();
		model.addAttribute("eventList", eventList);
		return "manager/event/manager_event";
	}
	// 전체 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventListAll", method=RequestMethod.GET)
	public List<EventVo> getEventListAll() throws Exception {
		List<EventVo> eventListAll = managerService.showEventListAll();
		return eventListAll;
	}
	// 진행중인 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventList", method=RequestMethod.GET)
	public List<EventVo> getEventList() throws Exception {
		List<EventVo> eventList = managerService.showEventList();
		return eventList;
	}
	// 완료된 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventListEnd", method=RequestMethod.GET)
	public List<EventVo> getEventListEnd() throws Exception {
		List<EventVo> eventListEnd = managerService.showEventListEnd();
		return eventListEnd;
	}
	// 삭제된 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventListDelete", method=RequestMethod.GET)
	public List<EventVo> getEventListDelete() throws Exception {
		List<EventVo> eventListDelete = managerService.showEventListDelete();
		return eventListDelete;
	}
	// 이벤트 상세페이지
	@RequestMapping(value="/managerEventContent", method=RequestMethod.GET)
	public String managerEventContent(int e_no, Model model) throws Exception {
		EventVo eventVo = managerService.selectByEno(e_no);
		model.addAttribute("eventVo", eventVo);
		return "manager/event/manager_event_content";
	}
	// 이벤트 작성폼
	@RequestMapping(value="/managerEventWrite", method=RequestMethod.GET)
	public String managerEventWrite() throws Exception {
		return "manager/event/manager_event_write";
	}
	// 이벤트 작성 실행
	@RequestMapping(value="/managerEventWriteRun", method=RequestMethod.POST)
	public String managerEventWriteRun(EventVo eventVo, RedirectAttributes rttr) throws Exception {
		System.out.println(eventVo);
		managerService.insertEvent(eventVo);
		rttr.addFlashAttribute("writeMsg", "success");
		return "redirect:/manager/managerEvent";
	}
	// 이벤트 수정 페이지
	@RequestMapping(value="/managerEventModify", method=RequestMethod.GET)
	public String managerEventModify(int e_no, Model model) throws Exception {
		EventVo eventVo = managerService.selectByEno(e_no);
		model.addAttribute("eventVo", eventVo);
		return "manager/event/manager_event_modify";
	}
	// 이벤트 수정 실행
	@RequestMapping(value="/managerEventModifyRun", method=RequestMethod.POST)
	public String managerEventModifyRun(EventVo eventVo, RedirectAttributes rttr) throws Exception {
		managerService.updateEvent(eventVo);
		rttr.addFlashAttribute("modifyMsg", "success");
		return "redirect:/manager/managerEvent";
	}
	// 이벤트 삭제 실행
	@RequestMapping(value="/managerEventDeleteRun", method=RequestMethod.GET)
	public String managerEventDeleteRun(int e_no, RedirectAttributes rttr) throws Exception {
		managerService.deleteEvent(e_no);
		rttr.addFlashAttribute("deleteMsg", "success");
		return "redirect:/manager/managerEvent";
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test() throws Exception {
		return "manager/test";
	}

}
