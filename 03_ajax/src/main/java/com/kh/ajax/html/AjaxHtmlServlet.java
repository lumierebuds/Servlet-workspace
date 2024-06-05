package com.kh.ajax.html;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ajax.member.model.vo.Member;

@WebServlet("/html")
public class AjaxHtmlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxHtmlServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Member> list = new ArrayList<>();
		list.add(new Member("hwan", "황제성", "hwang.jpg"));
		list.add(new Member("julia", "줄리아 로버츠", "juliaRoberts.jpg"));
		list.add(new Member("gone", "김고은", "김고은.jpg"));
		list.add(new Member("daft", "다프트펑크", "daftpunk.jpg"));

		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/html/member.jsp") // webapp이 경로이다.
				.forward(request, response); // jsp에서 작성된 렌더링 파일이 출력된다.

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
