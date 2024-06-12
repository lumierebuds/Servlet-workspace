package com.kh.student.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.AbstractController;
import com.kh.student.model.service.StudentService;
import com.kh.student.model.vo.Student;


public class InsertStudentController extends AbstractController {
	private static final long serialVersionUID = 1L;

	private StudentService studentService = new StudentService();

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return "student/insertStudent";
		// request.getRequestDispatcher("/WEB-INF/views/student/insertStudent.jsp").forward(request, response);

	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 사용자 입력값 처리
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");

		Student student = new Student();
		student.setName(name);
		student.setTel(tel);

		// 2. service 요청
		int result = studentService.insertStudent(student);

		// 3. 응답데이터 처리
		request.getSession().setAttribute("msg", "학생 등록 성공");
		// response.sendRedirect("/mybatis/student/insertStudent");
		// url로 이동하기 때문에 /mybatis를 붙임
		
		return "redirect:/student/insertStudent.do";

	}

}
