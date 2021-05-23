package com.haeyo.web.board;

import org.springframework.ui.Model;

import com.haeyo.biz.board.impl.TogetherBoardVO;

public interface BoardController {
	String insertBoard(TogetherBoardVO boardVO);
	String updateBoard(TogetherBoardVO boardVO);
	String deleteBoard(int tNo);
	String getBoard(int tNo, Model model);
	String getBoardList(Model model);
}
