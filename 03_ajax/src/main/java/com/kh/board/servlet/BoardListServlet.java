package com.kh.board.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.vo.Board;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Board> boards = new ArrayList<>();

	public BoardListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		// session.setAttribute("id", 0); // session 스코프로 id를 저장하고 게시글 작성시 계속 증가됨 (사용x)
		session.setAttribute("boards", boards);

		// [강사님코드]
		// HttpSession session = request.getSession();
		// List<Board> list = (List<Board>)session.getAttribute("list");
		// request.setAttribute("list", list);

		request.getRequestDispatcher("/board/list.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
