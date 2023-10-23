package com.prince.ai.service.implementaion;

import com.prince.ai.dao.SemesterDao;
import com.prince.ai.model.Semester;
import com.prince.ai.service.SemesterService;

import java.util.List;

public class SemesterServiceImpl implements SemesterService {

    SemesterDao semesterDao = new SemesterDao();

    @Override
    public boolean addSemester(Semester semester) {
        return semesterDao.addSemester(semester);
    }

    @Override
    public List<Semester> semesterList() {
        return semesterDao.semesterList();
    }

    @Override
    public boolean deleteSemester(Semester semester) {
        return semesterDao.deleteSemester(semester);
    }

    @Override
    public Semester findSemesterByName(String name) {
        return semesterDao.findSemesterByName(name);
    }
}
