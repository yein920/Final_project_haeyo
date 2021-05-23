package com.haeyo.biz.reservation.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.haeyo.biz.profession.ReviewsVO;
import com.haeyo.biz.reservation.ReservationVO;
import com.haeyo.biz.user.UserVO;
import com.haeyo.web.reservation.UserReservationController;

@Service("UserReservationService")
public class UserReservationServiceImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(UserReservationServiceImpl.class);
	
	@Autowired
	private UserReservationDAO userRsvDAO;

	public List<ReservationVO> getUserRsvList(UserVO userVO) {
		System.out.println("UserReservationService에 getUserRsvList() 기능 진행");
	    return userRsvDAO.getUserRsvList(userVO);
	}
	
	public void deleteReservation(ReservationVO vo) {
		System.out.println("UserReservationService에 deleteReservation() 기능 진행");
	    userRsvDAO.deleteReservation(vo);
		
	};
	
	public List<ReservationVO> getUserComList(UserVO userVO) {
		System.out.println("UserReservationService에 getUserComList() 기능 진행");
	    return userRsvDAO.getUserComList(userVO);
	}
	
	public List<ReservationVO> getUserEndList(UserVO userVO) {
		System.out.println("UserReservationService에 getUserEndList() 기능 진행");
	    return userRsvDAO.getUserEndList(userVO);
	}

	public void insertReview(ReviewsVO vo) {
		System.out.println("UserReservationService에 insertReview() 기능 진행");
	    userRsvDAO.insertReview(vo);
	}

	public void updateCheck(int rsvNo) {
		System.out.println("UserReservationService에 updateCheck() 기능 진행");
	    userRsvDAO.updateCheck(rsvNo);
		
	}
}
