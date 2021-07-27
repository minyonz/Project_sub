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
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.StoryPagingDto;
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
	

	// 카드 프로필 값 공통 메서드
	public void profileCommon(Model model) throws Exception {
		MemberVo memberVo = workroomService.getMemInfo("cat");
		WorkroomVo workroomVo = workroomSetService.getWrSet("cat");
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("workroomVo", workroomVo);
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String wrMain(Model model, StoryPagingDto storyPagingDto, PagingDto pagingDto) throws Exception {
		// 스토리 목록
		storyPagingDto.setUser_id("cat");
		List<StoryVo> storyList = storyService.StoryList(storyPagingDto);
		pagingDto.setHobby_writer("cat");
		
//		System.out.println("storyList:" + storyList);
		// 취미 목록
		List<HobbyVo> hobbyList = workroomService.listHobby(pagingDto);
		// 프로필 카드 정보, 작업실 정보(작업실 이름, 소개)
		// 팔로잉 정보 받아올 때 로그인한 사용자 정보 & 현재 페이지 사용자 정보를 followVo에 설정
		FollowVo followVo = new FollowVo();
		// 현재 페이지의 사용자
		followVo.setFollowing("cat");
		// 현재 로그인한 사용자
		followVo.setFollower("duck");
		int checkFollow = followService.checkFollow(followVo);
		// 카드 프로필 값 공통 메서드 보내줌
		profileCommon(model);
		model.addAttribute("storyList", storyList);
		model.addAttribute("hobbyList", hobbyList);
		model.addAttribute("checkFollow", checkFollow);
		return "workroom/wr_main";
	}	
	
	@RequestMapping(value="/hobby", method=RequestMethod.GET)
	public String wrHobby(Model model, PagingDto pagingDto) throws Exception {
		// pagingDto값 받고 sesseion값으로 아이디 설정 후 넘겨줌
		int count = workroomService.hobbyCount("cat");
		pagingDto.setCount(count);
		pagingDto.setHobby_writer("cat");
		List<HobbyVo> hobbyList = workroomService.listHobby(pagingDto);
		// 프로필 카드용
		profileCommon(model);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("hobbyList", hobbyList);
		return "workroom/wr_hobby";
	}
	
	@RequestMapping(value="/mbm", method=RequestMethod.GET)
	public String wrMbm(Model model) throws Exception {
		profileCommon(model);
		return "workroom/wr_mbm";
	}
		
	// 검색
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String wrSearch(String keyword, Model model, PagingDto pagingDto) throws Exception {
		System.out.println(keyword);
		pagingDto.setKeyword(keyword);
		pagingDto.setUser_id("cat");
		pagingDto.setHobby_writer("cat");
		List<HobbyVo> searchHobbyList = workroomService.searchHobby(pagingDto);
		List<StoryVo> searchStoryList = workroomService.searchStory(pagingDto);
		profileCommon(model);
		model.addAttribute("searchHobbyList", searchHobbyList);
		model.addAttribute("searchStoryList", searchStoryList);
		model.addAttribute("keyword", keyword);
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
		// 팔로워 수 보냄
		map.put("countFollow", countFollow);
		if (result == true) {
			map.put("follow", "follow");
			return map;
		} 
		map.put("unFollow", "unFollow");
		return map;
	}


}




















