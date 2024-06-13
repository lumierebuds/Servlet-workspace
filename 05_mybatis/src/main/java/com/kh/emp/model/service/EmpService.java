package com.kh.emp.model.service;

import static com.kh.common.MybatisTemplate.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.emp.model.dao.EmpDao;

public class EmpService {

	private EmpDao dao = new EmpDao();

	public List<Map<String, Object>> selectAllEmp() {
		SqlSession session = getSqlSession();

		List<Map<String, Object>> list = dao.selectAllEmp(session);

		session.close();
		return list;
	}

	public List<Map<String, Object>> search1(Map<String, Object> param) {
		SqlSession session = getSqlSession();

		List<Map<String, Object>> list = dao.search1(session, param);

		session.close();
		return list;
	}

	public List<Map<String, Object>> search2(Map<String, Object> param) {
		SqlSession session = getSqlSession();

		List<Map<String, Object>> list = dao.search2(session, param);

		session.close();
		return list;
	}

	public List<Map<String, String>> selectJobList() {
		SqlSession session = getSqlSession();

		List<Map<String, String>> jobList = dao.selectJobList(session);

		session.close();
		return jobList;
	}

	public List<Map<String, String>> selectDeptList() {
		SqlSession session = getSqlSession();

		List<Map<String, String>> deptList = dao.selectDeptList(session);

		session.close();
		return deptList;
	}

	public List<Map<String, Object>> search3(Map<String, Object> param) {

		SqlSession session = getSqlSession();

		List<Map<String, Object>> list = dao.search3(session, param);

		session.close();
		return list;
	}

	public Map<String, Object> selectOneEmp(String empId) {
		SqlSession session = getSqlSession();

		Map<String, Object> emp = dao.selectOneEmp(session, empId);

		session.close();
		return emp;
	}

	public int updateEmp(Map<String, String> param) {

		SqlSession session = getSqlSession();

		int result = dao.updateEmp(session, param);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}
}
