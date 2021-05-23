package com.haeyo.biz.board.impl;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.haeyo.biz.user.UserVO;

public class TogetherReplyVO {
	private int trNo;
	private int uNo;
	private int tNo;
	private String trContent;
//	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-mm-dd hh:mm:ss")
	private String trCredate;
	private UserVO userVO;
	private int trParent;
	private int trDepth;
	private int trOrder;
	
	//손예인 추가 210419
	TogetherBoardVO togetherBoardVO;
	public TogetherBoardVO getTogetherBoardVO() {
		return togetherBoardVO;
	}
	public void setTogetherBoardVO(TogetherBoardVO togetherBoardVO) {
		this.togetherBoardVO = togetherBoardVO;
	}
	
	public int getTrNo() {
		return trNo;
	}
	public void setTrNo(int trNo) {
		this.trNo = trNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public String getTrContent() {
		return trContent;
	}
	public void setTrContent(String trContent) {
		this.trContent = trContent;
	}
	public String getTrCredate() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
//		String trCredate = sdf.format(this.trCredate);
		return trCredate;
	}
	public void setTrCredate(String trCredate) {
		this.trCredate = trCredate;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public int getTrParent() {
		return trParent;
	}
	public void setTrParent(int trParent) {
		this.trParent = trParent;
	}
	public int getTrDepth() {
		return trDepth;
	}
	public void setTrDepth(int trDepth) {
		this.trDepth = trDepth;
	}
	public int getTrOrder() {
		return trOrder;
	}
	public void setTrOrder(int trOrder) {
		this.trOrder = trOrder;
	}
	
	@Override
	public String toString() {
		return "TogetherReplyVO [trNo=" + trNo + ", uNo=" + uNo + ", tNo=" + tNo + ", trContent=" + trContent
				+ ", trCredate=" + trCredate + ", userVO=" + userVO + ", trParent=" + trParent + ", trDepth=" + trDepth
				+ ", trOrder=" + trOrder + "]";
	}

}
