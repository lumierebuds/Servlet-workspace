package com.kh.board.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// [강사님 코드]
		// HttpSession session = request.getSession();
		// List<Board> list = (List<Board>) session.getAttribute("list");
		// if(list == null){
		// list = new ArrayList<>();
		// list.add(new Board(1, "kh게시판 1번 게시글", "admin", "zzzzz", new Date()));
		// list.add(new Board(2, "kh게시판 2번글 ", "admin", "bbbbbbbbbbb", new Date()));
		// list.add(new Board(3, "kh게시판 1번글 ", "mkm", "aaaaaaaaaaaaaaaaa", new Date()));
		// list.add(new Board(4, "kh게시판 4번글 ", "user01", "이스터에그발견", new Date()));
		// list.add(new Board(5, "kh게시판 5번글 ", "user02", "zzzzzzzzzzz", new Date()));
		// session.setAttribute("list", list); // sessionScope에 list라는 변수가 존재하지 않을때
		// }

		request.getRequestDispatcher("/board/board.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
