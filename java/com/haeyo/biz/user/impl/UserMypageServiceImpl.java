package com.haeyo.biz.user.impl;


import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.haeyo.biz.board.impl.TogetherBoardVO;
import com.haeyo.biz.board.impl.TogetherReplyVO;
import com.haeyo.biz.user.UserService;
import com.haeyo.biz.user.UserVO;

@Service("UserMypageService")
public class UserMypageServiceImpl   {
	private static final Logger logger = LoggerFactory.getLogger(UserMypageServiceImpl.class);
	
	@Autowired
	private UserMypageDAO userMypageDAO;
	
	@Autowired
	HttpSession session;
	
	
	//내가 쓴 글 모아보기 
		public List<TogetherBoardVO> getUserPost(int uNo) {
			System.out.println("UserMypageServiceImpl에서 getUserPost 처리");
			return userMypageDAO.getUserPost(uNo);
		}
		
	//내가 쓴 댓글 모아보기
		public List<TogetherReplyVO> getUserReply(Map<String, Object> userReply) {
			System.out.println("UserMypageServiceImpl에서 getUserReply 처리");
			return userMypageDAO.getUserReply(userReply);
		}

		public void deleteUserReply (Map<String, Object> delUserReply)  {
			System.out.println("UserMypageServiceImpl에서 deleteUserReply" + delUserReply);
			  userMypageDAO.deleteReply(delUserReply);
			  
		}
		public void deleteUserAllReply (Map<String, Object> delUserAllReply) {
			System.out.println("UserMypageServiceImpl에서 deleteUserAllReply");
			 userMypageDAO.deleteReplyALL(delUserAllReply);
		}

	
	

		public UserVO uploadUserPic(UserVO vo) throws Exception {
		MultipartFile uploadFile = vo.getUploadFile(); //파일 업로드 객체 생성

		System.out.println("uploadUserPic() 처리 중  uploadFile "+ uploadFile);

		if(!uploadFile.isEmpty()) {
			String uPic = uploadFile.getOriginalFilename();
		
			String rootPath = 
					session.getServletContext().getRealPath("/");
			String attachPath = "/resources/image/";
			uploadFile.transferTo(new File(rootPath + attachPath + uPic));
			
			System.out.println(rootPath+attachPath+uPic);
			
			vo.setuPic(uPic);
			userMypageDAO.updateMypage(vo);
		}
		return vo;
	}
	

	//@Override
	public void updateMypage(UserVO vo) {
		userMypageDAO.updateMypage(vo);
	}
	
	//@Override
	public UserVO selectOneUser(UserVO vo) {
		System.out.println("셀렉트 원 유저 vo 마이페이지로 가자~!");
		return (UserVO)userMypageDAO.selectOneUser(vo);
	}
	
	//@Override   //비밀번호 업데이트 
	public void updateUserPwd(UserVO vo) {
		System.out.println("업데이트 유저 패스워드 vo 마이페이지로 가자~!");
		userMypageDAO.updateUserPwd(vo);

	}
	  
	//@Override		//비밀번호 비교
	public UserVO selectOnePwd(UserVO vo) {
		System.out.println("서비스 임플 셀렉트 유저 패스워드 vo 마이페이지로 가자~!");
		UserVO result = userMypageDAO.selectOnePwd(vo);
		logger.info("result"+ result);
		return result ;
		
	}
	
	//@Override
	public void deleteoneUser(int uNo) {
		System.out.println("유저서비스임플 딜리트원유저 가자~!");
		userMypageDAO.deleteoneUser(uNo);

	}

}