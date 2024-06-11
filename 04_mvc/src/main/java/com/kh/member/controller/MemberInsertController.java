package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

@WebServlet("/member/insert")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInsertController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/WEB-INF/views/member/enrollForm.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 클라이언트가 요청시 전달한 값들 뽑아오기
		String userId = request.getParameter("userId"); // 필수 입력값;
		String userPwd = request.getParameter("userPwd"); // 필수
		String userName = request.getParameter("userName"); // 필수

		String phone = request.getParameter("phone"); // 선택 ""
		String email = request.getParameter("email"); // 선택 ""
		String address = request.getParameter("address"); // 선택 ""
		String[] interestArr = request.getParameterValues("interest"); // 선택 null
		String interest = "";
		if (interestArr != null) {
			interest = String.join(",", interestArr);
		}

		// 매개변수 생성자를 이용한 Member 객체 포장
		Member m = new Member(0, userId, userPwd, userName, phone, email, address, interest, null, null, interest);

		// 서비스 요청 처리(처리된 행의 갯수 응답)
		int result = new MemberService().insertMember(m);

		// 처리된 결과를 가지고 사용자가 보게될 응답 View 지정
		if (result > 0) { // 성공
			request.getSession().setAttribute("alertMsg", "회원가입 성공");
			// 회원가입 이후 로그인을 하지 않아도 이용할 수 있게 세션 객체에 추가할 수 있다.
			response.sendRedirect(request.getContextPath()); // request 비우기

		} else {
			request.setAttribute("errorMsg", "회원가입 실패");
			request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jpg").forward(request, response);
		}
	}
}
