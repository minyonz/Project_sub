package com.dp.ggomjirak.yj.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.CostVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.LevelVo;
import com.dp.ggomjirak.vo.MaterialSearch;
import com.dp.ggomjirak.vo.MaterialVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.TimeVo;
import com.dp.ggomjirak.yj.service.CateService;
import com.dp.ggomjirak.yj.service.HobbyService;
import com.dp.ggomjirak.yj.service.MaterialService;
import com.dp.ggomjirak.my.service.LikeBookmarkService;

import net.sf.json.JSONArray;

@SessionAttributes({"loginVo"})
@Controller
@RequestMapping("/material")
public class MaterialController {
	
	@Inject
	private HobbyService hobbyService;
	@Inject
	private MaterialService materialService;
	@Inject
	private CateService cateService;
	@Inject
	private LikeBookmarkService likeBmService;
	
	private String swalIcon = null;
	private String swalTitle = null;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MaterialController.class);
	
	// 좋아요
	@RequestMapping(value="/like/{hobby_no}")
	@ResponseBody
	public String like(@PathVariable("hobby_no") int hobby_no, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		boolean result = likeBmService.like(hobby_no, user_id);
		if (result == true) {
			return "like";
		}
		return "cancel";
	}
	
	// 북마크
	@RequestMapping(value="/bookmark/{hobby_no}")
	@ResponseBody
	public String bookmark(@PathVariable("hobby_no") int hobby_no, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		boolean result = likeBmService.bookmark(hobby_no, user_id);
		if (result == true) {
			return "bookmark";
		}
		return "cancel";
	}
		
//	@RequestMapping(value="/material")
//	public String material(Model model, HttpSession session) throws Exception {
//		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
//		if (loginVo != null) {
//			model.addAttribute("loginVo", loginVo);
//			model.addAttribute("user_id", loginVo.getUser_id());
//		}
//		List<CateVo> cates = cateService.getCateList();
//		List<TimeVo> times = cateService.getTimeList();
//		List<LevelVo> levels = cateService.getLevelList();
//		List<CostVo> costs = cateService.getCostList();
//		model.addAttribute("cates", JSONArray.fromObject(cates));
//		model.addAttribute("times", JSONArray.fromObject(times));
//		model.addAttribute("levels", JSONArray.fromObject(levels));
//		model.addAttribute("costs", JSONArray.fromObject(costs));
//		return "hobby/material_list";
//	}
	
	@RequestMapping(value="search")
	public String search(Model model, HttpSession session, @ModelAttribute("ms") MaterialSearch ms) throws Exception {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		if (loginVo != null) {
			model.addAttribute("loginVo", loginVo);
			model.addAttribute("user_id", loginVo.getUser_id());
		}
		logger.info("controller");
		System.out.println(ms);
		List<HobbyVo> hmList = materialService.selectHMList(ms);
		model.addAttribute("hmList", hmList);
		
		List<CateVo> cates = cateService.getCateList();
		List<TimeVo> times = cateService.getTimeList();
		List<LevelVo> levels = cateService.getLevelList();
		List<CostVo> costs = cateService.getCostList();
		model.addAttribute("cates", JSONArray.fromObject(cates));
		model.addAttribute("times", times);
		model.addAttribute("levels", levels);
		model.addAttribute("costs", costs);
		return "hobby/material_list";
	}
}