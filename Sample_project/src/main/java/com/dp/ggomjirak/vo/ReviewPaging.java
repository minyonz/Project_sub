package com.dp.ggomjirak.vo;


public class ReviewPaging {
//	private String review_sort; // 최신,조회,댓글 
	
	private int hobby_no;
	private String review_level;
	
	// 현재페이지
	private int review_page = 1;
	
	// 게시물 총 갯수
	private int review_count;
	
	// 다음, 이전 페이지
	private int startPage;
	private int endPage;
	
	// 총 페이지 수(마지막 페이지 출력용)
	private int totalPage;
	
	private int perPage = 3; // 한페이지에 보여줄 게시글 개수 
	private int startRow = 1;
	private int endRow = 3;
	private final int PAGE_BLOCK = 5; // 1 2 3 4 5 6 7.. 10 
	
	public int getHobby_no() {
		return hobby_no;
	}
	public void setHobby_no(int hobby_no) {
		this.hobby_no = hobby_no;
	}
	public String getReview_level() {
		return review_level;
	}
	public void setReview_level(String review_level) {
		this.review_level = review_level;
	}
	public int getReview_page() {
		return review_page;
	}
	public void setReview_page(int review_page) {
		this.review_page = review_page;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
		
		this.endRow = review_page * this.perPage;
		this.startRow = endRow - (this.perPage - 1);
		this.endPage = ((int)((review_page - 1) / PAGE_BLOCK) + 1) * PAGE_BLOCK;
		this.startPage = endPage - (PAGE_BLOCK - 1);
		
		this.totalPage = review_count / perPage;
		if (review_count % perPage != 0) {
			this.totalPage += 1;
		}
		// 끝 페이지가 최대 페이지를 넘지 않도록 수식설정
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getPAGE_BLOCK() {
		return PAGE_BLOCK;
	}
	@Override
	public String toString() {
		return "ReviewPaging [hobby_no=" + hobby_no + ", review_level=" + review_level + ", review_page=" + review_page
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", review_count=" + review_count + ", startPage="
				+ startPage + ", endPage=" + endPage + ", totalPage=" + totalPage + ", perPage=" + perPage
				+ ", PAGE_BLOCK=" + PAGE_BLOCK + "]";
	}
	
	
	
	


}
