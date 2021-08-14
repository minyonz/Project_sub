package com.dp.ggomjirak.kty.service;

import java.util.List;

import com.dp.ggomjirak.vo.MessageVo;


public interface MessageService {
	
	public void sendMessage(MessageVo messageVo);
	public int notReadCount(String msg_receiver);
	public List<MessageVo> messageListNotRead(String msg_receiver);
	public List<MessageVo> messageListReceive(String msg_receiver);
	public MessageVo messageRead(int msg_no, String user_id);
	public boolean deleteMessage(int msg_no, String user_id);
	public List<MessageVo> messageListSend(String msg_sender);
	
}
