package com.dp.ggomjirak.my.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dp.ggomjirak.my.service.StoryCommentService;
import com.dp.ggomjirak.my.service.StoryService;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.StoryCommentVo;
import com.dp.ggomjirak.vo.StoryPagingDto;
import com.dp.ggomjirak.vo.StoryVo;

@Controller
@RequestMapping(value="/story")
public class StoryController {
	
	@Inject
	StoryService storyService;
	
	@Inject
	StoryCommentService storyCommentService;
	
	@Inject
	WorkroomController wrController = new WorkroomController();
	
	// 스토리
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String wrStoryList(Model model, StoryPagingDto storyPagingDto, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		storyPagingDto.setUser_id(user_id);
		int count = storyService.storyCount(storyPagingDto);
		storyPagingDto.setCount(count);
		List<StoryVo> list = storyService.StoryList(storyPagingDto);
//		int likeCheck = 0;
//		for (int i = 0; i < list.size(); i++) {
//			StoryVo vo = list.get(i);
//			int st_no = vo.getSt_no();
//			likeCheck = storyService.likeCheck(st_no, user_id);
//			System.out.println(likeCheck);
//			System.out.println(st_no);
//			model.addAttribute("likeCheck", likeCheck);
//		}
//		System.out.println(list);
		// 카드프로필 공통 메서드
		wrController.profileCommon(model, session);
		model.addAttribute("list", list);
		model.addAttribute("storyPagingDto", storyPagingDto);
		return "workroom/wr_story";
	}
	
	// 스토리 상세
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String wrStoryDetail(int st_no, Model model, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		StoryVo storyVo = storyService.StorySelect(st_no);
		List<StoryCommentVo> list = storyCommentService.listComment(st_no);
		wrController.profileCommon(model, session);
		int likeCheck = storyService.likeCheck(st_no, user_id);
		model.addAttribute("likeCheck", likeCheck);
		model.addAttribute("storyVo", storyVo);
		model.addAttribute("list", list);
		return "workroom/wr_story_detail";
	}
	
	// 스토리 작성 폼
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String wrStoryWrite(Model model, HttpSession session) throws Exception {
		wrController.profileCommon(model, session);
		return "workroom/wr_story_write";
	}
	
	// 스토리 작성
	@RequestMapping(value="/write_run", method=RequestMethod.POST)
	public String wrStoryWriteRun(StoryVo storyVo, Model model, HttpSession session) throws Exception {
		// 세션 아이디값 받기
		storyVo.setUser_id("cat");
		storyService.StoryWrite(storyVo);
		wrController.profileCommon(model, session);
		return "redirect:/workroom/main";
	}
	
	// 스토리 수정폼
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String wrStoryUpdate(int st_no, Model model, HttpSession session) throws Exception {
		StoryVo storyVo = storyService.StorySelect(st_no);
		wrController.profileCommon(model, session);
		model.addAttribute("storyVo", storyVo);
//		System.out.println(storyVo);
		return "workroom/wr_story_update";
	}
	
	// 스토리 수정실행
	@RequestMapping(value="/update_run", method=RequestMethod.POST)
	public String wrStoryUpdateRun(StoryVo storyVo, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		storyVo.setUser_id(user_id);
		storyService.StoryUpdate(storyVo);
//		System.out.println(storyVo);
		return "redirect:/workroom/main";
	}
	
	// 스토리 삭제 실행
	@RequestMapping(value="/delete_run", method=RequestMethod.GET)
	public String wrStoryDeleteRun(int st_no) throws Exception {
		storyService.StoryDelete(st_no);
		return "redirect:/story/list";
	}
	
	// 스토리 좋아요
	@RequestMapping(value="/like/{st_no}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> like(@PathVariable("st_no") int st_no, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		Map<String, Object> map = new HashMap<>();
		boolean result = storyService.like(st_no, user_id);
		int likeCount = storyService.likeAll(st_no);
		map.put("likeCount", likeCount);
		if (result == true) {
			map.put("like", "like");
			return map;
		}
		map.put("cancel", "cancel");
		return map;
	}
	
//	@RequestMapping(value="/like/check", method=RequestMethod.GET)
//	public String likeCheck(int st_no, HttpSession session) throws Exception {
//		
//		return null;
//	}
}










