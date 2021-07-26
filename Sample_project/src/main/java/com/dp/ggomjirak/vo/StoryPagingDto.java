package com.dp.ggomjirak.vo;

public class StoryPagingDto {
	// 현재페이지
	private int page = 1;
	// 화면에 표시될 페이지 수
	private int startRow = 1;
	private int endRow = 5;
	private int count;
	// 다음, 이전 페이지
	private int startPage;
	private int endPage;
	// 총 페이지 수(마지막 페이지 출력용)
	private int totalPage;
	
	// 한번에 볼 갯수
	private int perPage = 5;
	
	private final int PAGE_BLOCK = 5;
	
	// 유저아이디
	private String user_id;

	public StoryPagingDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoryPagingDto(int page, int startRow, int endRow, int count, int startPage, int endPage, int totalPage,
			int perPage, String user_id) {
		super();
		this.page = page;
		this.startRow = startRow;
		this.endRow = endRow;
		this.count = count;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.perPage = perPage;
		this.user_id = user_id;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		
		this.endRow = page * this.perPage;
		this.startRow = endRow - (this.perPage - 1);
		this.endPage = ((int)((page - 1) / PAGE_BLOCK) + 1) * PAGE_BLOCK;
		this.startPage = endPage - 4;
		
		this.totalPage = count / perPage;
		if (count % perPage != 0) {
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "StoryPagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", count=" + count
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage=" + totalPage + ", perPage="
				+ perPage + ", user_id=" + user_id + "]";
	}
	
}
