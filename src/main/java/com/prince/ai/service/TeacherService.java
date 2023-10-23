package com.prince.ai.service;

import com.prince.ai.model.Teacher;

import java.util.List;

public interface TeacherService {
    public boolean addTeacher(Teacher teacher);
    public List<Teacher> teacherList();
    public boolean deleteTeacher(Teacher teacher);
    public Teacher findTeacherByName(String name);
}
