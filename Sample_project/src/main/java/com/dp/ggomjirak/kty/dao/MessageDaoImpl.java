package com.dp.ggomjirak.kty.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.MessageVo;


@Repository
public class MessageDaoImpl implements MessageDao {
	
	private static final String NAMESPACE = "com.dp.ggomjirak.message.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertMessage(MessageVo messageVo) {
		sqlSession.insert(NAMESPACE + "insertMessage", messageVo);
	}

	@Override
	public int notReadCount(String msg_receiver) {
		int count = sqlSession.selectOne(NAMESPACE +"notReadCount", msg_receiver); 
		return count;
	}

	@Override
	public List<MessageVo> messageListnotRead(String msg_receiver) {
		List<MessageVo>	list = sqlSession.selectList(NAMESPACE + "messageListNotRead", msg_receiver);
		return list;
	}

	@Override
	public List<MessageVo> messageListReceive(String msg_receiver) {
		List<MessageVo>	list = sqlSession.selectList(NAMESPACE + "messageListReceive", msg_receiver);
		return list;
	}

	@Override
	public void updateOpenDate(int msg_no) {
		sqlSession.update(NAMESPACE + "updateOpenDate", msg_no);
	}

	@Override
	public MessageVo readMessage(int msg_no) {
		MessageVo messageVo = sqlSession.selectOne(
				NAMESPACE + "readMessage", msg_no);
		return messageVo;
	}

	@Override
	public Timestamp getOpendate(int msg_no) {
		Timestamp msg_opendate = sqlSession.selectOne(
				NAMESPACE+ "getOpenDate", msg_no);
		return msg_opendate;
	}

	@Override
	public boolean deleteMessage(int msg_no, String user_id) {
		Map<String, Object>	map = new HashMap<>();
		map.put("msg_no", msg_no);
		map.put("user_id", user_id);
		int count = sqlSession.delete(NAMESPACE + "deleteMessage", map);
		//sqlSession.delete(NAMESPACE + "deleteMessage", parameter);
		// ??? 
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<MessageVo> messageListSend(String msg_sender) {
		List<MessageVo>	list = sqlSession.selectList(NAMESPACE + "messageListSend", msg_sender);
		return list;
	}

}
