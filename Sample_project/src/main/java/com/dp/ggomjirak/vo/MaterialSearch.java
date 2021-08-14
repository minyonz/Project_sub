package com.dp.ggomjirak.vo;


public class MaterialSearch {
	private String user_id; //로그인한 아이디
	
	private int m_no;
	private String m_name;
	private String sort; // 최신,조회,댓글 
	private int time;
	private int level;
	private int cost;
	
	// 현재페이지
	private int page = 1;
	
	private int startRow = 1;
	private int endRow = 9;
	// 게시물 총 갯수
	private int count;
	
	// 다음, 이전 페이지
	private int startPage;
	private int endPage;
	
	// 총 페이지 수(마지막 페이지 출력용)
	private int totalPage;
	
	private int perPage = 9; // 한페이지에 보여줄 게시글 개수 
	private final int PAGE_BLOCK = 5; // 1 2 3 4 5 6 7.. 10 
	
	public MaterialSearch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
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
		this.startPage = endPage - (PAGE_BLOCK - 1);
		
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
	public int getPAGE_BLOCK() {
		return PAGE_BLOCK;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "MaterialSearch [user_id=" + user_id + ", m_no=" + m_no + ", m_name=" + m_name + ", sort=" + sort
				+ ", time=" + time + ", level=" + level + ", cost=" + cost + ", page=" + page + ", startRow=" + startRow
				+ ", endRow=" + endRow + ", count=" + count + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalPage=" + totalPage + ", perPage=" + perPage + ", PAGE_BLOCK=" + PAGE_BLOCK + "]";
	}
	
	
}
