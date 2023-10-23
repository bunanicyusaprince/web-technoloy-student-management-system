package com.prince.ai.bean;

import java.time.LocalDate;
import java.util.UUID;

public class SemesterBean {
    private UUID id;
    private String name;
    private LocalDate startDate;
    private LocalDate endDate;
    private String infoMessage;
    private String errorMessage;

    public SemesterBean() {
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
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
    public void clear(){
        this.setId(null);
        this.setName(null);
        this.setStartDate(null);
        this.setEndDate(null);
    }
}
