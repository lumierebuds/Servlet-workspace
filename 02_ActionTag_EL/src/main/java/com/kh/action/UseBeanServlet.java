package com.kh.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.person.Person;

@WebServlet(name = "useBean", urlPatterns = "/standard/useBean.do")
public class UseBeanServlet extends HttpServlet {

	private RequestDispatcher requestDispatcher;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Person person = new Person();
		person.setId("hongd");
		person.setName("홍길동");
		person.setAge(35);
		person.setGender('남');
		person.setMarried(true);

		// 클라이언트에게 응답해주는 데이터는 jsp가 처리해주기 때문에
		// 요청객체에서 만들어준다.
		req.setAttribute("hongd", person);
		req.getRequestDispatcher("/standard/testPersonRes.jsp").forward(req, res);

	}
}
