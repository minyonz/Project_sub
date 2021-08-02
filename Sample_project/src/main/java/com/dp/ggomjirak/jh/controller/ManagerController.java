package com.dp.ggomjirak.jh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.QnAVo;
import com.dp.ggomjirak.vo.WorkroomVo;

@Controller
@RequestMapping("manager")
public class ManagerController {
	
	@Inject
	private ManagerService managerService;
	
	// 홈
	@RequestMapping(value="/managerHome", method=RequestMethod.GET)
	public String managerHome(Model model) throws Exception {
		List<MemberVo> popularMemberList = managerService.selectPopularMemberList();
		int memberCount = managerService.getMemberCount();
		model.addAttribute("popularMemberList", popularMemberList);
		model.addAttribute("memberCount", memberCount);
		return "manager/manager_home";
	}
	
	// 회원 리스트
	@RequestMapping(value="/managerMemberList", method=RequestMethod.GET)
	public String managerMemberList(Model model, PagingDto pagingDto) throws Exception {
		int count = managerService.getCountMemberList(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<MemberVo> memberList = managerService.showMemberList(pagingDto);
		model.addAttribute("memberList", memberList);
		return "manager/member/manager_member_list";
	}

	// 탈퇴 회원 리스트
	@RequestMapping(value="/managerMemberListLeave", method=RequestMethod.GET)
	public String managerMemberLeaveInfo(Model model, PagingDto pagingDto) throws Exception {
		int count = managerService.getCountMemberListLeave(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<MemberVo> memberLeaveList = managerService.showMemberListLeave(pagingDto);
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
	public String managerManagerList(Model model, PagingDto pagingDto) throws Exception {
		int count = managerService.getCountManager(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<ManagerVo> managerList = managerService.showManagerList(pagingDto);
		model.addAttribute("managerList", managerList);
		return "manager/manager/manager_manager_list";
	}
	// 관리자 등록 가능 회원 리스트
	@RequestMapping(value="/managerManagerPermission", method=RequestMethod.GET)
	public String managerManagerPermission(Model model, PagingDto pagingDto) throws Exception {
		int count = managerService.getCountMemberList(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<MemberVo> memberList = managerService.showMemberList(pagingDto);
		model.addAttribute("memberList", memberList);
		return "manager/manager/manager_manager_permission";
	}
	// 관리자 등록
	@RequestMapping(value="/managerInsertManager", method=RequestMethod.POST)
	public String managerInsertManager(ManagerVo managerVo) throws Exception {
		managerService.insertManager(managerVo);
		return "redirect:/manager/managerManagerList";
	}
	// 관리자 삭제
	@RequestMapping(value="/managerDeleteManager", method=RequestMethod.POST)
	public String managerDeleteManager(String user_id) throws Exception {
		managerService.deleteManager(user_id);
		System.out.println(user_id);
		return "redirect:/manager/managerManagerList";
	}
	
	
	// 문의글 리스트
	@RequestMapping(value="/managerAsk", method=RequestMethod.GET)
	public String managerAsk(Model model, PagingDto pagingDto) throws Exception {
		int count = managerService.getCountQnA(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		List<QnAVo> qnaVo = managerService.selectQnAList(pagingDto);
		model.addAttribute("qnaVo", qnaVo);
		model.addAttribute("pagingDto", pagingDto);
		return "manager/ask/manager_ask";
	}
	// 문의글 상세페이지
	@RequestMapping(value="/managerAskContent", method=RequestMethod.GET)
	public String managerAskContent(Model model, int qna_no) throws Exception {
		QnAVo qnaVo = managerService.selectQnaByNo(qna_no);
		model.addAttribute("qnaVo", qnaVo);
		return "manager/ask/manager_ask_content";
	}
	// 문의글 답변폼
	@RequestMapping(value="/managerAskAnswer", method=RequestMethod.GET)
	public String managerAskAnswer(Model model, int qna_no) throws Exception {
		QnAVo qnaVo = managerService.selectQnaByNo(qna_no);
		model.addAttribute("qnaVo", qnaVo);
		return "manager/ask/manager_ask_answer";
	}
	// 이벤트 리스트 (진행중)
	@RequestMapping(value="/managerEvent", method=RequestMethod.GET)
	public String managerEvent(Model model, PagingDto pagingDto) throws Exception {
		
		int count = managerService.getCountEvent(pagingDto);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		
		List<EventVo> eventList = managerService.showEventList(pagingDto);
		model.addAttribute("eventList", eventList);
		return "manager/event/manager_event";
	}
	// 전체 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventListAll", method=RequestMethod.GET)
	public Map<String, Object> getEventListAll(PagingDto pagingDto) throws Exception {
		int count = managerService.getCountEventAll(pagingDto);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<EventVo> eventListAll = managerService.showEventListAll(pagingDto);
		Map<String, Object> map = new HashMap<>();
		map.put("pagingDto", pagingDto);
		map.put("eventList", eventListAll);
		return map;
	}
	// 완료된 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventListEnd", method=RequestMethod.GET)
	public Map<String, Object> getEventListEnd(PagingDto pagingDto, Model model) throws Exception {
		int count = managerService.getCountEventEnd(pagingDto);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<EventVo> eventListEnd = managerService.showEventListEnd(pagingDto);
		Map<String, Object> map = new HashMap<>();
		map.put("pagingDto", pagingDto);
		map.put("eventList", eventListEnd);
		return map;
	}
	// 삭제된 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventListDelete", method=RequestMethod.GET)
	public Map<String, Object> getEventListDelete(PagingDto pagingDto) throws Exception {
		
		int count = managerService.getCountEventDelete(pagingDto);
		pagingDto.setCount(count);
		
		System.out.println("count: " + count);
		System.out.println("pagingDto: " + pagingDto);
		List<EventVo> eventListDelete = managerService.showEventListDelete(pagingDto);
		Map<String, Object> map = new HashMap<>();
		map.put("pagingDto", pagingDto);
		map.put("eventList", eventListDelete);
		return map;
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
