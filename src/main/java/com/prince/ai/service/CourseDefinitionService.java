package com.prince.ai.service;

import com.prince.ai.model.CourseDefinition;

import java.util.List;

public interface CourseDefinitionService {
    public boolean addCourseDefinition(CourseDefinition definition);
    public List<CourseDefinition> courseDefinitionList();
    public boolean deleteDefinition(CourseDefinition definition);
    public CourseDefinition findUnitByName(String name);
}
