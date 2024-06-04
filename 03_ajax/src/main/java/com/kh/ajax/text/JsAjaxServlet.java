package com.kh.ajax.text;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxTest.do")
public class JsAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JsAjaxServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("id");

		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print("ajax 요청에 대한 응답 결과 :: " + userId);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
