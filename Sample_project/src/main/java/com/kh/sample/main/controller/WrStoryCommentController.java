package com.kh.sample.main.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sample.main.service.StoryCommentService;
import com.kh.sample.main.vo.StoryCommentVo;

@RestController
@RequestMapping("/st_comment")
public class WrStoryCommentController {
	
	@Inject
	StoryCommentService storyCommentService;
	
	@RequestMapping(value="/comment_write", method=RequestMethod.POST)
	public String StCommentWrite(StoryCommentVo storyCommentVo) throws Exception {
		storyCommentVo.setUser_id("hong");
		storyCommentService.writeComment(storyCommentVo);
		return "success";
	}
	
}
