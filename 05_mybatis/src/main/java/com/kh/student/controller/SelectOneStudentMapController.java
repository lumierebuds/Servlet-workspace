package com.kh.student.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.common.AbstractController;
import com.kh.student.model.service.StudentService;

public class SelectOneStudentMapController extends AbstractController {

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no = 0;

		no = Integer.parseInt(request.getParameter("no"));

		Map<String, Object> student = new StudentService().selectOneStudentMap(no);

		System.out.println(student);
		request.setAttribute("student", student);

		response.setContentType("application/json; charset=utf-8"); // json 
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		gson.toJson(student, response.getWriter()); // 반환되는 json 데이터를
		
		return null;
	}

}
