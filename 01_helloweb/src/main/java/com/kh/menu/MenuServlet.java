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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// form 으로 전달된 데이터 확인

		String hamburger = request.getParameter("hamburger");
		String side = request.getParameter("side");
		String drink = request.getParameter("drink");
		System.out.print(hamburger + " " + side + " " + drink);

		request.setAttribute("hamburger", hamburger);
		request.setAttribute("side", side);
		request.setAttribute("drink", drink);
		request.getRequestDispatcher("/menu/menuOrder.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
