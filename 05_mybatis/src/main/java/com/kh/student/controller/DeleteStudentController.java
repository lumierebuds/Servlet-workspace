package com.kh.student.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.AbstractController;
import com.kh.student.model.service.StudentService;

public class DeleteStudentController extends AbstractController {

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1) 클라이언트가 전달한 값 뽑아내기
		int no = Integer.parseInt(request.getParameter("no"));

		// 2) 비지니스 로직처리
		int result = new StudentService().deleteStudent(no);

		// 3) 결과값에 따른 응답 메시지

		if (result > 0) {
			request.getSession().setAttribute("msg", "학생삭제성공!");
		} else {
			request.getSession().setAttribute("msg", "학생삭제실패!");
		}

		// 4) sendRedirect
		return "redirect:/student/selectOne.do";
	}

}
