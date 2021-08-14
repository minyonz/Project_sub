package com.dp.ggomjirak.kty.dao;

import java.sql.Timestamp;
import java.util.List;

import com.dp.ggomjirak.vo.MessageVo;


public interface MessageDao {

	public void insertMessage(MessageVo messageVo);
	public int notReadCount(String msg_receiver);
	public List<MessageVo> messageListnotRead(String msg_receiver);
	public List<MessageVo> messageListReceive(String msg_receiver);
	public void updateOpenDate(int msg_no);
	public MessageVo readMessage(int msg_no);
	public Timestamp getOpendate(int msg_no);
	public boolean deleteMessage(int msg_no, String user_id);
	public List<MessageVo> messageListSend(String msg_sender);
}
