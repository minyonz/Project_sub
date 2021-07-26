package com.dp.ggomjirak.my.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dp.ggomjirak.my.service.StoryCommentService;
import com.dp.ggomjirak.my.service.StoryService;
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
	public String wrStoryContent(Model model, StoryPagingDto storyPagingDto) throws Exception {
		// 세션값 받아와서 넣어주면 됨
		storyPagingDto.setUser_id("cat");
		int count = storyService.storyCount(storyPagingDto);
		storyPagingDto.setCount(count);
//		System.out.println("user_id:" + user_id);
//		System.out.println("count:" + count);
//		System.out.println("pagingDto:" + storyPagingDto);
		List<StoryVo> list = storyService.StoryList(storyPagingDto);
		// 카드프로필 공통 메서드
		wrController.profileCommon(model);
		model.addAttribute("list", list);
		model.addAttribute("storyPagingDto", storyPagingDto);
		return "workroom/wr_story";
	}
	
	// 스토리 상세
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String wrStoryDetail(int st_no, Model model) throws Exception {
		StoryVo storyVo = storyService.StorySelect(st_no);
		List<StoryCommentVo> list = storyCommentService.listComment(st_no);
		wrController.profileCommon(model);
		model.addAttribute("storyVo", storyVo);
		model.addAttribute("list", list);
		return "workroom/wr_story_detail";
	}
	
	// 스토리 작성 폼
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String wrStoryWrite(Model model) throws Exception {
		wrController.profileCommon(model);
		return "workroom/wr_story_write";
	}
	
	// 스토리 작성
	@RequestMapping(value="/write_run", method=RequestMethod.POST)
	public String wrStoryWriteRun(StoryVo storyVo, Model model) throws Exception {
		// 세션 아이디값 받기
		storyVo.setUser_id("cat");
		storyService.StoryWrite(storyVo);
		wrController.profileCommon(model);
		return "redirect:/workroom/main";
	}
	
	
	// 스토리 수정폼
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String wrStoryUpdate(int st_no, Model model) throws Exception {
		StoryVo storyVo = storyService.StorySelect(st_no);
		wrController.profileCommon(model);
		model.addAttribute("storyVo", storyVo);
//		System.out.println(storyVo);
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
