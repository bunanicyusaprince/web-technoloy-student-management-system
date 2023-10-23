package com.prince.ai.service;

import com.prince.ai.model.Course;

import java.util.List;
import java.util.UUID;

public interface CourseService {
    public boolean insertCourse(Course course);
    public List<Course> courseList();
    public boolean deleteCourse(Course course);
    public Course courseById(UUID id);
}
