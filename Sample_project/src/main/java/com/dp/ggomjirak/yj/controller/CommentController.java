package com.dp.ggomjirak.yj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dp.ggomjirak.vo.CommentVo;
import com.dp.ggomjirak.yj.service.CommentService;

@RestController
@RequestMapping("/comment")
public class CommentController {
	
	@Inject
	private CommentService commentService;
	
	//댓글 목록
	@RequestMapping(value="/selectCommentList/{h_no}", method=RequestMethod.GET)
	public List<CommentVo> selectCommentList(@PathVariable("h_no") int h_no) throws Exception {
		List<CommentVo> list = commentService.selectCommentList(h_no);
		return list;
	}
	
	//댓글 쓰기 
	@RequestMapping(value="/insertComment", method=RequestMethod.POST)
	public String insertComment(@RequestBody CommentVo commentVo) throws Exception {
		System.out.println(commentVo);
		commentService.insertComment(commentVo);
		return "success";
	}
	
	//답댓글 쓰기 
	@RequestMapping(value="/insertRecomment", method=RequestMethod.POST)
	public String insertRecomment(@RequestBody CommentVo commentVo) throws Exception {
		System.out.println(commentVo);
		commentService.insertRecomment(commentVo);
		return "success";
	}
		
	@RequestMapping(value="/updateComment", method=RequestMethod.POST)
	public String updateComment(@RequestBody CommentVo commentVo) throws Exception {
		System.out.println(commentVo);
		commentService.updateComment(commentVo);
		return "success";
	}
		
	@RequestMapping(value="/deleteComment/{c_no}", method=RequestMethod.GET)
	public int deleteComment(@PathVariable("c_no") int c_no) throws Exception {
		System.out.println("c_no:" + c_no); 
		return commentService.deleteComment(c_no);
	}
}
