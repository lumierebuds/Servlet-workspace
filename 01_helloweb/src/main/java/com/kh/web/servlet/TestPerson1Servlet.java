package com.kh.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestPerson1Servlet extends HttpServlet {
	/*
	 * 서블릿? - Server+Applets의 합성어. - 자바를 사용해서 동적인 웹페이지를 만들기 위해 필요한 기술. - 사용자의
	 * 요청(request)를 받아 처리하고 그에 해당하는 응답페이지를 만든 후 다시 사용자에게 응답(response)하는 역할의 자바 클래스.
	 * - was서버에의해 구동된다.
	 */

	public TestPerson1Servlet() {
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

		// req : 요청시 클라이언트가 전달한 값, 전송방식, ip 등등
		// resp : 응답정보를 담아서 반환 객체

		System.out.println(this.hashCode());
		// 사용자가 입력한 값 가져오기
		String name = req.getParameter("name");
		String color = req.getParameter("color");
		String animal = req.getParameter("animal");
		String[] foods = req.getParameterValues("food");
		System.out.printf("%s %s %s %s", name, color, animal, Arrays.toString(foods));

		// 응답 메시지 작성
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>취향검사결과</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>개취검사결과</h1>");
		out.println("<p>" + name + "님의 개인 취향 검사 결과는</p>");
		out.println("<p>" + color + "색을 좋아하시네요</p>");
		out.println("<p>좋아 하는 동물은 " + animal + "입니다.</p>");
		out.println("<p>좋아 하는 음식은 " + Arrays.toString(foods) + "입니다.</p>");
		out.println("</body>");

		/*
		 * apache tomcat 구동방식 1. 아파치 톰캣 서버 구동시 웹 + was서버 동시 구동 2. 클라이언트가 서버에 http로
		 * ip:8081/hello/testPerson1.do로 요청을 보내면 우선 웹서버가 내용을 전달받은 후 was로 전달 3. was는
		 * 요청내용을 수신한 후 처리할 수 있는 어플리케이션을 찾음(01_helloweb) 4. 어플리케이션 내부의 web.xml을 로딩.
		 * /testPerson1.do 라는 요청을 처리할 수 있는 servlet을 찾음. 5. service() 메서드를 호출하여 클라이언트의
		 * 전송방식에 맞는 doGet / doPost 메서드 호출 6. doGet / doPost 비즈니스로직 작업처리(jdbc의
		 * Controller의 역할수행) 7. 반환받은 데이터로 동적인 html페이지를 생성. 8. 진행방향의 역순으로 데이터 전달.
		 * 
		 */
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 인코딩 선언
		// http body 부분 인코딩 설정은 기본값이 iso-8859-1이기 때문
		// 안하면 문자들이 깨질 수 있다.
		req.setCharacterEncoding("UTF-8");

		System.out.println(this.hashCode());
		// 사용자가 입력한 값 가져오기
		String name = req.getParameter("name");
		String color = req.getParameter("color");
		String animal = req.getParameter("animal");
		String[] foods = req.getParameterValues("food");
		System.out.printf("%s %s %s %s", name, color, animal, Arrays.toString(foods));

		// 응답 메시지 작성
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>취향검사결과</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>개취검사결과</h1>");
		out.println("<p>" + name + "님의 개인 취향 검사 결과는</p>");
		out.println("<p>" + color + "색을 좋아하시네요</p>");
		out.println("<p>좋아 하는 동물은 " + animal + "입니다.</p>");
		out.println("<p>좋아 하는 음식은 " + Arrays.toString(foods) + "입니다.</p>");
		out.println("</body>");
	}

}
