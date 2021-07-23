package com.dp.ggomjirak.jh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dp.ggomjirak.jh.service.MainService;
import com.dp.ggomjirak.vo.HobbyVo;

@Controller
@RequestMapping("main")
public class MainController {
	
	@Inject
	private MainService mainService;

	@RequestMapping(value="/mainHome", method=RequestMethod.GET)
	public String mainHome(Model model) throws Exception {
		List<HobbyVo> popularHobby = mainService.getPopularHobbyList();
		List<HobbyVo> monthHobby = mainService.getMonthHobbyList();
		model.addAttribute("popularHobby", popularHobby);
		model.addAttribute("monthHobby", monthHobby);
		return "main/main_home";
	}
	
	@RequestMapping(value="/mainHobby", method=RequestMethod.GET)
	public String mainHobby(Model model) throws Exception {
		List<HobbyVo> popularHobby = mainService.getPopularHobbyList();
		model.addAttribute("popularHobby", popularHobby);
		return "main/main_hobby";
	}
	
	@RequestMapping(value="/mainEvent", method=RequestMethod.GET)
	public String mainEvent() throws Exception {
		return "main/main_event";
	}
	
	@RequestMapping(value="/mainEventContent", method=RequestMethod.GET)
	public String mainEventContent() throws Exception {
		return "main/main_event_content";
	}
	
	@RequestMapping(value="/mainAboutUs", method=RequestMethod.GET)
	public String mainAboutUs() throws Exception {
		return "main/main_about_us";
	}
	
	@RequestMapping(value="/mainSearch", method=RequestMethod.GET)
	public String mainSearch() throws Exception {
		return "main/main_search";
	}
}
