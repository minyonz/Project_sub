package com.dp.ggomjirak.my.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dp.ggomjirak.jh.service.MainService;
import com.dp.ggomjirak.my.service.FollowService;
import com.dp.ggomjirak.my.service.StoryService;
import com.dp.ggomjirak.my.service.WorkroomService;
import com.dp.ggomjirak.my.service.WorkroomSetService;
import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.FollowVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.LikeBookmarkVo;
import com.dp.ggomjirak.vo.MadeByMeVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.StoryPagingDto;
import com.dp.ggomjirak.vo.StoryVo;
import com.dp.ggomjirak.vo.WorkroomVo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/workroom")
public class WorkroomController {
	
	@Inject
	private StoryService storyService;
	
	@Inject
	private WorkroomService workroomService;
	
	@Inject
	private WorkroomSetService workroomSetService;
	
	@Inject
	private FollowService followService;
	
	@Inject
	private MainService mainService;
	
	// 카테고리 공통 메서드
	public void category(Model model) throws Exception {
		List<CateVo> category = mainService.selectCate();
		model.addAttribute("cates", JSONArray.fromObject(category));
	}
	
	// 카드 프로필 값 공통 메서드
	public void profileCommon(String page_id, Model model, HttpSession session) throws Exception {
		// 프로필 카드 정보, 작업실 정보(작업실 이름, 소개)
		MemberVo memberInfo = workroomService.getMemInfo(page_id);
		WorkroomVo workroomVo = workroomSetService.getWrSet(page_id);
		String user_id = null;
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("workroomVo", workroomVo);
		model.addAttribute("page_id", page_id);
		model.addAttribute("user_id", user_id);
		// 로그인 안 한 사용자가 작업실 들어갈 경우
		if (session.getAttribute("loginVo") != null) {
			// 유저 정보 가져오기
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			user_id = memberVo.getUser_id();
			System.out.println("user_id:" + user_id);
			// 팔로잉 정보 받아올 때 로그인한 사용자 정보 & 현재 페이지 사용자 정보를 followVo에 설정
			FollowVo followVo = new FollowVo();
			// 현재 페이지의 사용자
			followVo.setFollowing(page_id);
			// 현재 로그인한 사용자
			followVo.setFollower(user_id);
			int checkFollow = followService.checkFollow(followVo);
			
			model.addAttribute("user_id", user_id);
			model.addAttribute("checkFollow", checkFollow);			
		} 
	}
	
	// 작업실 메인
	@RequestMapping(value="/main/{user_id}", method=RequestMethod.GET)
	public String wrMain(@PathVariable("user_id") String page_id, Model model, StoryPagingDto storyPagingDto, PagingDto pagingDto, HttpSession session) throws Exception {
		// page_id = user_id가 같은 경우에만 팔로우, 설정, 글쓰기 가능하게
		// 스토리 목록
		storyPagingDto.setUser_id(page_id);
		List<StoryVo> storyList = storyService.StoryList(storyPagingDto);
		pagingDto.setUser_id(page_id);
		// 취미 목록
		List<HobbyVo> hobbyList = workroomService.listHobby(pagingDto);
		// 북마크 목록
		List<LikeBookmarkVo> bmList = workroomService.listBookmark(pagingDto);
		// 메이드바이미
		List<MadeByMeVo> mbmList = workroomService.listMbm(pagingDto);
		
		int bookmarkCount = workroomService.bookmarkCount(page_id);
		int hobbyCount = workroomService.hobbyCount(page_id);
		
		// 카드 프로필 값 공통 메서드 보내줌
		profileCommon(page_id, model, session);
		category(model);			
		model.addAttribute("bookmarkCount", bookmarkCount);
		model.addAttribute("hobbyCount", hobbyCount);
		model.addAttribute("storyList", storyList);
		model.addAttribute("hobbyList", hobbyList);
		model.addAttribute("bmList", bmList);
		model.addAttribute("mbmList", mbmList);
		return "workroom/wr_main";
	}	
	
	// 취미
	@RequestMapping(value="/hobby/{user_id}", method=RequestMethod.GET)
	public String wrHobby(@PathVariable("user_id") String page_id, Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		int count = workroomService.hobbyCount(page_id);
		pagingDto.setCount(count);
		pagingDto.setUser_id(page_id);
		List<HobbyVo> hobbyList = workroomService.listHobby(pagingDto);
		// 프로필 카드용
		profileCommon(page_id, model, session);
		category(model);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("hobbyList", hobbyList);
		return "workroom/wr_hobby";
	}
	
	// 북마크
	@RequestMapping(value="/bookmark/{user_id}", method=RequestMethod.GET)
	public String wrBookmark(@PathVariable("user_id")String page_id, Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		int count = workroomService.bookmarkCount(page_id);
		pagingDto.setCount(count);
		pagingDto.setUser_id(page_id);
		List<LikeBookmarkVo> bmList = workroomService.listBookmark(pagingDto);
		profileCommon(page_id, model, session);
		category(model);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("bmList", bmList);
		return "workroom/wr_bookmark";
	}
	
	// 메이드바이미
	@RequestMapping(value="/mbm/{user_id}", method=RequestMethod.GET)
	public String wrMbm(@PathVariable("user_id") String page_id, Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		int count = workroomService.mbmCount(page_id);
		pagingDto.setCount(count);
		pagingDto.setUser_id(page_id);
		List<MadeByMeVo> mbmList = workroomService.listMbm(pagingDto);
		profileCommon(page_id, model, session);
		category(model);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("mbmList", mbmList);
		return "workroom/wr_mbm";
	}
		
	// 검색
	@RequestMapping(value="/search/{user_id}", method=RequestMethod.GET)
	public String wrSearch(@PathVariable("user_id") String page_id, String keyword, Model model, PagingDto pagingDto, HttpSession session) throws Exception {
		pagingDto.setKeyword(keyword);
		pagingDto.setUser_id(page_id);
		int hobbyCount = workroomService.searchHobbyCount(pagingDto);
		int storyCount = workroomService.searchStoryCount(pagingDto);
		int mbmCount = workroomService.searchMbmCount(pagingDto);
		int[] arr = {hobbyCount, storyCount, mbmCount};
		int count = arr[0];
		for (int num : arr) {
			if (num > count) {
				count = num;
			}
		}
		System.out.println(count);
		pagingDto.setCount(count);
		List<HobbyVo> searchHobbyList = workroomService.searchHobby(pagingDto);
		List<StoryVo> searchStoryList = workroomService.searchStory(pagingDto);
		List<MadeByMeVo> searchMbmList = workroomService.searchMbm(pagingDto);
		profileCommon(page_id, model, session);
		category(model);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("searchHobbyList", searchHobbyList);
		model.addAttribute("searchStoryList", searchStoryList);
		model.addAttribute("searchMbmList", searchMbmList);
		model.addAttribute("keyword", keyword);
		return "workroom/wr_search";
	}
	
	// 팔로우
	@RequestMapping(value="/follow/{user_id}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> follow(@PathVariable("user_id") String page_user, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		FollowVo followVo = new FollowVo();
		// 팔로우 당하는 사람(현재 페이지 유저)
		followVo.setFollowing(page_user);
		// 팔로우 하는 사람(현재 로그인 유저)
		followVo.setFollower(user_id);
		boolean result = followService.follow(followVo);
		int countFollow = followService.countFollower(page_user);
		Map<String, Object> map = new HashMap<>();
		map.put("countFollow", countFollow);
		if (result == true) {
			map.put("follow", "follow");
			return map;
		} 
		map.put("unFollow", "unFollow");
		return map;
	}


}





