package com.haeyo.biz.reservation;

public class ReservationSubCateConverter {
	    //청소
		private String rsvToilet;
		private String rsvRoom;
		private String rsvRefrigerator;
		private String rsvArrangement;
		private String rsvHomein;
		
		//이사
		private String rsvTransportation;
		private String rsvOneroom;
		private String rsvKeep; 
		
		//수리
		private String rsvWaterpipe;
		private String rsvElectric;
		private String rsvDoor;
		private String rsvLiving;
		private String rsvTrash;
		
		
		public String getRsvToilet() {
			return rsvToilet;
		}
		public void setRsvToilet(int rsvToilet) {
			if(rsvToilet == 1)
				this.rsvToilet = "화장실 청소";
			else
				this.rsvToilet = "";
		}
		public String getRsvRoom() {
			return rsvRoom;
		}
		public void setRsvRoom(int rsvRoom) {
			if(rsvRoom == 1)
				this.rsvRoom = "생활 청소";
			else
				this.rsvToilet = "";
		}
		public String getRsvRefrigerator() {
			return rsvRefrigerator;
		}
		public void setRsvRefrigerator(int rsvRefrigerator) {
			if(rsvRefrigerator == 1)
				this.rsvRefrigerator =  "냉장고 청소";
			else
				this.rsvToilet = "";
		}
		public String getRsvArrangement() {
			return rsvArrangement;
		}
		public void setRsvArrangement(int rsvArrangement) {
			if(rsvArrangement == 1)
				this.rsvArrangement = "정리 정돈";
			else
				this.rsvToilet = "";
		}
		public String getRsvHomein() {
			return rsvHomein;
		}
		public void setRsvHomein(int rsvHomein) {
			if(rsvHomein == 1)
				this.rsvHomein = "입주 청소";
			else
				this.rsvToilet = "";
		}
		public String getRsvTransportation() {
			return rsvTransportation;
		}
		public void setRsvTransportation(int rsvTransportation) {
			if(rsvTransportation == 1)
				this.rsvTransportation = "용달/화물 운송";
			else
				this.rsvToilet = "";
		}
		public String getRsvOneroom() {
			return rsvOneroom;
		}
		public void setRsvOneroom(int rsvOneroom) {
			if(rsvOneroom == 1)
				this.rsvOneroom = "소형/원룸이사";
			else
				this.rsvToilet = "";
		}
		public String getRsvKeep() {
			return rsvKeep;
		}
		public void setRsvKeep(int rsvKeep) {
			if(rsvKeep == 1)
			 this.rsvKeep = "짐 보관";
			else
				this.rsvToilet = "";
		}
		public String getRsvWaterpipe() {
			return rsvWaterpipe;
		}
		public void setRsvWaterpipe(int rsvWaterpipe) {
			if(rsvWaterpipe == 1)
				this.rsvWaterpipe = "수도 설치/수리";
			else
				this.rsvToilet = "";
		}
		public String getRsvElectric() {
			return rsvElectric;
		}
		public void setRsvElectric(int rsvElectric) {
			if(rsvElectric == 1)
				this.rsvElectric = "전기 설치/수리";
			else
				this.rsvToilet = "";
		}
		public String getRsvDoor() {
			return rsvDoor;
		}
		public void setRsvDoor(int rsvDoor) {
			if(rsvDoor == 1)
				this.rsvDoor = "문,창문 설치/수리";
			else
				this.rsvToilet = "";
		}
		public String getRsvLiving() {
			return rsvLiving;
		}
		public void setRsvLiving(int rsvLiving) {
			if(rsvLiving == 1)
				this.rsvLiving = "생활 수리";
			else
				this.rsvToilet = "";
		}
		public String getRsvTrash() {
			return rsvTrash;
		}
		public void setRsvTrash(int rsvTrash) {
			if(rsvTrash == 1)
				this.rsvTrash = "철거/정리";
			else
				this.rsvToilet = "";
		}
		
		
}
