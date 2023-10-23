package com.prince.ai.service.implementaion;

import com.prince.ai.dao.StudentDao;
import com.prince.ai.model.Student;
import com.prince.ai.service.StudentService;

import java.util.List;

public class StudentServiceImpl implements StudentService {
    StudentDao studentDao = new StudentDao();

    @Override
    public boolean insertStudent(Student student) {
        return studentDao.insertStudent(student);
    }

    @Override
    public List<Student> studentList() {
        return studentDao.studentList();
    }

    @Override
    public boolean deleteStudent(Student student) {
        return studentDao.deleteStudent(student);
    }

    @Override
    public Student findStudentByRegNo(String regNo) {
        return studentDao.findStudentByRegNo(regNo);
    }
}
