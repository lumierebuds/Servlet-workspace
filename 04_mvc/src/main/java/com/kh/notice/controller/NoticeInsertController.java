package com.kh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

@WebServlet("/notice/insert")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NoticeInsertController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/notice/noticeEnrollForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// userNo, title, content
		String userNo = request.getParameter("userNo");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		Notice n = new Notice();
		n.setNoticeTitle(title);
		n.setNoticeContent(content);
		n.setNoticeWriter(userNo);

		int result = new NoticeService().insertNotice(n);

		if (result > 0) { // 테이블 추가 성공
			request.getSession().setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/notice/list"); // /mvc/notice/list
		} else { // 실패
			request.setAttribute("errorMsg", "등록실패");
			request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp");
		}

	}

}
