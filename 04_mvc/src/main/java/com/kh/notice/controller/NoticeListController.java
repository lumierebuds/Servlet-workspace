package com.kh.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

@WebServlet("/notice/list")
public class NoticeListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
	public NoticeListController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 공지사항 전체 리스트 조회 후, 조회결과(List)를 request에 담아서
		// 응답페이지로 forward
		List<Notice> list = new NoticeService().selectNoticeList();

		request.setAttribute("list", list);

		request.getRequestDispatcher("/WEB-INF/views/notice/noticeListView.jsp").forward(request, response);

	}



}
