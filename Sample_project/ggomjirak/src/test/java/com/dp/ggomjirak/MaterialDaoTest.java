package com.dp.ggomjirak;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MaterialVo;
import com.dp.ggomjirak.yj.dao.HobbyDao;
import com.dp.ggomjirak.yj.dao.MaterialDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MaterialDaoTest {
	
	@Inject
	private MaterialDao materialDao;
	
	@Inject
	private HobbyDao hobbyDao;
	
	@Test
	public void testInsertMaterial() {
		// material 테이블 처리
//		List<MaterialVo> materialVos = new ArrayList<MaterialVo>();
//		for (int i = 1; i <= 14; i++) {
//			MaterialVo materialVo = new MaterialVo("준비물" + i);
//			materialVos.add(materialVo);
//		}
//		materialVos.add(new MaterialVo("레진"));
//		materialDao.insertMaterial(materialVos);
		// * 준비물 작업 
		
				List<HobbyMaterialVo> hobbyMaterials = new ArrayList<>();
				hobbyMaterials.add(new HobbyMaterialVo("설명", 1, "준비물"));
				hobbyMaterials.add(new HobbyMaterialVo("설명", 2, "ㅎ"));
				// material 테이블 insert 작업
				for (HobbyMaterialVo hobbyMaterialVo : hobbyMaterials) {
					String materialName = hobbyMaterialVo.getMaterialName();
					materialDao.insertMaterial(materialName);
				}
				// hobby_material 테이블 insert 작업
				for (HobbyMaterialVo hobbyMaterialVo : hobbyMaterials) {
					// hobby_material에 넣을 fk인 material_name 구하기 위해 (vo로 한거는 혹시나 필드 추가될까봐)
//					MaterialVo materialVo = materialDao.getMaterialVo(hobbyMaterialVo.getMaterialName());
					int material_no = materialDao.getMaterialNo(hobbyMaterialVo.getMaterialName());
					//material_no 세팅
					hobbyMaterialVo.setMaterial_no(material_no);
					// hobby_no 세팅
					hobbyMaterialVo.setHobby_no(53);
				}
				System.out.println("hobbyMaterials:" + hobbyMaterials);
				hobbyDao.insertHobbyMaterial(hobbyMaterials);
	}
	
	@Test
	public void testInsertMaterial2() {
		MaterialVo materialVo = new MaterialVo("레진");
	}
	
	@Test
	public void testgetMaterialVo() {
		// material 테이블 처리
		MaterialVo materialVo = materialDao.getMaterialVo("비즈");
		System.out.println(materialVo);
	}
	
}
