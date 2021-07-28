package com.dp.ggomjirak.my.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dp.ggomjirak.my.service.StoryCommentService;
import com.dp.ggomjirak.vo.StoryCommentVo;

@RestController
@RequestMapping("/st_comment")
public class StoryCommentController {
	
	@Inject
	StoryCommentService storyCommentService;
	
	// 댓글쓰기
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public Map<String, Object> stCommentWrite(StoryCommentVo storyCommentVo) throws Exception {
		storyCommentVo.setUser_id("cat");
		storyCommentService.writeComment(storyCommentVo);
		int commentCount = storyCommentService.commentCount(storyCommentVo.getSt_no());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", "success");
		map.put("commentCount", commentCount);
		return map;
	}
	
	// 댓글 목록
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public List<StoryCommentVo> stCommentList(int st_no) throws Exception {
		List<StoryCommentVo> list = storyCommentService.listComment(st_no);
		System.out.println(st_no);
		return list;
	}
	
	// 댓글 삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public Map<String, Object> stCommentDelete(int st_no, int st_c_no) throws Exception {
		storyCommentService.deleteComment(st_no, st_c_no);
		int commentCount = storyCommentService.commentCount(st_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", "success");
		map.put("commentCount", commentCount);
		return map;
	}
	
}








