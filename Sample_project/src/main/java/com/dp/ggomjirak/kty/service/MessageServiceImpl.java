package com.dp.ggomjirak.kty.service;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dp.ggomjirak.kty.dao.MemberDao;
import com.dp.ggomjirak.kty.dao.MessageDao;
import com.dp.ggomjirak.vo.MessageVo;


@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDao messageDao;
	
	@Inject
	private MemberDao memberDao;
	
	@Transactional
	@Override
	public void sendMessage(MessageVo messageVo) {
		messageDao.insertMessage(messageVo);
	}

	@Override
	public int notReadCount(String msg_receiver) {
		return messageDao.notReadCount(msg_receiver);
	}

	@Override
	public List<MessageVo> messageListNotRead(String msg_receiver) {
		List<MessageVo> list = 
				messageDao.messageListnotRead(msg_receiver);
		return list;
	}

	@Override
	public List<MessageVo> messageListReceive(String msg_receiver) {
		List<MessageVo> list = 
				messageDao.messageListReceive(msg_receiver);
		return list;
	}

	@Transactional
	@Override
	public MessageVo messageRead(int msg_no, String user_id) {
		MessageVo messageVo = messageDao.readMessage(msg_no);
		Timestamp msg_opendate = messageVo.getMsg_opendate();
		// 읽지 않은 메시지를 읽은 경우에 할 작업
		if(msg_opendate == null) {
//			Calendar cal = Calendar.getInstance();
//			long millis = cal.getTimeInMillis();
//			Timestamp timestamp = new Timestamp(millis);
//			messageVo.setMsg_opendate(timestamp);
			
			messageDao.updateOpenDate(msg_no);
			msg_opendate = messageDao.getOpendate(msg_no);
			messageVo.setMsg_opendate(msg_opendate);
		}
		return messageVo;
	}

	@Override
	public boolean deleteMessage(int msg_no, String user_id) {
		boolean result = messageDao.deleteMessage(msg_no, user_id);
		return result;
	}

	@Override
	public List<MessageVo> messageListSend(String msg_sender) {
		List<MessageVo> list = 
				messageDao.messageListSend(msg_sender);
		return list;
	}

}
