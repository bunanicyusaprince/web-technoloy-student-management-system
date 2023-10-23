package com.prince.ai.service.implementaion;

import com.prince.ai.dao.StudentRegistrationDao;
import com.prince.ai.service.StudentRegistrationService;
import com.prince.ai.model.StudentRegistration;

import java.util.List;
import java.util.UUID;

public class StudentRegistrationServiceImpl implements StudentRegistrationService {
    StudentRegistrationDao registrationDao = new StudentRegistrationDao();
    @Override
    public boolean createStudentRegistration(StudentRegistration registration) {
        return registrationDao.createStudentRegistration(registration);
    }

    @Override
    public List<StudentRegistration> registrationList() {
        return registrationDao.registrationList();
    }

    @Override
    public boolean deleteStudentRegistration(StudentRegistration registration) {
        return registrationDao.deleteStudentRegistration(registration);
    }

    @Override
    public StudentRegistration studRegistrationById(UUID id) {
        return registrationDao.studRegistrationById(id);
    }
}
