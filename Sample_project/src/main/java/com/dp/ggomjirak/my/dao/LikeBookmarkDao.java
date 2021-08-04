package com.dp.ggomjirak.my.dao;

public interface LikeBookmarkDao {
	// 좋아요 수 증가
	public void updateLikeCount(int hobby_no, int count);
	// 좋아요 테이블 
	public void insertLike(int hobby_no, String user_id);
	public void deleteLike(int hobby_no, String user_id);
	public int likeCheck(int hobby_no, String user_id);
	// 총 갯수
	public int likeAll(int hobby_no);
	
	// 북마크
	public void insertBookmark(int hobby_no, String user_id);
	public void deleteBookmark(int hobby_no, String user_id);
	public int bookmarkCheck(int hobby_no, String user_id);
	
}
