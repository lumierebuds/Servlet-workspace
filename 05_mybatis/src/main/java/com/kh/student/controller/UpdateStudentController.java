package com.kh.student.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.AbstractController;
import com.kh.student.model.service.StudentService;
import com.kh.student.model.vo.Student;

public class UpdateStudentController extends AbstractController {



	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");

		Student student = new Student(no, name, tel, null);
		
		// 비지니스 로직
		int result = new StudentService().updateStudent(student);
		
		if (result > 0) {
			request.getSession().setAttribute("msg", "사용자정보 수정 성공");
		} else {
			request.getSession().setAttribute("msg", "사용자정보 수정 실패");
		}

		return "redirect:/student/selectOne.do?no=" + no;
	}

}
