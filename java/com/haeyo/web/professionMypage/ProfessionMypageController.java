package com.haeyo.web.professionMypage;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.haeyo.biz.profession.ProfessionSubVO;
import com.haeyo.biz.profession.ProfessionVO;
import com.haeyo.biz.professionMypage.impl.ProfessionMypageService;
import com.haeyo.biz.user.UserVO;

@Controller
@SessionAttributes("profession")
public class ProfessionMypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProReservationController.class);
	
	@Autowired
	private ProfessionMypageService professionMypageService;
		
	@RequestMapping(value="/updateProfileView.do", method=RequestMethod.GET) //수정페이지 화면부르기
	public String updateProfileBefore(ProfessionVO vo, HttpSession session) {
		return "proMypage.update";
	}
	
	@RequestMapping(value="/updateProfile.do", method=RequestMethod.POST)
	public String updateProfile(@ModelAttribute ProfessionVO vo, ProfessionSubVO subvo,
			 						MultipartHttpServletRequest request, HttpSession session) throws Exception {		
				
		// update 전, 기존의 서브카테고리 삭제 
		ProfessionVO proVO = (ProfessionVO)session.getAttribute("profession");
		logger.info("proVO : " + proVO);
		professionMypageService.deleteSubCate(proVO);
		
		// upload + update 
		logger.info("upload+professionVO : " + vo);
		professionMypageService.updateProfile(vo, request);
		
		// 서브카테고리 넣기
		logger.info("ProfessionSubVO : " + subvo);
		professionMypageService.insertSubCate(subvo, vo);
		
		return "redirect: getProfile.do";
	}
	
	
	@PostMapping("/deleteProfile.do")
	public String deleteProfile(@RequestParam("pNo") int pNo) {
		logger.info("delete_info :" + pNo);
		professionMypageService.deleteProfile(pNo);
		return "haeyo.index"; //로그인 처리가 된 상태로  main으로 들어가게...?
	}
	
	
	@GetMapping("/getProfile.do")
	public String getProfile(HttpSession session, Model model) throws JsonProcessingException {
		
		UserVO userVO = (UserVO)session.getAttribute("user");
		
		if(userVO!=null){
			ProfessionVO profile = professionMypageService.getProfile(userVO); // 되돌아온 값
			
			int pNo = profile.getpNo();
			
			//전문가 계정이 없을 시 분기처리
			if(pNo==0) {
				ObjectMapper mapper = new ObjectMapper();
				String  noPro = mapper.writeValueAsString("전문가 계정이 없습니다");
				model.addAttribute("noPro", noPro);
				return "haeyo.index";
			}
			String pCategory = profile.getpCategory();
			ProfessionSubVO subCategory = professionMypageService.getSubCategory(pNo, pCategory); // 되돌아온 값
			
		
			//jackson 라이브러리 : json으로 변환
			ObjectMapper mapper = new ObjectMapper();
			String subCateJson = mapper.writeValueAsString(subCategory);
			
		
			//화면으로 보내기
			model.addAttribute("professionProfile", profile);
			model.addAttribute("subCateJson", subCateJson);
			session.setAttribute("profession", profile);
			
			logger.info("professionProfile : " + profile);
			logger.info("subCateJson : " + subCateJson);
			logger.info("session : " + session.getAttribute("profession"));
	
			return "proMypage.profile";
		 
		} else {
			return "haeyo.index";
		}// else end
	
	}

}//class end
