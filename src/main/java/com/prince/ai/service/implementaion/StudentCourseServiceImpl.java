package com.prince.ai.service.implementaion;

import com.prince.ai.dao.StudentCourseDao;
import com.prince.ai.service.StudentCourseService;
import com.prince.ai.model.StudentCourse;

import java.util.List;

public class StudentCourseServiceImpl implements StudentCourseService {
    StudentCourseDao courseDao = new StudentCourseDao();
    @Override
    public boolean insertStudentCourse(StudentCourse course) {
        return courseDao.insertStudentCourse(course);
    }

    @Override
    public List<StudentCourse> studentCourseList() {
        return courseDao.studentCourseList();
    }

    @Override
    public boolean deleteStudentCourse(StudentCourse course) {
        return courseDao.deleteStudentCourse(course);
    }
}
