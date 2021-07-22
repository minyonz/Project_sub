package com.kh.sample.main.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.sample.main.service.StoryCommentService;
import com.kh.sample.main.service.StoryService;
import com.kh.sample.main.vo.StoryCommentVo;
import com.kh.sample.main.vo.StoryVo;

@Controller
@RequestMapping(value="/story")
public class StoryController {
	
	@Inject
	StoryService storyService;
	
	@Inject
	StoryCommentService storyCommentService;
	
	// 스토리
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String wrStoryContent(Model model) throws Exception {
		List<StoryVo> list = storyService.StoryList("cat");
		model.addAttribute("list", list);
		return "workroom/wr_story";
	}
	
	// 스토리 상세
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String wrStoryDetail(int st_no, Model model) throws Exception {
		StoryVo storyVo = storyService.StorySelect(st_no);
		List<StoryCommentVo> list = storyCommentService.listComment(st_no);
		model.addAttribute("storyVo", storyVo);
		model.addAttribute("list", list);
		return "workroom/wr_story_detail";
	}
	
	// 스토리 작성 폼
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String wrStoryWrite() throws Exception {
		return "workroom/wr_story_write";
	}
	
	// 스토리 작성
	@RequestMapping(value="/write_run", method=RequestMethod.POST)
	public String wrStoryWriteRun(StoryVo storyVo) throws Exception {
		// 세션 아이디값 받기
		storyVo.setUser_id("cat");
		storyService.StoryWrite(storyVo);
		return "redirect:/workroom/main";
	}
	
	
	// 스토리 수정폼
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String wrStoryUpdate(int st_no, Model model) throws Exception {
		StoryVo storyVo = storyService.StorySelect(st_no);
		model.addAttribute("storyVo", storyVo);
		System.out.println(storyVo);
		return "workroom/wr_story_update";
	}
	
	// 스토리 수정실행
	@RequestMapping(value="/update_run", method=RequestMethod.POST)
	public String wrStoryUpdateRun(StoryVo storyVo) throws Exception {
		storyVo.setUser_id("cat");
		storyService.StoryUpdate(storyVo);
		System.out.println(storyVo);
		return "redirect:/workroom/main";
	}
}
