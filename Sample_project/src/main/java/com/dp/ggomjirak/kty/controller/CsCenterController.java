package com.dp.ggomjirak.kty.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//import com.dp.ggomjirak.HomeController;
import com.dp.ggomjirak.kty.service.CsCenterService;
import com.dp.ggomjirak.vo.LoginVo;
import com.dp.ggomjirak.vo.MemberVo;
//import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.QnAVo;

@Controller
@RequestMapping(value="/cs_center")
public class CsCenterController {
	
	@Inject
	private CsCenterService CsCenterService;
	
	// 마이 페이지 - 문의 게시판 리스트
	@RequestMapping(value = "/consultList", method = RequestMethod.GET)
	public String consultList(Model model, HttpSession session) throws Exception {
		
		System.out.println("1:1 문의 게시판 리스트");
		//System.out.println("로그인 아이디 HomeController.userID: " + HomeController.userID);
		
		//int count = CsCenterService.getCount(pagingDto);
		//pagingDto.setCount(count);
		//System.out.println("pagingDto:" + pagingDto);
		
		// List<QnAVo> list = CsCenterService.listAll(HomeController.userID);
		// 2021-08-04 추가
		if (session.getAttribute("loginVo") != null) {
			System.out.println("session.getAttribute(\"loginVo\") != null");
			
			MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
			String user_id = memberVo.getUser_id();
			System.out.println("user_id: " + user_id);
			
			List<QnAVo> list = CsCenterService.listAll(user_id);
			model.addAttribute("list", list);
			model.addAttribute("user_id", user_id);
		}
		//model.addAttribute("pagingDto", pagingDto);
		//model.addAttribute("pagingDto");
		return "/cs_center/consult_list";
	}

	// 마이 페이지 - 문의 게시판 글쓰기 폼 열기
	@RequestMapping(value = "/consultQs", method = RequestMethod.GET)
	public String consultQs(Model model, HttpSession session) throws Exception {
		System.out.println("1:1 문의 게시판 글쓰기 폼 열기");
		if (session.getAttribute("loginVo") != null) {
			MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
			String user_id = memberVo.getUser_id();

			model.addAttribute("memberVo", memberVo);
			model.addAttribute("user_id", user_id);
		}
		return "/cs_center/consult_qs";
	}
	
	// 마이 페이지 - 문의 게시판 글쓰기 저장 실행
	@RequestMapping(value = "/consultQsRun", method = RequestMethod.POST)
	public String consultQSRun(QnAVo qnAVo, RedirectAttributes rttr, HttpSession session)  throws Exception {
		System.out.println("1:1 문의 게시판 글쓰기 저장 실행");
		System.out.println(qnAVo);
		CsCenterService.wirteRun(qnAVo);
		
		rttr.addFlashAttribute("msg", "wirteRun_success");
		return "redirect:/cs_center/consultList";
	}
	
	// 마이 페이지 - 문의 게시판 글쓰기 수정으로 폼 열기
	@RequestMapping(value = "/consultQsModify", method = RequestMethod.GET)
	public String consultQsModify(int qna_no, MemberVo memberVo, Model model, HttpSession session) throws Exception {
		System.out.println("1:1 문의 게시판 글 수정 폼 열기-");
		memberVo = (MemberVo)session.getAttribute("loginVo");
	 	model.addAttribute("memberVo", memberVo);
	 	
	 	if(qna_no != 0) {
	 		QnAVo qnAVo = CsCenterService.content(qna_no);
			System.out.println(qnAVo);
			model.addAttribute("qnAVo", qnAVo);
	 	}
		return "/cs_center/consult_qs";
	}
	
	// 마이 페이지 - 문의하기 글 내용 수정
	@RequestMapping(value = "/consultQnARun", method = RequestMethod.POST)
	public String consultQnARun(QnAVo qnAVo, RedirectAttributes rttr)  throws Exception {
		System.out.println("1:1 문의 글 내용 수정");
		System.out.println(qnAVo);
		
		CsCenterService.updateRun(qnAVo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/cs_center/consultQnA?qna_no="+qnAVo.getQna_no();
	}
		
	// 마이 페이지 - 문의하기 글 내용 확인 삭제
	@RequestMapping(value = "/consultQnADelete", method = RequestMethod.GET)
	public String consultQnADelete(int qna_no, RedirectAttributes rttr)  throws Exception {
		System.out.println("1:1 문의 글 내용 삭제");
		System.out.println("qna_no: " + qna_no);
		
		CsCenterService.deleteRun(qna_no);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/cs_center/consultList";
	}
	
	// 마이 페이지 - 문의하기 글 내용 확인
	@RequestMapping(value = "/consultQnA", method = RequestMethod.GET)
	public String consultQnA(int qna_no, Model model, HttpSession session) throws Exception {
		System.out.println("1:1 문의 글 내용 확인 들어왔음");
		System.out.println("qna_no: " + qna_no);
		
		// 세션에 있는 로그인 아이디랑
		// 해당 글 번호의 아이디 값이랑 비교해서 같을 때만 보여줄 수 있도록 추가 작업해야 됨 
		if (session.getAttribute("loginVo") != null) {
			MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
			String user_id = memberVo.getUser_id();
			System.out.println("session user_id: " + user_id);
		}
		
		// 아아디값 같이 받아오는 것도 괜찮은거 같다고...?
		QnAVo qnAVo = CsCenterService.content(qna_no);
		System.out.println(qnAVo);
		model.addAttribute("qnAVo", qnAVo);
	 	return "cs_center/consult_qna";
	}
	
	
	
	
}
