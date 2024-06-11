package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

@WebServlet("/notice/detail")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDetailController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클릭했을때의 게시글 번호
		int noticeNo = Integer.parseInt(request.getParameter("nno"));

		NoticeService service = new NoticeService();

		int result = service.increaseCount(noticeNo); // UPDATE

		if (result > 0) { // 조회수증가 성공시 게시글 상세페이지 조회
			Notice n = service.selectNotice(noticeNo); // SELECT

			request.setAttribute("n", n);
			request.getRequestDispatcher("/WEB-INF/views/notice/noticeDetailView.jsp").forward(request, response);

		} else { // 실패시 에러페이지로
			request.setAttribute("errorMsg", "공지사항 조회 실패");
			request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
