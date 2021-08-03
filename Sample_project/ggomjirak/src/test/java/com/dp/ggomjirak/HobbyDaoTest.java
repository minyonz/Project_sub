package com.dp.ggomjirak;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;

import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MakeStepVo;
import com.dp.ggomjirak.vo.MaterialVo;
import com.dp.ggomjirak.yj.dao.HobbyDao;
import com.dp.ggomjirak.yj.dao.MaterialDao;
import com.dp.ggomjirak.yj.util.MyFileUploadUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class HobbyDaoTest {
	
	@Inject
	private HobbyDao hobbyDao;
	
	@Inject
	private MaterialDao materialDao;
	
	
	@Test
	public void testSelectHobbyByVo() {
	}
	
	@Test
	public void testSelectHobbyByHobbyNo() {
		int hobby_no = 1;
		HobbyVo h = hobbyDao.selectHobby(hobby_no);
		List<HobbyMaterialVo> hobbyMaterials = hobbyDao.selectHobbyMaterialList(hobby_no);
		List<MakeStepVo> makeSteps = hobbyDao.selectMakeStepList(hobby_no);
		h.setHobbyMaterials(hobbyMaterials);
		h.setMakeSteps(makeSteps);
		System.out.println(h);
	}
	
	@Test
	public void testUpdateMakeSteps() {
		int hobby_no = 27;
		HobbyVo h = hobbyDao.selectHobby(hobby_no);
		List<MakeStepVo> makeSteps = hobbyDao.selectMakeStepList(hobby_no);
//		List<MakeStepVo> makeSteps = new ArrayList<>();
		System.out.println(makeSteps);
		
	}
}
