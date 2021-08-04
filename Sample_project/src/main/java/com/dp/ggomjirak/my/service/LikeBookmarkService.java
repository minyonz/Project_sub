package com.dp.ggomjirak.my.service;

public interface LikeBookmarkService {
	// 좋아요
	public boolean like(int hobby_no, String user_id);
	public int likeAll(int hobby_no);
	public int likeCheck(int hobby_no, String user_id);
	
	// 북마크
	public boolean bookmark(int hobby_no, String user_id);
	public int bookmarkCheck(int hobby_no, String user_id);
}
