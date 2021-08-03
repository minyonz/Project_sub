package com.dp.ggomjirak;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MaterialVo;
import com.dp.ggomjirak.yj.dao.CateDao;
import com.dp.ggomjirak.yj.dao.HobbyDao;
import com.dp.ggomjirak.yj.dao.MaterialDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CateDaoTest {
	
	@Inject
	private CateDao cateDao;
	
	
	@Test
	public void testCateDao() {
		
		List<CateVo> cates = cateDao.getCateList();
		System.out.println(cates);
	}
	
	
}
