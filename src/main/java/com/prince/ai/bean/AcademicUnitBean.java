package com.prince.ai.bean;

import com.prince.ai.model.EAcademicUnit;

import java.util.UUID;

public class AcademicUnitBean {
    private UUID id;
    private String code;
    private String name;
    private EAcademicUnit unit;
    private AcademicUnitBean parent;
    private String infoMessage;
    private String errorMessage;

    public AcademicUnitBean() {
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

    public AcademicUnitBean getParent() {
        return parent;
    }

    public void setParent(AcademicUnitBean parent) {
        this.parent = parent;
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
