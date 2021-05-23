package com.haeyo.biz.reservation.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.profession.ReviewsVO;
import com.haeyo.biz.reservation.ReservationVO;
import com.haeyo.biz.user.UserVO;

@Repository
public class UserReservationDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(UserReservationDAO.class);
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<ReservationVO> getUserRsvList(UserVO userVO) {
		System.out.println("mybatis에 getUserRsvList() 기능 진행");
		
		List<ReservationVO> userRsvList = mybatis.selectList("ReservationResultDAO.getUserRsvList", userVO);
		logger.info("userRsvList : " + userRsvList);
		
	    return userRsvList;
	}
	
	public void deleteReservation(ReservationVO vo) {
		System.out.println("mybatis에 getUserRsvList() 기능 진행");
		mybatis.delete("ReservationResultDAO.deleteReservation", vo);
	}
	
	public List<ReservationVO> getUserComList(UserVO userVO) {
		System.out.println("mybatis에 getUserComList() 기능 진행");
	    return mybatis.selectList("ReservationResultDAO.getUserComList", userVO);
	}
	
	public List<ReservationVO> getUserEndList(UserVO userVO) {
		System.out.println("mybatis에 getUserEndList() 기능 진행");
		return mybatis.selectList("ReservationResultDAO.getUserEndList", userVO);
	}
	
	//리뷰 넣기
	public void insertReview(ReviewsVO vo) {
		System.out.println("mybatis에 insertReview() 기능 진행");
		mybatis.delete("ReservationResultDAO.insertReview", vo);
		
	}

	public void updateCheck(int rsvNo) {
		System.out.println("mybatis에 updateCheck() 기능 진행");
		mybatis.delete("ReservationResultDAO.updateCheck", rsvNo);
		
	}

}
