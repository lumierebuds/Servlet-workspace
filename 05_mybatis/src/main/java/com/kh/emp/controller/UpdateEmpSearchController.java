package com.kh.emp.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.AbstractController;
import com.kh.emp.model.service.EmpService;

public class UpdateEmpSearchController extends AbstractController {

	public EmpService service = new EmpService();

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청값 뽑아내기
		String empId = request.getParameter("empId");

		// 업무로직
		List<Map<String, String>> jobList = service.selectJobList();

		List<Map<String, String>> deptList = service.selectDeptList();

		Map<String, Object> emp = service.selectOneEmp(empId);

		request.setAttribute("jobList", jobList);
		request.setAttribute("deptList", deptList);
		request.setAttribute("emp", emp);

		// jsp 응답 페이지 설정
		return "emp/updateEmp";
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 사용자가 전송한 입력값 뽑기
		Map<String, String> param = new HashMap<>();
		String empId;
		param.put("empId", empId = request.getParameter("empId"));
		param.put("jobCode", request.getParameter("jobCode"));
		param.put("deptCode", request.getParameter("deptCode"));

		// 2. 업무로직(부서, 직급 변경)
		int result = service.updateEmp(param);

		// 3. 응답 페이지 선택
		return "redirect:/emp/updateEmp.do?empId=" + empId;

	}


}
