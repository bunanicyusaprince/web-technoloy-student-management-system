package com.prince.ai.service.implementaion;

import com.prince.ai.dao.CourseDao;
import com.prince.ai.model.Course;
import com.prince.ai.service.CourseService;

import java.util.List;
import java.util.UUID;

public class CourseServiceImpl implements CourseService {

    CourseDao courseDao = new CourseDao();

    @Override
    public boolean insertCourse(Course course) {
        return courseDao.insertCourse(course);
    }

    @Override
    public List<Course> courseList() {
        return courseDao.courseList();
    }

    @Override
    public boolean deleteCourse(Course course) {
        return courseDao.deleteCourse(course);
    }

    @Override
    public Course courseById(UUID id) {
        return courseDao.courseById(id);
    }
}
