package com.kh.student.model.service;

import static com.kh.common.MybatisTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.kh.student.model.dao.StudentDao;
import com.kh.student.model.vo.Student;

public class StudentService {

	private StudentDao dao = new StudentDao();

	public int insertStudent(Student student) {
		
		SqlSession session = getSqlSession();
		
		int result = dao.insertStudent(session, student);
		
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();

		return result;

	}

}
