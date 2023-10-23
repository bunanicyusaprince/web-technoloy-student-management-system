package com.prince.ai.service.implementaion;

import com.prince.ai.dao.CourseDefinitionDao;
import com.prince.ai.model.CourseDefinition;
import com.prince.ai.service.CourseDefinitionService;

import java.util.List;

public class CourseDefinitionServiceImpl implements CourseDefinitionService {
    CourseDefinitionDao definitionDao = new CourseDefinitionDao();

    @Override
    public boolean addCourseDefinition(CourseDefinition definition) {
        return definitionDao.addCourseDefinition(definition);
    }

    @Override
    public List<CourseDefinition> courseDefinitionList() {
        return definitionDao.courseDefinitionList();
    }

    @Override
    public boolean deleteDefinition(CourseDefinition definition) {
        return definitionDao.deleteDefinition(definition);
    }

    @Override
    public CourseDefinition findUnitByName(String name) {
        return definitionDao.findUnitByName(name);
    }
}
