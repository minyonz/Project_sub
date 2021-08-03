package com.dp.ggomjirak.yj.controller;




import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.CompleteImgVo;
import com.dp.ggomjirak.vo.CostVo;
import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.LevelVo;
import com.dp.ggomjirak.vo.MakeStepVo;
import com.dp.ggomjirak.vo.TimeVo;
import com.dp.ggomjirak.yj.service.CateService;
import com.dp.ggomjirak.yj.service.HobbyService;
import com.dp.ggomjirak.yj.util.MyFileUploadUtil;

import net.sf.json.JSONArray;

@Controller
public class HobbyController {
	
	@Inject
	private HobbyService hobbyService;
	
	@Inject
	private CateService cateService;
	
	private static final Logger logger = LoggerFactory.getLogger(HobbyController.class);
	private static final String MAIN_IMG_UPLOAD_PATH = "test/main_img";
	private static final String STEP_IMG_UPLOAD_PATH = "test/make_step";
	private static final String COMPLETE_IMG_UPLOAD_PATH = "test/complete_img";
	
	
	@RequestMapping(value="/content/{hobby_no}", method=RequestMethod.GET)
	public String content(Model model, @PathVariable("hobby_no") int hobby_no,
			HttpServletRequest request) throws Exception {
		HobbyVo hobbyVo = hobbyService.selectHobbyArticle(hobby_no, false);
		List<CateVo> cates = cateService.getCateList();
		model.addAttribute("cates", JSONArray.fromObject(cates));
		model.addAttribute("hobbyVo", hobbyVo);
		model.addAttribute("url", request.getRequestURL());
		return "hobby/content";
	}
	
	@RequestMapping(value="/update/{hobby_no}", method=RequestMethod.GET)
	public String update(Model model, @PathVariable("hobby_no") int hobby_no) throws Exception {
		
		HobbyVo hobbyVo = hobbyService.selectHobbyArticle(hobby_no, true);
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
	
	@RequestMapping(value="/updateRun", method=RequestMethod.POST)
	public String updateRun(@ModelAttribute HobbyVo hobbyVo) throws Exception {
		System.out.println(hobbyVo);
		hobbyService.updateHobbyArticle(hobbyVo);
		
		// 리다이렉트 자기글로 가기
		return "redirect:/content/" + hobbyVo.getHobby_no();
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insert(Model model) throws Exception {
		List<CateVo> cates = cateService.getCateList();
		List<TimeVo> times = cateService.getTimeList();
		List<LevelVo> levels = cateService.getLevelList();
		List<CostVo> costs = cateService.getCostList();
		model.addAttribute("cates", JSONArray.fromObject(cates));
		model.addAttribute("times", JSONArray.fromObject(times));
		model.addAttribute("levels", JSONArray.fromObject(levels));
		model.addAttribute("costs", JSONArray.fromObject(costs));
		return "hobby/write_form";
	}
	
	@RequestMapping(value="/insertRun", method=RequestMethod.POST)
	public String insertRun(HobbyVo hobbyVo) throws Exception {
		System.out.println(hobbyVo);
		
		hobbyService.insertHobbyArticle(hobbyVo);
		return "redirect:/listAll";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public String hobbyList() throws Exception {
		return "hobby/hobby_list";
	}
	

	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test() throws Exception {
		return "hobby/test";
	}
	
	
}