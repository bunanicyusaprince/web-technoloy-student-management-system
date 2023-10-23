package com.prince.ai.service;

import com.prince.ai.model.Student;

import java.util.List;

public interface StudentService {
    public boolean insertStudent(Student student);
    public List<Student> studentList();
    public boolean deleteStudent(Student student);
    public Student findStudentByRegNo(String regNo);
}
