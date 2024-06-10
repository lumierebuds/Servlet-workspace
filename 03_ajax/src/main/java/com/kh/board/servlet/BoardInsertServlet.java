package com.kh.board.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.vo.Board;

@WebServlet("/board/insert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardInsertServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/board/insert.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 게시글 생성시 예외처리
		try {
			HttpSession session = request.getSession();
			List<Board> boards = (List) session.getAttribute("boards"); // 세션스코프로 저장하기 위해서 가져온 속성

			Board board = new Board();
			board.setNo(boards.size() + 1); // [추가되는 게시물의 크기]
			board.setTitle(request.getParameter("title"));
			board.setNickname(request.getParameter("nickname"));
			board.setContent(request.getParameter("content"));
			board.setCreateDate(new Date());

			boards.add(board);

			session.setAttribute("boards", boards);

			response.setContentType("text/plain; charset=utf-8");
			response.getWriter().print("게시글 등록성공!");

			// request.getRequestDispatcher("/board/list.jsp").forward(request, response);

		} catch (Exception e) {
			response.getWriter().print("게시글 등록실패");
		}

	}

}
