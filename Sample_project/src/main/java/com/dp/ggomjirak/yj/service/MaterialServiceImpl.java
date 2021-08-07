package com.dp.ggomjirak.yj.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MaterialSearch;
import com.dp.ggomjirak.vo.MaterialVo;
import com.dp.ggomjirak.yj.dao.MaterialDao;

@Service
public class MaterialServiceImpl implements MaterialService {

	@Inject 
	private MaterialDao materialDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MaterialServiceImpl.class);
	
	@Transactional
	@Override
	public List<HobbyVo> selectHMList(MaterialSearch materialSearch) {
		int count = materialDao.getCountHMList(materialSearch); // m_no에 해당하는 준비물들 총개수 
		materialSearch.setCount(count); // 페이징관련된 필드 세팅 
		MaterialVo materialVo = materialDao.getMaterialVoByNo(materialSearch.getM_no());
		materialSearch.setM_name(materialVo.getMaterial_name()); // ms에 준비물이름 세팅
		logger.info("service");
		System.out.println(materialSearch);
		return materialDao.selectHMList(materialSearch);
	}

}
