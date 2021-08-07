package com.dp.ggomjirak.my.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dp.ggomjirak.my.dao.MadeByMeDao;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MadeByMeVo;

@Service
public class MadeByMeServiceImpl implements MadeByMeService {

	@Inject
	MadeByMeDao madebymeDao;
	
	@Override
	public void mbmWrite(MadeByMeVo madebymeVo) {
		madebymeDao.insertMbm(madebymeVo);
	}

	@Override
	public HobbyVo selectHobby(int hobby_no) {
		HobbyVo hobbyVo = madebymeDao.selectHobby(hobby_no);
		return hobbyVo;
	}

	@Override
	@Transactional
	public MadeByMeVo selectMbm(int mbm_no, int hobby_no) {
		MadeByMeVo madebymeVo = madebymeDao.selectMbm(mbm_no, hobby_no);
		madebymeDao.updateViewCnt(mbm_no);
		return madebymeVo;
	}

	@Override
	public void updateMbm(MadeByMeVo madebymeVo) {
		madebymeDao.updateMbm(madebymeVo);
	}
	
	@Override
	public List<MadeByMeVo> listMbm(int hobby_no) {
		List<MadeByMeVo> madebymeVo = madebymeDao.listMbm(hobby_no);
		return madebymeVo;
	}

	@Override
	public boolean like(int mbm_no, String user_id) {
		int count = madebymeDao.likeCheck(mbm_no, user_id);
		System.out.println("service count:" + count);
		if (count <= 0) {
			madebymeDao.insertLike(mbm_no, user_id);
			madebymeDao.updateLikeCount(mbm_no, 1);
			return true;
		} else if (count > 0){
			madebymeDao.deleteLike(mbm_no, user_id);
			madebymeDao.updateLikeCount(mbm_no, -1);
		}
		return false;
	}

	@Override
	public int likeAll(int mbm_no) {
		int likeCount = madebymeDao.likeAll(mbm_no);
		return likeCount;
	}

	@Override
	public int likeCheck(int mbm_no, String user_id) {
		int count = madebymeDao.likeCheck(mbm_no, user_id);
		System.out.println("service:" + mbm_no);
		return count;
	}

	@Override
	public void deleteMbm(int mbm_no, int hobby_no) {
		madebymeDao.deleteMbm(mbm_no, hobby_no);
	}


}
