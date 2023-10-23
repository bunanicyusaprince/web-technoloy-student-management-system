package com.prince.ai.service;

import com.prince.ai.model.Semester;

import java.util.List;

public interface SemesterService {

    public boolean addSemester(Semester semester);
    public List<Semester> semesterList();
    public boolean deleteSemester(Semester semester);
    public Semester findSemesterByName(String name);
}
