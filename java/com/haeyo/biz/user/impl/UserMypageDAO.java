package com.haeyo.biz.user.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.haeyo.biz.board.impl.TogetherBoardVO;
import com.haeyo.biz.board.impl.TogetherReplyVO;
import com.haeyo.biz.user.UserVO;

@Repository("UserMypageDAO")
public class UserMypageDAO {
	private static final Logger logger = LoggerFactory.getLogger(UserMypageDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	//글 모아보기
	public List<TogetherBoardVO> getUserPost(int uNo){
		List<TogetherBoardVO> result = sqlSessionTemplate.selectList("UserMypageDAO.selectPost", uNo);
		System.out.println("UserMypageDAO getUserPost result" + result);
		return result;
	}


	//댓글 모아보기 
	public List<TogetherReplyVO> getUserReply(Map<String, Object> userReply) {
		System.out.println("UserMypageDAO  uNo" + userReply);
		List<TogetherReplyVO> result= sqlSessionTemplate.selectList("UserMypageDAO.selectReplyEat", userReply);
		System.out.println("UserMypageDAO  selectReplyresult" + result);

		 return result ;
	}
	

	//TogetherBoard 댓글삭제에 대한 부분
	//유저 마이페이지 - 내가 쓴 댓글 개별삭제하기	
	public void deleteReply(Map<String, Object> delUserReply) {
		System.out.println("UserMypageDAO deleteReply처리"  + delUserReply);
		sqlSessionTemplate.delete("UserMypageDAO.deleteReply", delUserReply);
		
	}
		
	//댓글 전체삭제하기	
	public void deleteReplyALL(Map<String, Object> delUserAllReply) {
		System.out.println("UserMypageDAO deleteALLReply처리" + delUserAllReply);
		sqlSessionTemplate.delete("UserMypageDAO.deleteReply_all", delUserAllReply); 
		
	}
	
	//마이페이지 업데이트하기
	public void updateMypage(UserVO vo) {
		logger.info("UserDAO updateMypage updateMypage vo :" + vo);
		
		sqlSessionTemplate.update("UserMypageDAO.updateMypage", vo);
	}
	
	//개인 정보 가져오기 (데이터 열람 화면)
	public UserVO selectOneUser(UserVO vo) {
		System.out.println("UserMypageDAO selectUser() 기능 처리");
		return (UserVO)sqlSessionTemplate.selectOne("UserMypageDAO.selectOneUser", vo);
	}
	
	//업데이트 비밀번호 
	public void updateUserPwd(UserVO vo) {
		System.out.println("UserMypageDAO 셀렉트 패스워드 유저 기능 처리");
		sqlSessionTemplate.update("UserMypageDAO.updateUserPwd", vo);
	}
	
	//셀렉트 비밀번호
	public UserVO selectOnePwd(UserVO vo) {
		UserVO result = (UserVO)sqlSessionTemplate.selectOne("UserMypageDAO.selectOnePwd", vo);
		System.out.println("UserMypageDAO selectOnePwd 기능처리 result" + result);
		return result;
	}
	
	//계정삭제
	public void deleteoneUser(int uNo) {
		System.out.println("UserMypageDAO deleteoneUser 기능처리");
		sqlSessionTemplate.delete("UserMypageDAO.deleteoneUser", uNo);
	}



}
