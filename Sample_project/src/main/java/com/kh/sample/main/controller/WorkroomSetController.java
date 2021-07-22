package com.kh.sample.main.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sample.main.service.WorkroomSetService;
import com.kh.sample.main.vo.WorkroomVo;

@Controller
@RequestMapping(value="/workroomset")
public class WorkroomSetController {

	@Inject
	WorkroomSetService workroomSetService;
	
	// 작업실 설정 메인
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String wrSetting(Model model) throws Exception {
		WorkroomVo workroomVo = workroomSetService.getWrSet("cat");
		model.addAttribute("workroomVo", workroomVo);
		return "workroom/wr_setting";
	}
	
	// 작업실 이름 수정
	@RequestMapping(value="/nameSet", method=RequestMethod.POST)
	@ResponseBody
	public String wrNameSet(WorkroomVo workroomVo) throws Exception {
		workroomSetService.updateWrName(workroomVo);
		String wr_name = workroomVo.getWr_name();
		return "nameSuccess";
	}
	
	@RequestMapping(value="/introSet", method=RequestMethod.POST)
	@ResponseBody
	public String wrIntroSet(String wr_intro, String user_id) throws Exception {
		workroomSetService.updateWrIntro(user_id, wr_intro);
		return "introSuccess";
	}
}
















