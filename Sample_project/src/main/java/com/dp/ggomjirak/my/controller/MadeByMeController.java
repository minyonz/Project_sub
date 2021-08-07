package com.dp.ggomjirak.my.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dp.ggomjirak.my.service.MadeByMeService;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MadeByMeVo;
import com.dp.ggomjirak.vo.MemberVo;

@SessionAttributes({"loginVo"})
@Controller
@RequestMapping(value="/mbm")
public class MadeByMeController {
	
	@Inject
	MadeByMeService madebymeService;
	
	@Inject
	private WorkroomController wrController = new WorkroomController();
	
	@RequestMapping(value="/write/{hobby_no}", method=RequestMethod.GET)
	public String mbmWrite(@PathVariable("hobby_no")int hobby_no, Model model, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		
		HobbyVo hobbyVo = madebymeService.selectHobby(hobby_no);
		model.addAttribute("user_id", memberVo.getUser_id());
		model.addAttribute("hobbyVo", hobbyVo);
		return "workroom/madebyme_write";
	}
	
	@RequestMapping(value="/writeRun")
	public String mbmWriteRun(MadeByMeVo madebymeVo, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		System.out.println("madeByMeVo:" + madebymeVo);
		String user_id = memberVo.getUser_id();
		madebymeVo.setUser_id(user_id);
		madebymeService.mbmWrite(madebymeVo);
		return "redirect:/hobby/content/" + madebymeVo.getHobby_no();
	}
	
	// 상세보기
	@RequestMapping(value="/detail/{user_id}", method=RequestMethod.GET)
	public String mbmDetail(@PathVariable("user_id")String page_id, int mbm_no, int hobby_no, Model model, HttpSession session) throws Exception {
		MadeByMeVo madebymeVo = madebymeService.selectMbm(mbm_no, hobby_no);
		HobbyVo hobbyVo = madebymeService.selectHobby(hobby_no);
		String user_id = null;
		wrController.category(model);
		if (session.getAttribute("loginVo") != null) {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			user_id = memberVo.getUser_id();
			int likeCheck = madebymeService.likeCheck(mbm_no, user_id);
			model.addAttribute("likeCheck", likeCheck);
			model.addAttribute("user_id", user_id);
		}
		model.addAttribute("user_id", user_id);
		model.addAttribute("page_id", page_id);
		model.addAttribute("madebymeVo", madebymeVo);
		model.addAttribute("hobbyVo", hobbyVo);
		return "workroom/madebyme_detail";
	}
	
	// 수정폼
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String mbmUpdate(int mbm_no, int hobby_no, Model model, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		HobbyVo hobbyVo = madebymeService.selectHobby(hobby_no);
		MadeByMeVo madebymeVo = madebymeService.selectMbm(mbm_no, hobby_no);
		model.addAttribute("hobbyVo", hobbyVo);
		model.addAttribute("madebymeVo", madebymeVo);
		model.addAttribute("user_id", memberVo.getUser_id());
		return "workroom/madebyme_update";
	}
	
	// 수정실행
	@RequestMapping(value="/updateRun", method=RequestMethod.POST)
	public String mbmUpdateRun(MadeByMeVo madebymeVo, HttpSession session) throws Exception {
		System.out.println("madebymeVo:" + madebymeVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		madebymeService.updateMbm(madebymeVo);
		return "redirect:/mbm/detail/" + user_id + "?hobby_no=" + madebymeVo.getHobby_no() + "&mbm_no=" + madebymeVo.getMbm_no();
	}
	
	// 삭제 
	@RequestMapping(value="/deleteRun")
	public String mbmDeleteRun(int mbm_no, int hobby_no) throws Exception {
		madebymeService.deleteMbm(mbm_no, hobby_no);
		return "redirect:/hobby/content/" + hobby_no;
	}
	
	// 좋아요
	@RequestMapping(value="/like/{mbm_no}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> like(@PathVariable("mbm_no") int mbm_no, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		Map<String, Object> map = new HashMap<>();
		boolean result = madebymeService.like(mbm_no, user_id);
		int likeCount = madebymeService.likeAll(mbm_no);
		map.put("likeCount", likeCount);
		if (result == true) {
			map.put("like", "like");
			return map;
		}
		map.put("cancel", "cancel");
		return map;
	}

}





