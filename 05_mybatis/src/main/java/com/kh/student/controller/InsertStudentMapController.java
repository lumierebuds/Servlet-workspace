package com.kh.student.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.AbstractController;
import com.kh.student.model.service.StudentService;


public class InsertStudentMapController extends AbstractController {

	private static final long serialVersionUID = 1L;
       

	public String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");

		Map<String, Object> student = new HashMap<>();

		student.put("name", name);
		student.put("tel", tel);

		int result = new StudentService().insertStudentMap(student);

		if (result > 0) { // 등록성공시
			request.getSession().setAttribute("msg", "학생정보 등록성공");

		} else {
			request.getSession().setAttribute("msg", "학생정보 등록실패");
		}

		// response.sendRedirect("/mybatis/student/insertStudent");

		return "redirect:/student/insertStudent.do";

	}

}
