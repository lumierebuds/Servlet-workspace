package com.kh.board.model.vo;

import java.util.Date;

public class Board {

	private int no; // 게시글 pk값: id
	private String title; // 제목
	private String nickname; // 작성자
	private String content; // 내용
	private Date createDate; // 생성일

	public Board() {

	}

	public Board(int no, String title, String nickname, String content, Date createDate) {
		super();
		this.no = no;
		this.title = title;
		this.nickname = nickname;
		this.content = content;
		this.createDate = createDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
