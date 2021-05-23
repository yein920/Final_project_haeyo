package com.haeyo.biz.reservation.impl;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.haeyo.biz.profession.ReviewsVO;
import com.haeyo.biz.reservation.ReservationCategoryVO;
import com.haeyo.biz.reservation.ReservationService;
import com.haeyo.biz.reservation.ReservationVO;
import com.haeyo.biz.reservation.alramVO;

@Service("ReservationServiceImpl")
public class ReservationServiceImpl implements ReservationService {

	private static final Logger logger = LoggerFactory.getLogger(ReservationServiceImpl.class);

	@Autowired
	HttpSession session;

	@Autowired
	ReservationDAO reservationDAO;

	// 예약 인서트
	@Override
	public void insertReservaiton(ReservationVO vo) {
		logger.info("ReservationVO" + vo);
		reservationDAO.insertReservation(vo);
		if (vo.getRsvCategory().equals("수리")) {
			reservationDAO.insertRepair(vo);
		}else if (vo.getRsvCategory().equals("이사")) {
			reservationDAO.insertMoving(vo);
		}else if (vo.getRsvCategory().equals("청소")){
			reservationDAO.insertCleaning(vo);
		}
	}

	// 신청서 출력
	@Override
	public String application(ReservationCategoryVO vo) {
		logger.info("ReservationCategoryVO" + vo);
		if (session.getAttribute("user") != null)
			return "profession.application";
		else
			return "Login";
	}
	
	//신청서 사진 파일 업로드 -- 210419 이수민 추가
	public ReservationVO fileUpload(ReservationVO vo) throws IllegalStateException, IOException {
		MultipartFile file1 = vo.getFile1();
		MultipartFile file2 = vo.getFile2();
		if(!file1.isEmpty() || !file2.isEmpty()) {
			String rsvPic1 = file1.getOriginalFilename();
			String rsvPic2 = file2.getOriginalFilename();
			String rootPath = session.getServletContext().getRealPath("/");
			String attachPath ="WEB-INF\\reservationImage\\";
				file1.transferTo(new File(rootPath+attachPath+rsvPic1));
				file2.transferTo(new File(rootPath+attachPath+rsvPic2)); //해당 경로에 받은 이름의 파일을 만들어 저장
	            vo.setRsvPic1(rsvPic1);
				vo.setRsvPic2(rsvPic2);
			}
		return vo;
	}
	
	//결제알림 인서트
	@Override
	public void insertAlram(alramVO vo) {
		reservationDAO.insertAlram(vo);
	}

	//댓글 수정 셀렉트
	@Override
	public ReviewsVO ajaxReview(ReviewsVO vo) {
		reservationDAO.updateReview(vo);
		return reservationDAO.getReview(vo);
	}

}
