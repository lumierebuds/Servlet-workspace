package com.kh.web.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestPerson2Servlet extends HttpServlet {
	/*
	 * 서블릿? - Server+Applets의 합성어. - 자바를 사용해서 동적인 웹페이지를 만들기 위해 필요한 기술. - 사용자의
	 * 요청(request)를 받아 처리하고 그에 해당하는 응답페이지를 만든 후 다시 사용자에게 응답(response)하는 역할의 자바 클래스.
	 * - was서버에의해 구동된다.
	 */

	public TestPerson2Servlet() {
		super();
		System.out.println("기본생성자 testperson1 호출");
	}

	/*
	 * Servlet의 생명주기 - was구동내내 딱 한번만 생성된다.(싱글톤 패턴) 1. 객체생성(기본생성자호출) -> 최초 client 호출시
	 * 1회 생성 2. init메소드 호출 -> 최초 client 호출시 1회 실행
	 * ----------------------------------------- 3. HttpServlet의 service메소드 호출 - 매
	 * 요청마다 호출. 4. 요청방식에 따라 doGet| doPost 호출 - 매 요청마다 호출.
	 * ------------------------------------------------- 5. destory메소드 호출(톰캣 종료시) -
	 * 마지막 1회 실행
	 * 
	 */

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("init 메서드 호출");
	}

	@Override
	public void destroy() {
		System.out.println("destory() 호출.");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 인코딩 선언
		// http body 부분 인코딩 설정은 기본값이 iso-8859-1이기 때문
		// 안하면 문자들이 깨질 수 있다.
		req.setCharacterEncoding("UTF-8");

		// 사용자가 입력한 값 가져오기
		String name = req.getParameter("name");
		String color = req.getParameter("color");
		String animal = req.getParameter("animal");
		String[] foods = req.getParameterValues("food");
		System.out.printf("%s %s %s %s", name, color, animal, Arrays.toString(foods));

		// 비즈니스로직

		String recommendation = "";
		switch (color) {
		case "빨강":
			recommendation = "빨간짬뽕";
			break;
		case "파랑":
			recommendation = "파랑짬뽕";
			break;
		case "노랑":
			recommendation = "노랑짬뽕";
			break;
		case "초록":
			recommendation = "초록짬뽕";
			break;
		default:
			break;
		}

		// 현재 서블릿에서 새로 생성된 데이터를 전달하기 위해서는
		// setAttribute(key : String, value: Object)를 사용하여 저장.
		req.setAttribute("recommendation", recommendation);

		// html 작성을 jsp에게 위임
		RequestDispatcher reqdis = req.getRequestDispatcher("/servlet/testPersonRes.jsp"); // '/'가 최상위 webapp이 됨
		reqdis.forward(req, resp);

		// 응답 메시지 작성
		// resp.setContentType("text/html; charset=utf-8");
		// PrintWriter out = resp.getWriter();
		// out.println("<!DOCTYPE html>");
		// out.println("<html>");
		// out.println("<head>");
		// out.println("<title>취향검사결과</title>");
		// out.println("</head>");
		// out.println("<body>");
		// out.println("<h1>개취검사결과</h1>");
		// out.println("<p>" + name + "님의 개인 취향 검사 결과는</p>");
		// out.println("<p>" + color + "색을 좋아하시네요</p>");
		// out.println("<p>좋아 하는 동물은 " + animal + "입니다.</p>");
		// out.println("<p>좋아 하는 음식은 " + Arrays.toString(foods) + "입니다.</p>");
		// out.println("<p class='recommendation'>오늘의 추천 음식은 " + recommendation + "입니다.
		// </p>");
		// out.println("</body>");

	}

}
