package com.kh.sample.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/workroom")
public class WrMainController {

	@RequestMapping(value="/wr_main", method=RequestMethod.GET)
	public String wrMain() throws Exception {
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
	
	@RequestMapping(value="/wr_story_content", method=RequestMethod.GET)
	public String wrStoryContent() throws Exception {
		return "workroom/wr_story_content";
	}
	
	@RequestMapping(value="/wr_story_write", method=RequestMethod.GET)
	public String wrStoryWrite() throws Exception {
		return "workroom/wr_story_write";
	}
	
	// 스토리 작성
	@RequestMapping(value="/wr_story_write_run", method=RequestMethod.POST)
	public String wrStoryWriteRun() throws Exception {
		return "redirect:/workroom/wr_main";
	}
	
}
