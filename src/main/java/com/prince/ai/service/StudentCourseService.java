package com.prince.ai.service;

import com.prince.ai.model.StudentCourse;

import java.util.List;

public interface StudentCourseService {
    public boolean insertStudentCourse(StudentCourse course);
    public List<StudentCourse> studentCourseList();
    public boolean deleteStudentCourse(StudentCourse course);
}
