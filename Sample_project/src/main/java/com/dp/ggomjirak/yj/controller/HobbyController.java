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
import com.dp.ggomjirak.vo.LikeBookmarkVo;
import com.dp.ggomjirak.vo.MaterialSearch;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.ReviewPaging;
import com.dp.ggomjirak.vo.TimeVo;
import com.dp.ggomjirak.yj.service.CateService;
import com.dp.ggomjirak.yj.service.HobbyService;
import com.dp.ggomjirak.my.service.LikeBookmarkService;
import com.dp.ggomjirak.my.service.WorkroomSetService;

import net.sf.json.JSONArray;

@SessionAttributes({"loginVo"})
@Controller
@RequestMapping("/hobby")
public class HobbyController {
	
	@Inject
	private HobbyService hobbyService;
	@Inject
	private CateService cateService;
	@Inject
	private LikeBookmarkService likeBmService;
	
	private String swalIcon = null;
	private String swalTitle = null;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HobbyController.class);
	
	@RequestMapping(value="/content/{hobby_no}")
	public String content(Model model, 
			@PathVariable("hobby_no") int hobby_no,
			@ModelAttribute("ms") MaterialSearch ms,
			@ModelAttribute("rp") ReviewPaging rp,
			HttpServletRequest request,
			HttpSession session) throws Exception {
		HobbyVo hobbyVo = hobbyService.selectHobbyArticle(hobby_no, rp, false);
		List<CateVo> cates = cateService.getCateList();
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		if (loginVo != null) {
			model.addAttribute("loginVo", loginVo);
			model.addAttribute("user_id", loginVo.getUser_id());
			int likeCheck = likeBmService.likeCheck(hobby_no, loginVo.getUser_id());
			int bookmarkCheck = likeBmService.bookmarkCheck(hobby_no, loginVo.getUser_id());
			model.addAttribute("likeCheck", likeCheck);
			model.addAttribute("bookmarkCheck", bookmarkCheck);
		}
//		System.out.println("ms:" + ms);
		System.out.println("rp:" + rp);
		model.addAttribute("cates", JSONArray.fromObject(cates));
		model.addAttribute("hobbyVo", hobbyVo);
		model.addAttribute("url", request.getRequestURL());
		return "hobby/content";
	}
	
	@RequestMapping(value="/update/{hobby_no}")
	public String update(Model model,
			@ModelAttribute("loginVo") MemberVo loginVo,
			@PathVariable("hobby_no") int hobby_no) throws Exception {
		model.addAttribute("user_id", loginVo.getUser_id());
		HobbyVo hobbyVo = hobbyService.selectHobbyArticle(hobby_no, null, true);
		model.addAttribute("hobbyVo", hobbyVo);
		
		List<CateVo> cates = cateService.getCateList();
		List<TimeVo> times = cateService.getTimeList();
		List<LevelVo> levels = cateService.getLevelList();
		List<CostVo> costs = cateService.getCostList();
		model.addAttribute("cates", JSONArray.fromObject(cates));
		model.addAttribute("times", JSONArray.fromObject(times));
		model.addAttribute("levels", JSONArray.fromObject(levels));
		model.addAttribute("costs", JSONArray.fromObject(costs));
		return "hobby/modify_form";
	}
	
	@RequestMapping(value="/updateRun")
	public String updateRun(@ModelAttribute HobbyVo hobbyVo, 
			@ModelAttribute("loginVo") MemberVo loginVo, 
			HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		System.out.println(hobbyVo);
		hobbyVo.setUser_id(loginVo.getUser_id());
		boolean result = hobbyService.updateHobbyArticle(hobbyVo);
		String url = "redirect:/hobby/content/" + hobbyVo.getHobby_no();;
		
		if(result == true) {
			swalIcon = "success";
			swalTitle = "수정 성공";
		} else {
			swalIcon = "error";
			swalTitle = "수정 실패";
		}
		
		rttr.addFlashAttribute("swalIcon",swalIcon);
		rttr.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	@RequestMapping(value="/insert")
	public String insert(Model model, @ModelAttribute("loginVo") MemberVo loginVo) throws Exception {
		List<CateVo> cates = cateService.getCateList();
		List<TimeVo> times = cateService.getTimeList();
		List<LevelVo> levels = cateService.getLevelList();
		List<CostVo> costs = cateService.getCostList();
		model.addAttribute("user_id", loginVo.getUser_id());
		model.addAttribute("cates", JSONArray.fromObject(cates));
		model.addAttribute("times", JSONArray.fromObject(times));
		model.addAttribute("levels", JSONArray.fromObject(levels));
		model.addAttribute("costs", JSONArray.fromObject(costs));
		return "hobby/write_form";
	}
	
	@RequestMapping(value="/insertRun")
	public String insertRun(HobbyVo hobbyVo, 
			@ModelAttribute("loginVo") MemberVo loginVo, 
			RedirectAttributes rttr) throws Exception {
		
		System.out.println(hobbyVo);
		hobbyVo.setUser_id(loginVo.getUser_id());
		
		boolean result = hobbyService.insertHobbyArticle(hobbyVo);
		logger.info("insert");
		String url = null;
		String msgInsert = null;
		
		if(result == true) {
			msgInsert = "success";
			url = "redirect:/workroom/hobby/" + loginVo.getUser_id();
		} else {
			msgInsert = "fail";
			url = "redirect:/hobby/insert";
		}
		
		
		rttr.addFlashAttribute("msgInsert", msgInsert);
		return url;
	}
	
	// 게시글 삭제
	@RequestMapping("delete/{hobby_no}")
	public String deleteMarket(@PathVariable("hobby_no") int hobby_no, 
				@ModelAttribute("loginVo") MemberVo loginVo, 
				@ModelAttribute("ms") MaterialSearch ms,
				HttpServletRequest request, RedirectAttributes rttr) {
		
		int result = hobbyService.deleteHobbyArticle(hobby_no);
		logger.info("delete");
		System.out.println("ms:" + ms);
		String url = "redirect:/hobby/content/" + hobby_no;
		String msgDelete = null;
		
		String  paging = null;
		if(ms != null) {
			if(ms.getM_no() == 0) { // m_no가 0이라면 작업실로 넘어가게하기
				if(result > 0) {
					msgDelete = "success";
					url = "redirect:/workroom/hobby/" + loginVo.getUser_id();
				} else {
					msgDelete = "fail";
				}
			} else {
				if (ms.getSort() != null) {
					paging = "m_no=" + ms.getM_no() +
							"&time=" + ms.getTime() +
							"&level=" + ms.getLevel() +
							"&cost=" + ms.getCost() +
							"&sort=" + ms.getSort() +
							"&page=" + ms.getPage();
				} else {
					paging = "m_no=" + ms.getM_no() +
							"&time=" + ms.getTime() +
							"&level=" + ms.getLevel() +
							"&cost=" + ms.getCost() +
							"&page=" + ms.getPage();
				}
				
				if(result > 0) {
					msgDelete = "success";
					url = "redirect:/hobby/material/search?" + paging;
				} else {
					msgDelete = "fail";
				}
			}
		}
	
		
		rttr.addFlashAttribute("msgDelete",msgDelete);
		return url;
	}
	
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
		
	@RequestMapping(value="/material/search")
	public String search(Model model, HttpSession session, 
			@ModelAttribute("ms") MaterialSearch ms) throws Exception {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		if (loginVo != null) {
			model.addAttribute("loginVo", loginVo);
			model.addAttribute("user_id", loginVo.getUser_id());
			ms.setUser_id(loginVo.getUser_id());
		}
		logger.info("controller");
		System.out.println(ms);
		List<HobbyVo> hmList = hobbyService.selectHMList(ms);
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