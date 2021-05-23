package com.haeyo.web.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.deser.DataFormatReaders.Match;
import com.google.gson.Gson;
import com.haeyo.biz.board.impl.TogetherBoardVO;
import com.haeyo.biz.user.UserService;
import com.haeyo.biz.user.UserVO;
import com.haeyo.biz.user.impl.UserMypageServiceImpl;
import com.haeyo.biz.user.impl.UserServiceImpl;

@Controller
@SessionAttributes("user")		// 세션에 user객체를 보관해라
public class UserMypageController {
	private static final Logger logger = LoggerFactory.getLogger(UserMypageController.class);
	
	@Autowired
	public UserMypageServiceImpl userMypageServiceImpl;

	@Autowired
	HttpSession session;

	//쓴 글 모아 보기
	@RequestMapping(value="/getUserPost.do", method=RequestMethod.GET)
	public String getUserPost(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		int uNo = user.getuNo();
		List<TogetherBoardVO> tPostList = userMypageServiceImpl.getUserPost(uNo);
		model.addAttribute("tPostList", tPostList);
		return  "userMypage.Post";
	}
	

	
	//댓글 모아보기 
	@RequestMapping(value="/getUserReply.do", method=RequestMethod.GET)
	public String getUserReply(@RequestParam("uNo") int uNo, @RequestParam("tHeader") String tHeader, Model model) {
		Map<String, Object> UserReply = new HashMap<String, Object>();
		UserReply.put("uNo", uNo);
		UserReply.put("tHeader", tHeader);
		model.addAttribute("tReplyList", userMypageServiceImpl.getUserReply(UserReply));
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", user);
		return "userMypage.Reply";
	}

	//내가 쓴 댓글 개별 삭제하기 
	@RequestMapping(value="/deleteUserReply.do", method=RequestMethod.GET)
		public String deleteUserReply(@RequestParam("trNo")int trNo, @RequestParam("tHeader")String tHeader, RedirectAttributes redirectAttributes) {
			Map<String, Object> delUserReply  = new HashMap<String, Object>();
			delUserReply.put("trNo", trNo);
			userMypageServiceImpl.deleteUserReply(delUserReply);
			UserVO user = (UserVO)session.getAttribute("user");
			int uNo = user.getuNo();
			redirectAttributes.addAttribute("tHeader",tHeader);
			redirectAttributes.addAttribute("uNo", uNo);
			 
			
			return "redirect: getUserReply.do";
		}
		
	//내가 쓴 댓글 전체삭제하기 
	@RequestMapping(value="/deleteUserAllReply.do", method=RequestMethod.GET)
		public String deleteUserAllReply(@RequestParam("uNo")int uNo,  @RequestParam("tHeader")String tHeader, RedirectAttributes redirectAttributes) {
			Map<String, Object> delUserAllReply  = new HashMap<String, Object>();
			delUserAllReply.put("uNo", uNo);
			userMypageServiceImpl.deleteUserAllReply(delUserAllReply);
			UserVO user = (UserVO)session.getAttribute("user");
			redirectAttributes.addAttribute("tHeader",tHeader);
 			redirectAttributes.addAttribute("uNo", uNo);
 			
			return "redirect: getUserReply.do";
		}

	//개인 정보 수정화면 출력 
	@GetMapping("/UserMypageInfoUpdate.do")
	public String getUpdateMypage(Model model, HttpSession session) {
		
		return "userMypage.InfoUpdate";
	}
		
	//마이페이지 개인 정보 수정
	@PostMapping("/updateMypage.do")
	public String updateMypage(@ModelAttribute("user") UserVO vo, Model model) throws Exception {
		userMypageServiceImpl.uploadUserPic(vo);
		userMypageServiceImpl.updateMypage(vo);
		model.addAttribute("user", vo);		 
		
		return "userMypage.Info";
	}
	
	//마이페이지 유저 비밀번호 열람화면 
	@GetMapping("/getUpdatePwdUser.do")	 
	public String getUpdatePwdUser(HttpSession session) {
		
		return "userMypage.Pwd";
	}
	
	//마이페이지 유저 비밀번호 변경하기
	@PostMapping("/getUpdatePwdUser.do")
	public String updateUserPwd(@ModelAttribute("user") UserVO vo) throws Exception{
		userMypageServiceImpl.updateUserPwd(vo);
		UserVO user = (UserVO)session.getAttribute("user");
		
		return "userMypage.Info";
	}
	
	//마이페이지 유저 비밀번호 셀렉 
	@GetMapping("/getOnePwd.do")	
	@ResponseBody 
	public UserVO selectOnePwd() {
		UserVO user = (UserVO) session.getAttribute("user");
		UserVO result = userMypageServiceImpl.selectOnePwd(user);
		
		return result;
	}
	
	
	
	//마이페이지 개인정보 출력 
	@GetMapping("/mypageinfo.do")
	public String selectOneUser(Model model, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", userMypageServiceImpl.selectOneUser(user));

		return "userMypage.Info";
	}
	
	//회원 탈퇴
	@RequestMapping(value="/deleteoneUser.do", method=RequestMethod.GET)
	public String deleteoneUser(HttpSession session, @RequestParam("uNo") int uNo) {
		userMypageServiceImpl.deleteoneUser(uNo);

		return "haeyo.index";
	}
		
}