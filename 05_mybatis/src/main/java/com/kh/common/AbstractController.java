package com.kh.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 추상 컨트롤러 
public abstract class AbstractController {
	

	/*
	 * 각 서블릿들은 일반 class로 만든후, 현재 클래스를 상속받게함. doGet, doPost를 구현하게 할 예정
	 * 
	 * @return String viewName - jsp 페이지의 경로 또는 redirect하고자 하는 location
	 * 
	 */


	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "GET";
		
	}

	public String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "POST";
	}
}
