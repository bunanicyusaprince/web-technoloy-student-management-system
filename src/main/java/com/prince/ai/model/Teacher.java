package com.prince.ai.model;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;

import java.util.UUID;

@Entity
public class Teacher {
    @Id
    private UUID id;
    private String code;
    private String name;
    @Enumerated(EnumType.STRING)
    private EQualification qualification;
    private String type;

    public Teacher() {
    }

    public Teacher(UUID id, String code, String name, EQualification qualification, String type) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.qualification = qualification;
        this.type = type;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public EQualification getQualification() {
        return qualification;
    }

    public void setQualification(EQualification qualification) {
        this.qualification = qualification;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
