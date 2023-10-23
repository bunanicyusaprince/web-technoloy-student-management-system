package com.prince.ai.bean;

import com.prince.ai.model.ERegistrationStatus;
import jakarta.persistence.*;
import com.prince.ai.model.AcademicUnit;
import com.prince.ai.model.Semester;
import com.prince.ai.model.Student;

import java.time.LocalDate;
import java.util.UUID;

public class StudentRegistrationBean {
    private UUID id;
    private LocalDate registrationDate;
    private Student student;
    @OneToOne
    @JoinColumn(name = "unitId")
    private AcademicUnit unit;
    private Semester semester;
    private ERegistrationStatus status;
    private String infoMessage;
    private String errorMessage;

    public StudentRegistrationBean() {
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public LocalDate getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(LocalDate registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public AcademicUnit getUnit() {
        return unit;
    }

    public void setUnit(AcademicUnit unit) {
        this.unit = unit;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }

    public ERegistrationStatus getStatus() {
        return status;
    }

    public void setStatus(ERegistrationStatus status) {
        this.status = status;
    }

    public String getInfoMessage() {
        return infoMessage;
    }

    public void setInfoMessage(String infoMessage) {
        this.infoMessage = infoMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
