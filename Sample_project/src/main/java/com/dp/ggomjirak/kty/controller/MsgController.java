package com.dp.ggomjirak.kty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/message")
public class MsgController {
	// 쪽지 - 받은 메시지 목록
	@RequestMapping(value = "/ListReceiveMsg", method = RequestMethod.GET)
	public String messageListReceive() throws Exception {
		return "/message/message_receive_list";
	}

	// 쪽지 - 메시지 답장하기 ?
	@RequestMapping(value = "/ReadMsg", method = RequestMethod.GET)
	public String messageRead() throws Exception {
		return "/message/message_read";
	}

//		// 쪽지 보내기
//		// message/sendMessage
//		@RequestMapping(value="/message/sendMsg", method=RequestMethod.POST)
//		@ResponseBody
//		public String sendMessage(@RequestBody MessageVo messageVo,
//				HttpSession session) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			messageVo.setMsg_sender(memberVo.getUser_id());
//			System.out.println("message:" + messageVo);
//			messageService.sendMessage(messageVo);
//			return "success";
//			
//		}
	//
//		// 팀 프로젝트에 추가 -  읽지 않은 메시지 목록
//		@RequestMapping(value="/message/ListNotReadMsg", method=RequestMethod.GET)
//		@ResponseBody
//		public List<MessageVo> messageListNotRead(HttpSession session) 
//				throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			List<MessageVo> list = 
//					messageService.messageListNotRead(memberVo.getUser_id());
//			messageService.messageListNotRead("kim");
//			return list;
//		}
	//
//		// 팀 프로젝트에 추가 - 받은 메시지 목록
//		@RequestMapping(value="/message/ListReceiveMsg", method=RequestMethod.GET)
//		public String messageListReceive(HttpSession session, Model model) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			String msg_receiver = memberVo.getUser_id();
//			List<MessageVo>	list =
//					messageService.messageListReceive(msg_receiver);
//			model.addAttribute("list", list);
//			return "message/message_receive_list";
//		}
	//
//		// 팀 프로젝트에 추가 - 읽은 메시지?
//		@RequestMapping(value="/message/ReadMsg", method=RequestMethod.GET)
//		public String messageRead(int msg_no, HttpSession session, Model model) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			String user_id = memberVo.getUser_id();
//			MessageVo messageVo = messageService.messageRead(msg_no, user_id);
//			model.addAttribute("messageVo", messageVo);
//			// memberVo.setNotReadcount(memberVo.getNotReadcount() -1);
//			int notReadCount = messageService.notReadCount(user_id);
//			int user_point = memberService.getUserPoint(user_id);
//			memberVo.setNotReadCount(notReadCount);
//			memberVo.setUser_point(user_point);
//			return "message/message_read";
//		}
	//
//		// 팀 프로젝트에 추가 - 쪽지 삭제
//		@RequestMapping(value="/message/deleteMsg", method=RequestMethod.GET)
//		public String deleteMessage(int msg_no, HttpSession session, RedirectAttributes rttr) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			String user_id = memberVo.getUser_id();  // ???
//			boolean result = messageService.deleteMessage(msg_no, user_id);
//			rttr.addFlashAttribute("msg_delete", String.valueOf(result));
//			return "redirect:/message/messageListReceive";
//		}
//		// 쪽지 보내기
//		// message/sendMessage
//		@RequestMapping(value="/message/sendMsg", method=RequestMethod.POST)
//		@ResponseBody
//		public String sendMessage(@RequestBody MessageVo messageVo,
//				HttpSession session) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			messageVo.setMsg_sender(memberVo.getUser_id());
//			System.out.println("message:" + messageVo);
//			messageService.sendMessage(messageVo);
//			return "success";
//			
//		}
	//
//		// 팀 프로젝트에 추가 -  읽지 않은 메시지 목록
//		@RequestMapping(value="/message/ListNotReadMsg", method=RequestMethod.GET)
//		@ResponseBody
//		public List<MessageVo> messageListNotRead(HttpSession session) 
//				throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			List<MessageVo> list = 
//					messageService.messageListNotRead(memberVo.getUser_id());
//			messageService.messageListNotRead("kim");
//			return list;
//		}
	//
//		// 팀 프로젝트에 추가 - 받은 메시지 목록
//		@RequestMapping(value="/message/ListReceiveMsg", method=RequestMethod.GET)
//		public String messageListReceive(HttpSession session, Model model) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			String msg_receiver = memberVo.getUser_id();
//			List<MessageVo>	list =
//					messageService.messageListReceive(msg_receiver);
//			model.addAttribute("list", list);
//			return "message/message_receive_list";
//		}
	//
//		// 팀 프로젝트에 추가 - 읽은 메시지?
//		@RequestMapping(value="/message/ReadMsg", method=RequestMethod.GET)
//		public String messageRead(int msg_no, HttpSession session, Model model) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			String user_id = memberVo.getUser_id();
//			MessageVo messageVo = messageService.messageRead(msg_no, user_id);
//			model.addAttribute("messageVo", messageVo);
//			// memberVo.setNotReadcount(memberVo.getNotReadcount() -1);
//			int notReadCount = messageService.notReadCount(user_id);
//			int user_point = memberService.getUserPoint(user_id);
//			memberVo.setNotReadCount(notReadCount);
//			memberVo.setUser_point(user_point);
//			return "message/message_read";
//		}
	//
//		// 팀 프로젝트에 추가 - 쪽지 삭제
//		@RequestMapping(value="/message/deleteMsg", method=RequestMethod.GET)
//		public String deleteMessage(int msg_no, HttpSession session, RedirectAttributes rttr) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			String user_id = memberVo.getUser_id();  // ???
//			boolean result = messageService.deleteMessage(msg_no, user_id);
//			rttr.addFlashAttribute("msg_delete", String.valueOf(result));
//			return "redirect:/message/messageListReceive";
//		}
}
