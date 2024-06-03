package com.kh.el;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.person.Person;

@WebServlet("/el/elBasics.do")
public class ElBasicServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ElBasicServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * 데이터를 담을 수 있는 JSP 내장 객체 종류
		 * 1. ServletContext(application Scope)
		 * 	  한 애플리케이션당 단 1개만 존재하는 객체 
		 * 	  이 영역에 데이터를 담으면 애플리케이션 전역에서 사용 가능.
		 * 	  ex) 지금까지 만든 /action, /hello 애플리케이션에 해당되는것으로 이를 
		 *    공유할 수 있다. 
		 *    모든 클라이언트가 함께 공유한다.
		 *    
		 * 2. HttpSession (session scope) 
		 *    한 브라우저당 1개 존재하는 객체 
		 *    이 영역에 데이터를 담으면 jsp/servlet단에서 모두 사용가능.
		 *    값이 한번 담기면 서버가 멈추가나, 브라우저가 닫히기 전까지 사용가능.
		 * 
		 * 
		 * 3. HttpServletRequest (request scope)
		 * 	  요청 및 응답시 매번 생성되는 객체
		 *    이 영역에 데이터를 담으면 request객체를 포워딩 받는 응답 jsp에서 사용 가능.
		 * 
		 * 4. PageContext(page scope)
		 *    선언한 jsp에서만 사용 가능. 
		 * 
		 *  위 객체들을 활용하여 데이터를 담을때는 .setAttribute(키, value)
		 *  						꺼낼때는 .getAttribute(키) 
		 *  						지울때는 .removeAttribute(키)
		 */

		request.setAttribute("coffee", "메머드");
		request.setAttribute("serverTime", System.currentTimeMillis());
		request.setAttribute("honngd", new Person("honngd", "홍길동", '남', 35, true));

		List<Object> list = Arrays.asList("abc", 12345, new Date());
		request.setAttribute("list", list);

		Map<String, Object> map = new HashMap();
		map.put("language", "java");
		map.put("Mr.mkm", new Person("mkmmm", "민경민", '남', 45, false));

		request.setAttribute("map", map);

		HttpSession session = request.getSession();
		session.setAttribute("book", "자바의 정석");

		ServletContext application = request.getServletContext();
		application.setAttribute("movie", "매드맥스");

		request.getRequestDispatcher("/el/elBasics.jsp").forward(request, response);
		// webapp폴더 안에 /el/elBasics.jsp 파일로 렌더링

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
