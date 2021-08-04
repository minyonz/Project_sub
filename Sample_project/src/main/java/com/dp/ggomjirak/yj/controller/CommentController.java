package com.dp.ggomjirak.yj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dp.ggomjirak.vo.CommentVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.yj.service.CommentService;

@SessionAttributes({"loginVo"})
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
	public String insertComment(@RequestBody CommentVo commentVo, 
				@ModelAttribute("loginVo") MemberVo loginVo) throws Exception {
		System.out.println(commentVo);
		commentVo.setUser_id(loginVo.getUser_id());
		commentService.insertComment(commentVo);
		return "success";
	}
	
	//답댓글 쓰기 
	@RequestMapping(value="/insertRecomment", method=RequestMethod.POST)
	public String insertRecomment(@RequestBody CommentVo commentVo,
			@ModelAttribute("loginVo") MemberVo loginVo) throws Exception {
		System.out.println(commentVo);
		commentVo.setUser_id(loginVo.getUser_id());
		commentService.insertRecomment(commentVo);
		return "success";
	}
		
	@RequestMapping(value="/updateComment", method=RequestMethod.POST)
	public String updateComment(@RequestBody CommentVo commentVo) throws Exception {
		System.out.println(commentVo);
		commentService.updateComment(commentVo);
		return "success";
	}
		
	@RequestMapping(value="/deleteComment", method=RequestMethod.POST)
	public int deleteComment(@RequestBody CommentVo commentVo) throws Exception {
		System.out.println(commentVo);
		return commentService.deleteComment(commentVo);
	}
}
