package com.prince.ai.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class Course {
    @Id
    private UUID id;
    @ManyToOne
    @JoinColumn(name = "semesterId")
    private Semester semester;
    @ManyToOne
    @JoinColumn(name = "teacherId")
    private Teacher teacher;
    @OneToOne
    @JoinColumn(name = "definitionId")
    private CourseDefinition courseDefinition;

    public Course() {
    }

    public Course(UUID id, Semester semester, Teacher teacher, CourseDefinition courseDefinition) {
        this.id = id;
        this.semester = semester;
        this.teacher = teacher;
        this.courseDefinition = courseDefinition;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public CourseDefinition getCourseDefinition() {
        return courseDefinition;
    }

    public void setCourseDefinition(CourseDefinition courseDefinition) {
        this.courseDefinition = courseDefinition;
    }
}
