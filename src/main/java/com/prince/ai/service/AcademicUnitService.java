package com.prince.ai.service;

import com.prince.ai.model.AcademicUnit;

import java.util.List;

public interface AcademicUnitService {
    public boolean insertUnit(AcademicUnit unit);
    public List<AcademicUnit> unitList();
    public boolean deleteUnit(AcademicUnit unit);
    public AcademicUnit findUnitByName(String name);
    public AcademicUnit findUnitById(String id);
}
