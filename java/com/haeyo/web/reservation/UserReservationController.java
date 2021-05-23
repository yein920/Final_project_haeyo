package com.haeyo.web.reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.profession.ReviewsVO;
import com.haeyo.biz.professionMypage.impl.ProfessionMypageService;
import com.haeyo.biz.reservation.ReservationVO;
import com.haeyo.biz.reservation.impl.UserReservationServiceImpl;
import com.haeyo.biz.user.UserVO;
import com.haeyo.web.professionMypage.ProReservationController;

@Controller
public class UserReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserReservationController.class);
	
	@Autowired
	private UserReservationServiceImpl userRsvService;
		
	
	@GetMapping("/getUserRsvList.do")
	public String getUserRsvList(HttpSession session, Model model) {
		
		UserVO userVO = (UserVO)session.getAttribute("user");
		logger.info("userVO : " + userVO);
		
		List<ReservationVO> userRsvList =  userRsvService.getUserRsvList(userVO); // 되돌아온 값
		int rsvCount = userRsvList.size();
		
		model.addAttribute("userRsvList", userRsvList);
		model.addAttribute("rsvCount", rsvCount);
		
		logger.info("userRsvList : " + userRsvList);
		
		return "userRsv.rsvList";
	}
	
	
	@PostMapping("/deleteReservation.do")
	public String deleteReservation(ReservationVO vo) {
		
		logger.info("ReservationVO:" + vo);
		userRsvService.deleteReservation(vo);
		
		return "redirect: getUserRsvList.do";
	}
	
	//------------------completeList 기능 수행-----------------
	
	@GetMapping("/getUserComList.do")
	public String getUserComList(HttpSession session, Model model) {
		
		UserVO userVO = (UserVO)session.getAttribute("user");
		logger.info("userVO : " + userVO);
		
		//완료된 예약 리스트 (일정완료 전)
		List<ReservationVO> userComList =  userRsvService.getUserComList(userVO); // 되돌아온 값
		int comCount = userComList.size();
		
		model.addAttribute("userComList", userComList);
		model.addAttribute("comCount", comCount);
		
		logger.info("userComList : " + userComList);
		
		//끝난 예약리스트(일정완료 후)
		List<ReservationVO> userEndList =  userRsvService.getUserEndList(userVO); // 되돌아온 값
		int endCount = userEndList.size();
		
		model.addAttribute("userEndList", userEndList);
		model.addAttribute("endCount", endCount);
		
		logger.info("userEndList : " + userEndList);
		
		return "userRsv.completeList";
	}
	
	@PostMapping("/insertReview.do")
	public String insertReview(ReviewsVO vo) {
		
		logger.info("ReservationVO:" + vo);
		userRsvService.updateCheck(vo.getRsvNo());
		userRsvService.insertReview(vo);
		
		return "redirect: getUserComList.do";
	}
	

}
