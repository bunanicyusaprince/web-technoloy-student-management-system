package com.prince.ai.service.implementaion;

import com.prince.ai.dao.AcademicUnitDao;
import com.prince.ai.service.AcademicUnitService;
import com.prince.ai.model.AcademicUnit;

import java.util.List;

public class AcademicUnitServiceImpl implements AcademicUnitService {

    AcademicUnitDao unitDao = new AcademicUnitDao();

    @Override
    public boolean insertUnit(AcademicUnit unit) {
        return unitDao.insertUnit(unit);
    }

    @Override
    public List<AcademicUnit> unitList() {
        return unitDao.unitList();
    }

    @Override
    public boolean deleteUnit(AcademicUnit unit) {
        return unitDao.deleteUnit(unit);
    }

    @Override
    public AcademicUnit findUnitByName(String name) {
        return unitDao.findUnitByName(name);
    }

    @Override
    public AcademicUnit findUnitById(String id) {
        return unitDao.findUnitById(id);
    }
}
