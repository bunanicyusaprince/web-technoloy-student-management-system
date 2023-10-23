package com.prince.ai.service.implementaion;

import com.prince.ai.dao.TeacherDao;
import com.prince.ai.model.Teacher;
import com.prince.ai.service.TeacherService;

import java.util.List;

public class TeacherServiceImpl implements TeacherService {
    TeacherDao teacherDao = new TeacherDao();

    @Override
    public boolean addTeacher(Teacher teacher) {
        return teacherDao.addTeacher(teacher);
    }

    @Override
    public List<Teacher> teacherList() {
        return teacherDao.teacherList();
    }

    @Override
    public boolean deleteTeacher(Teacher teacher) {
        return teacherDao.deleteTeacher(teacher);
    }

    @Override
    public Teacher findTeacherByName(String name) {
        return teacherDao.findTeacherByName(name);
    }
}
