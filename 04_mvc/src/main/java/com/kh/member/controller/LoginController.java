package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// request.setCharacterEncoding("UTF-8"); // 요청데이터에 한글이 포함될 수 있어 인코딩을 추가
		System.out.println("Filter에서 인코딩 처리 완료");

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");

		// 로그인 관련 비즈니스 로직 실행

		Member loginUser = new MemberService().login(userId, userPwd); // 로그인 실행후 회원객체 반환

		if (loginUser != null) {
			HttpSession session = request.getSession();

			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");

			// url 재요청 방식(sendRedirect 방식) => request시 전달한 데이터를 초기화
			response.sendRedirect(request.getContextPath()); // /mvc 전달 - 재요청 경로
		} else {

			request.setAttribute("errorMsg", "로그인 실패");

			request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);

		}

	}

}
