package com.dp.ggomjirak.kty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/cs_center")
public class CsCenterController {
	
	// 마이 페이지 - 문의 게시판 리스트
	@RequestMapping(value = "/consultList", method = RequestMethod.GET)
	public String consultList() throws Exception {
		return "/cs_center/consultList";
	}

	// 마이 페이지 - 문의하기 게시판 글쓰기
	@RequestMapping(value = "/consultQS", method = RequestMethod.GET)
	public String consultQS() throws Exception {
		return "/cs_center/consultQS";
	}

	// 마이 페이지 - 문의하기 글 내용 확인 수정
	@RequestMapping(value = "/consultQnA", method = RequestMethod.GET)
	public String consultQnA() throws Exception {
		return "/cs_center/consultQnA";
	}

}
