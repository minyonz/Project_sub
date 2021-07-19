package com.kh.sample.main.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.sample.main.service.StoryService;
import com.kh.sample.main.vo.StoryVo;

@Controller
@RequestMapping(value="/workroom")
public class WrMainController {
	
	@Inject
	StoryService storyService;

	@RequestMapping(value="/wr_main", method=RequestMethod.GET)
	public String wrMain(Model model) throws Exception {
		List<StoryVo> list = storyService.StoryList();
		model.addAttribute("list", list);
		return "workroom/wr_main";
	}
	
	@RequestMapping(value="/wr_hobby", method=RequestMethod.GET)
	public String wrHobby() throws Exception {
		return "workroom/wr_hobby";
	}
	
	@RequestMapping(value="/wr_mbm", method=RequestMethod.GET)
	public String wrMbm() throws Exception {
		return "workroom/wr_mbm";
	}
	
	// 스토리
	@RequestMapping(value="/wr_story", method=RequestMethod.GET)
	public String wrStoryContent(Model model) throws Exception {
		List<StoryVo> list = storyService.StoryList();
		model.addAttribute("list", list);
		return "workroom/wr_story";
	}
	
	// 스토리 상세
	@RequestMapping(value="/wr_story_detail", method=RequestMethod.GET)
	public String wrStoryDetail(int st_no, Model model) throws Exception {
		StoryVo storyVo = storyService.StorySelect(st_no);
		model.addAttribute("storyVo", storyVo);
		return "workroom/wr_story_detail";
	}
	
	// 스토리 작성 폼
	@RequestMapping(value="/wr_story_write", method=RequestMethod.GET)
	public String wrStoryWrite() throws Exception {
		return "workroom/wr_story_write";
	}
	
	// 스토리 작성
	@RequestMapping(value="/wr_story_write_run", method=RequestMethod.POST)
	public String wrStoryWriteRun(StoryVo storyVo) throws Exception {
		storyVo.setUser_id("hong");
		storyService.StoryWrite(storyVo);
		return "redirect:/workroom/wr_main";
	}
		
	@RequestMapping(value="/wr_search", method=RequestMethod.GET)
	public String wrSearch(String txtStSearch, Model model) throws Exception {
		System.out.println(txtStSearch);
		model.addAttribute("txtStSearch", txtStSearch);
		return "workroom/wr_search";
	}
	
}
