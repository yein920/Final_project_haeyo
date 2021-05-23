package com.haeyo.biz.board;

import java.util.List;

import com.haeyo.biz.board.impl.TogetherBoardVO;
import com.haeyo.biz.user.UserVO;

public interface BoardService {
	void insertBoard(TogetherBoardVO boardVO);
	void updateBoard(TogetherBoardVO boardVO);
	void deleteBoard(int tNo);
	TogetherBoardVO getBoard(int tNo);
	List<TogetherBoardVO> getBoardList(UserVO userVO);
}
