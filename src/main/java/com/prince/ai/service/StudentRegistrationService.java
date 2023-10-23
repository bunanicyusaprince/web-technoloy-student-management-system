package com.prince.ai.service;

import com.prince.ai.model.StudentRegistration;

import java.util.List;
import java.util.UUID;

public interface StudentRegistrationService {
    public boolean createStudentRegistration(StudentRegistration registration);
    public List<StudentRegistration> registrationList();
    public boolean deleteStudentRegistration(StudentRegistration registration);
    public StudentRegistration studRegistrationById(UUID id);
}
