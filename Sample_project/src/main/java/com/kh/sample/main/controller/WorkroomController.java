package com.kh.sample.main.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.sample.main.service.StoryService;
import com.kh.sample.main.service.WorkroomService;
import com.kh.sample.main.vo.HobbyVo;
import com.kh.sample.main.vo.StoryVo;

@Controller
@RequestMapping(value="/workroom")
public class WorkroomController {
	
	@Inject
	StoryService storyService;
	
	@Inject
	WorkroomService workroomService;

	@RequestMapping(value="/wr_main", method=RequestMethod.GET)
	public String wrMain(Model model) throws Exception {
		List<StoryVo> storyList = storyService.StoryList("cat");
		List<HobbyVo> hobbyList = workroomService.listHobby("cat");
		model.addAttribute("storyList", storyList);
		model.addAttribute("hobbyList", hobbyList);
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
		
	// 검색
	@RequestMapping(value="/wr_search", method=RequestMethod.GET)
	public String wrSearch(String txtStSearch, Model model) throws Exception {
		System.out.println(txtStSearch);
		model.addAttribute("txtStSearch", txtStSearch);
		return "workroom/wr_search";
	}

	
}




















