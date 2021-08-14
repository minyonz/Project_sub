package com.dp.ggomjirak.kty.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dp.ggomjirak.kty.service.MessageService;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.MessageVo;
import com.dp.ggomjirak.vo.QnAVo;


@Controller
@RequestMapping("/message")
public class MsgController {
	
	@Inject
	private MessageService messageService;

	// 쪽지 보내기
	// message/sendMessage
	@RequestMapping(value="/sendMessage", method=RequestMethod.POST)
	@ResponseBody
	public String sendMessage(@RequestBody MessageVo messageVo,
			HttpSession session) throws Exception {
		System.out.println("비동기 요청 쪽지 보내기 들어옴");
		if(session.getAttribute("loginVo") != null) {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			messageVo.setMsg_sender(memberVo.getUser_id());
			System.out.println("message:" + messageVo);
			messageService.sendMessage(messageVo);
		}
		return "success";
	}
	
	// 읽지 않은 메시지 목록
	@ResponseBody
	@RequestMapping(value="/messageListNotRead", method=RequestMethod.GET)
	public List<MessageVo> messageListNotRead(HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		List<MessageVo> list = messageService.messageListNotRead(memberVo.getUser_id());
		return list;
	}
	
	// 받은 메시지 목록
	@RequestMapping(value="/messageListReceive", method=RequestMethod.GET)
	public String messageListReceive(HttpSession session, Model model) throws Exception {
		System.out.println("받은 메시지 목록 들어옴");
		if(session.getAttribute("loginVo") != null) {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			String msg_receiver = memberVo.getUser_id();
			String user_id = msg_receiver;
			List<MessageVo>	list =
				messageService.messageListReceive(msg_receiver);
			model.addAttribute("list", list);
			model.addAttribute("user_id", user_id);
		}
		return "message/message_receive_list";
	}
	
	// 보낸 메시지 목록
	@RequestMapping(value="/messageListSend", method=RequestMethod.GET)
	public String messageListSend(HttpSession session, Model model) throws Exception {
		System.out.println("보낸 메시지 목록 들어옴");
		if (session.getAttribute("loginVo") != null) {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			String msg_sender = memberVo.getUser_id();
			System.out.println("msg_sender: " + msg_sender);
			String user_id = msg_sender;
			List<MessageVo>	list =
					messageService.messageListSend(msg_sender);
			model.addAttribute("list", list);
			model.addAttribute("user_id", user_id);
		}
		return "message/message_send_list";
	}
	
	// 읽은 메시지?
	@RequestMapping(value="/messageRead", method=RequestMethod.GET)
	public String messageRead(int msg_no, HttpSession session, Model model) throws Exception {
		if (session.getAttribute("loginVo") != null) {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			String user_id = memberVo.getUser_id();
			MessageVo messageVo = messageService.messageRead(msg_no, user_id);
			model.addAttribute("messageVo", messageVo);
			model.addAttribute("user_id", user_id);
			int notReadCount = messageService.notReadCount(user_id);
			memberVo.setNotReadCount(notReadCount);
		}
		return "message/message_read";
	}
	
	// 쪽지 삭제
	@RequestMapping(value="/deleteMessage", method=RequestMethod.GET)
	public String deleteMessage(int msg_no, HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		if (session.getAttribute("loginVo") != null) {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			String user_id = memberVo.getUser_id();  // ???
			boolean result = messageService.deleteMessage(msg_no, user_id);
			rttr.addFlashAttribute("msg_delete", String.valueOf(result));
			model.addAttribute("user_id", user_id);
		}
		return "redirect:/message/messageListReceive";
	}
}
