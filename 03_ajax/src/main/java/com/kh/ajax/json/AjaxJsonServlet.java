package com.kh.ajax.json;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.ajax.member.model.vo.Member;

@WebServlet("/json")
public class AjaxJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxJsonServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * JSON(Javascript Object Notation) - 비동기 통신에서 자주 사용되는 포맷 - 순수 문자열로 이루어져 있어서
		 * 가독성이 좋고, 가볍기 때문에 플랫폼간의 데이터교환에 자주 사용된다. - json simple 라이브러리를 기반으로 많은 Json
		 * 라이브러리가 만들어졌다.
		 * 
		 */

		// 1. json 라이브러리 없이 만들기
		// Member m = new Member("gone", "김고은", "김고은.jpg");
		//
		// response.setContentType("application/json; charset=utf-8");
		// String jsonMember = "{\"id\" : \"" + m.getId() + "\", \"name\" : \"" +
		// m.getName() + "\",\"profile\" : \""
		// + m.getProfile() + "\"}";
		//
		// PrintWriter out = response.getWriter();
		// out.print(jsonMember); // toString이 호출된 결과가 출력된다.

		// 2. JSON-SIMPLE 라이브러리 사용

		// Member m = new Member("gone", "김고은", "김고은.jpg");
		// JSONObject obj = new JSONObject();
		// obj.put("name", m.getName());
		// obj.put("id", m.getId());
		// obj.put("profile", m.getProfile());
		//
		// response.setContentType("application/json; charset=utf-8");
		// PrintWriter out = response.getWriter();
		// out.print(obj);

		// 3. gson을 활용하여 json객체 만들기 자바 객체 -> JSON -> 자바스크립트 객체
		List<Member> list = new ArrayList<>();
		list.add(new Member("hwan", "황제성", "hwang.jpg"));
		list.add(new Member("julia", "줄리아 로버츠", "juliaRoberts.jpg"));
		list.add(new Member("gone", "김고은", "김고은.jpg"));
		list.add(new Member("daft", "다프트펑크", "daftpunk.jpg"));

		// 사용자 입력값(searchId)
		String searchId = request.getParameter("searchId");
		// 검색어와 일치하는 ID가 존재하는 경우 일치하는 회원정보 보관
		Member member = null;
		if (searchId != null && !searchId.equals("")) {
			for (Member m : list) { // 객체 배열을 순회해서 id값을 확인한다.
				if (m.getId().equals(searchId)) { // id값에 해당하면 회원을 객체에 저장
					member = m;
					break;
				}
			}
		}

		Gson gson = new Gson();
		String jsonStr = gson.toJson(member);

		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jsonStr);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
