package com.prince.ai.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class AcademicUnit {
    @Id
    private UUID id;
    @Column(unique = true)
    private String code;
    private String name;
    @Enumerated(EnumType.STRING)
    private EAcademicUnit unit;
    @ManyToOne
    @JoinColumn(name = "parentId")
    private AcademicUnit parent;

    public AcademicUnit() {
    }

    public AcademicUnit(UUID id, String code, String name, EAcademicUnit unit, AcademicUnit parent) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.unit = unit;
        this.parent = parent;
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

    public EAcademicUnit getUnit() {
        return unit;
    }

    public void setUnit(EAcademicUnit unit) {
        this.unit = unit;
    }

    public AcademicUnit getParent() {
        return parent;
    }

    public void setParent(AcademicUnit parent) {
        this.parent = parent;
    }
}
