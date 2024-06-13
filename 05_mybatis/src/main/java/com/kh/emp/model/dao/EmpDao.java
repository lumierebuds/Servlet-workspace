package com.kh.emp.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class EmpDao {

	public List<Map<String, Object>> selectAllEmp(SqlSession session) {

		return session.selectList("emp.selectAllEmp");
	}

	public List<Map<String, Object>> search1(SqlSession session, Map<String, Object> param) {

		return session.selectList("emp.search1", param);
	}

	public List<Map<String, Object>> search2(SqlSession session, Map<String, Object> param) {

		return session.selectList("emp.search2", param);
	}

	public List<Map<String, String>> selectJobList(SqlSession session) {

		return session.selectList("emp.selectJobList");
	}

	public List<Map<String, String>> selectDeptList(SqlSession session) {

		return session.selectList("emp.selectDeptList");
	}

	public List<Map<String, Object>> search3(SqlSession session, Map<String, Object> param) {

		return session.selectList("emp.search3", param);
	}

	public Map<String, Object> selectOneEmp(SqlSession session, String empId) {

		return session.selectOne("emp.selectOneEmp", empId);
	}

	public int updateEmp(SqlSession session, Map<String, String> param) {

		return session.update("emp.updateEmp", param);
	}

}
