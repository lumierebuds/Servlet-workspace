package com.kh.student.model.vo;

import java.util.Date;


public class Student {
	private int no;
	private String name;
	private String tel;
	private Date regDate;
	// Date : java.util.Date로 import

	public Student() {

	}

	public Student(int no, String name, String tel, Date regDate) {
		super();
		this.no = no;
		this.name = name;
		this.tel = tel;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
