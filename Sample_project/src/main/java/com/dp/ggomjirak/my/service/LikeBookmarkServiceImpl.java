package com.dp.ggomjirak.my.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dp.ggomjirak.my.dao.LikeBookmarkDao;

@Service
public class LikeBookmarkServiceImpl implements LikeBookmarkService {

	@Inject
	LikeBookmarkDao likebmDao;
	
	// 좋아요
	@Transactional
	@Override
	public boolean like(int hobby_no, String user_id) {
		int count = likebmDao.likeCheck(hobby_no, user_id);
		if (count <= 0) {
			likebmDao.insertLike(hobby_no, user_id);
			likebmDao.updateLikeCount(hobby_no, 1);
			return true;
		} else if (count > 0){
			likebmDao.deleteLike(hobby_no, user_id);
			likebmDao.updateLikeCount(hobby_no, -1);
		}
		return false;
	}

	@Override
	public int likeAll(int hobby_no) {
		int likeCount = likebmDao.likeAll(hobby_no);
		return likeCount;
	}

	@Override
	public int likeCheck(int hobby_no, String user_id) {
		int count = likebmDao.likeCheck(hobby_no, user_id);
		return count;
	}

	@Override
	public boolean bookmark(int hobby_no, String user_id) {
		int bmCheck = likebmDao.bookmarkCheck(hobby_no, user_id);
		System.out.println(bmCheck);
		if (bmCheck <= 0) {
			likebmDao.insertBookmark(hobby_no, user_id);
			return true;
		} else if (bmCheck > 0) {
			likebmDao.deleteBookmark(hobby_no, user_id);
		}
		return false;
	}

	@Override
	public int bookmarkCheck(int hobby_no, String user_id) {
		int count = likebmDao.bookmarkCheck(hobby_no, user_id);
		return count;
	}
	
	

}
