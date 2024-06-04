package com.kh.menu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "menuServlet", urlPatterns = "/menuOrder.do")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MenuServlet() {
		super();
	}

	// [강사님 코드]

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// form 으로 전달된 데이터 확인

		// 1. 사용자 입력값 처리
		String hamburger = request.getParameter("hamburger");
		String side = request.getParameter("side");
		String drink = request.getParameter("drink");
		// String price = request.getParameter("price");
		// price는 자바에서 switch문으로 계산해주도록 수

		// 2. 계산

		int price = 0;
		switch (hamburger) {
		case "한우버거":
			price += 5000;
			break;
		case "밥버거":
			price += 4500;
			break;
		case "치즈버거":
			price += 4000;
			break;
		}

		switch (side) {
		case "감자튀김":
			price += 1500;
			break;
		case "어니언링":
			price += 1700;
			break;
		}

		switch (drink) {
		case "콜라":
			price += 1000;
			break;
		case "사이다":
			price += 1000;
			break;
		case "커피":
			price += 1500;
			break;
		case "밀크쉐이크":
			price += 2500;
			break;
		}

		request.setAttribute("hamburger", hamburger);
		request.setAttribute("side", side);
		request.setAttribute("drink", drink);
		request.setAttribute("price", 1234);
		request.getRequestDispatcher("/menu/menuOrder.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
