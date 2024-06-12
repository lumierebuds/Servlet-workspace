package com.kh.student.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.AbstractController;
import com.kh.student.model.service.StudentService;
import com.kh.student.model.vo.Student;

public class SelectStudentListController extends AbstractController {

	private StudentService studentService = new StudentService();
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1) 비지니스 로직 (학생정보 조회) 
		
		List<Student> list = studentService.selectStudentList();
		System.out.println(list);

		List<Map<String, Object>> mapList = studentService.selectStudentListMap();
		System.out.println(mapList);
		// 2)

		request.setAttribute("list", list);
		request.setAttribute("mapList", mapList);
		
		return "student/selectList";
		
		
	}
}
