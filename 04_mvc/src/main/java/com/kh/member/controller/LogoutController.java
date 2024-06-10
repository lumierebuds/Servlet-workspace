package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogoutController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		// session.removeAttribute("loginUser"); // 로그인된 세션에 등록된 "loginUser"를 삭제

		session.invalidate(); // 세션자체를 만료한다. 만료된 이후 다시 요청이 오면 만들어짐 - 로그아웃의 역할을 할 수 있음

		response.sendRedirect(request.getContextPath()); // /mvc로 리다이렉트

	}

}
