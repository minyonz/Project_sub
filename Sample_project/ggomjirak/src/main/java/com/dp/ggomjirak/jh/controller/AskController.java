package com.dp.ggomjirak.jh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dp.ggomjirak.jh.service.AskService;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.QnAVo;

@Controller
@RequestMapping("ask")
public class AskController {
	
	@Inject
	private AskService askService;
	
	
	// 문의글 리스트
	@RequestMapping(value="/managerAsk", method=RequestMethod.GET)
	public String managerAsk(Model model, PagingDto pagingDto) throws Exception {
		int count = askService.getCountQnA(pagingDto);
		pagingDto.setEndRow(10);
		pagingDto.setPerPage(10);
		pagingDto.setCount(count);
		
		List<QnAVo> qnaVo = askService.selectQnAList(pagingDto);
		model.addAttribute("qnaVo", qnaVo);
		model.addAttribute("pagingDto", pagingDto);
		return "manager/ask/manager_ask";
	}
	// 문의글 상세페이지
	@RequestMapping(value="/managerAskContent", method=RequestMethod.GET)
	public String managerAskContent(Model model, int qna_no) throws Exception {
		QnAVo qnaVo = askService.selectQnaByNo(qna_no);
		model.addAttribute("qnaVo", qnaVo);
		return "manager/ask/manager_ask_content";
	}
	// 문의글 답변폼
	@RequestMapping(value="/managerAskAnswer", method=RequestMethod.GET)
	public String managerAskAnswer(Model model, int qna_no) throws Exception {
		QnAVo qnaVo = askService.selectQnaByNo(qna_no);
		model.addAttribute("qnaVo", qnaVo);
		return "manager/ask/manager_ask_answer";
	}
	// 문의글 답변폼
	@RequestMapping(value="/managerAskAnswerRun", method=RequestMethod.POST)
	public String managerAskAnswerRun(QnAVo qnaVo, int a_no) throws Exception {		
		System.out.println("controller : " + a_no);
		askService.insertAnswer(qnaVo);
		System.out.println("controller : " + qnaVo.getQna_no());
		System.out.println(qnaVo);
		return "redirect:/ask/managerAskContent?qna_no=" + a_no;
	}

}
