package com.dp.ggomjirak.my.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dp.ggomjirak.my.service.FollowService;
import com.dp.ggomjirak.my.service.StoryService;
import com.dp.ggomjirak.my.service.WorkroomService;
import com.dp.ggomjirak.my.service.WorkroomSetService;
import com.dp.ggomjirak.vo.FollowVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.StoryVo;
import com.dp.ggomjirak.vo.WorkroomVo;

@Controller
@RequestMapping(value="/workroom")
public class WorkroomController {
	
	@Inject
	StoryService storyService;
	
	@Inject
	WorkroomService workroomService;
	
	@Inject
	WorkroomSetService workroomSetService;
	
	@Inject
	FollowService followService;
	

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String wrMain(Model model) throws Exception {
		// 스토리 목록
		List<StoryVo> storyList = storyService.StoryList("cat");
		// 취미 목록
		List<HobbyVo> hobbyList = workroomService.listHobby("cat");
		// 프로필 카드 정보, 작업실 정보(작업실 이름, 소개)
		MemberVo memberVo = workroomService.getMemInfo("cat");
		WorkroomVo workroomVo = workroomSetService.getWrSet("cat");
		// 팔로잉 정보 받아올 때 로그인한 사용자 정보 & 현재 페이지 사용자 정보를 followVo에 설정
		FollowVo followVo = new FollowVo();
		// 현재 페이지의 사용자
		followVo.setFollowing("cat");
		// 현재 로그인한 사용자
		followVo.setFollower("duck");
		int checkFollow = followService.checkFollow(followVo);
		model.addAttribute("storyList", storyList);
		model.addAttribute("hobbyList", hobbyList);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("workroomVo", workroomVo);
		model.addAttribute("checkFollow", checkFollow);
		return "workroom/wr_main";
	}
	
	@RequestMapping(value="/hobby", method=RequestMethod.GET)
	public String wrHobby(Model model) throws Exception {
		// 프로필 카드용
		MemberVo memberVo = workroomService.getMemInfo("cat");
		WorkroomVo workroomVo = workroomSetService.getWrSet("cat");
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("workroomVo", workroomVo);
		return "workroom/wr_hobby";
	}
	
	@RequestMapping(value="/mbm", method=RequestMethod.GET)
	public String wrMbm() throws Exception {
		return "workroom/wr_mbm";
	}
		
	// 검색
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String wrSearch(String txtStSearch, Model model) throws Exception {
		System.out.println(txtStSearch);
		model.addAttribute("txtStSearch", txtStSearch);
		return "workroom/wr_search";
	}
	
	// 팔로우
	@RequestMapping(value="/follow/{user_id}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> follow(@PathVariable("user_id") String user_id) throws Exception {
		FollowVo followVo = new FollowVo();
		followVo.setFollowing(user_id);
		followVo.setFollower("duck");
		boolean result = followService.follow(followVo);
		int countFollow = followService.countFollower(user_id);
		Map<String, Object> map = new HashMap<>();
		if (result == true) {
			map.put("follow", "follow");
			map.put("countFollow", countFollow);
			return map;
		}
		return null;
	}
	
	// 언팔로우
	@RequestMapping(value="/unFollow/{user_id}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> unFollow(@PathVariable("user_id") String user_id) throws Exception {
		FollowVo followVo = new FollowVo();
		followVo.setFollowing(user_id);
		followVo.setFollower("duck");
		boolean result = followService.unFollow(followVo);
		int countFollowCancel = followService.countFollower(user_id);
		Map<String, Object> map = new HashMap<>();
		if (result == true) {
			map.put("unFollow", "unFollow");
			map.put("countFollow", countFollowCancel);
		}
		return map;
	}

}




















