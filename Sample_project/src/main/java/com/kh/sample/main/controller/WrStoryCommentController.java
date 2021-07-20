package com.kh.sample.main.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
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
	public String stCommentWrite(StoryCommentVo storyCommentVo) throws Exception {
		storyCommentVo.setUser_id("hong");
		storyCommentService.writeComment(storyCommentVo);
		return "success";
	}
	
	@RequestMapping(value="/comment_list", method=RequestMethod.GET)
	public String stCommentList(Model model, int st_no) throws Exception {
		List<StoryCommentVo> list = storyCommentService.listComment(st_no);
		model.addAttribute("list", list);
		return "success";
	}
	
}
