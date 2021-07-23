package com.dp.ggomjirak.kty.dao;

import java.util.List;

import com.dp.ggomjirak.vo.CateVo;

public interface CateDao {
	// 취미 카테고리 목록 불러오기
	public List<CateVo> listAll();

	public List<CateVo> listPart(int parent_cate_no);
}
