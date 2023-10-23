package com.prince.ai.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.UUID;

@Entity
public class Student {
    @Id
    private UUID id;
    private String regNo;
    private String fullNames;
    private LocalDate dob;

    public Student() {
    }

    public Student(UUID id, String regNo, String fullNames, LocalDate dob) {
        this.id = id;
        this.regNo = regNo;
        this.fullNames = fullNames;
        this.dob = dob;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public String getFullNames() {
        return fullNames;
    }

    public void setFullNames(String fullNames) {
        this.fullNames = fullNames;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }
}
