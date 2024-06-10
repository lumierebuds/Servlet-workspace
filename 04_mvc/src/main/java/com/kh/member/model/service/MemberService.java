package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import static com.kh.common.JDBCTemplate.*;

public class MemberService {

	public Member login(String userId, String userPwd) {
		Connection conn = getConnection();

		return new MemberDao().login(conn, userId, userPwd);
	}

	public int idCheck(String checkId) {
		Connection conn = getConnection();

		int count = new MemberDao().idCheck(conn, checkId);

		close(conn);
		return count;
	}

}
