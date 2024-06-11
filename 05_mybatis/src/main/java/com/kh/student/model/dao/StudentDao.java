package com.kh.student.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.student.model.vo.Student;

public class StudentDao {

	public int insertStudent(SqlSession session, Student student) {

		// sql.mappers.student-mapper.xml 아래의 쿼리문을 찾아서 매핑
		// [namespace].[id]
		return session.insert("student.insertStudent", student);

	}

}
