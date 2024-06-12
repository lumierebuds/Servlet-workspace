package com.kh.student.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.student.model.vo.Student;

public class StudentDao {

	public int insertStudent(SqlSession session, Student student) {

		// sql.mappers.student-mapper.xml 아래의 쿼리문을 찾아서 매핑
		// [namespace].[id]
		return session.insert("student.insertStudent", student);

	}

	public int insertStudentMap(SqlSession session, Map<String, Object> student) {

		return session.insert("student.insertStudentMap", student);
	}

	public int selectStudentCount(SqlSession session) {
		return session.selectOne("student.selectStudentCount");
		// select에 해당하는 기능을 하는 메서드가 다양하다
		// 이 중에서 필요한 것이 있을때 쓴다.
	}

	public Student selectOneStudent(SqlSession session, int no) {

		return session.selectOne("student.selectOneStudent", no);
	}

	public Map<String, Object> selectOneStudentMap(SqlSession session, int no) {
		
		return session.selectOne("student.selectOneStudentMap", no);
	}

	public int updateStudent(SqlSession session, Student student) {

		return session.update("student.updateStudent", student);
	}

	public int deleteStudent(SqlSession session, int no) {

		return session.delete("student.deleteStudent", no);
	}

	public List<Student> selectStudentList(SqlSession session) {

		return session.selectList("student.selectStudentList"); // 조회결과가 없을때 빈 컬렉션 반환

	}

	public List<Map<String, Object>> selectStudentListMap(SqlSession session) {
		return session.selectList("student.selectStudentListMap");
	}

}
