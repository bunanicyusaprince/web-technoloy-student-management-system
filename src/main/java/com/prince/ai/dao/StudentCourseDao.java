package com.prince.ai.dao;

import com.prince.ai.model.StudentCourse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class StudentCourseDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public StudentCourseDao() {
    }

    public boolean insertStudentCourse(StudentCourse course){
        Transaction tx = session.beginTransaction();
        session.merge(course);
        tx.commit();
        session.close();
        return true;
    }

    public List<StudentCourse> studentCourseList(){
        return session.createQuery("from StudentCourse", StudentCourse.class).list();
    }

    public boolean deleteStudentCourse(StudentCourse course){
        Transaction tx = session.beginTransaction();
        session.remove(course);
        tx.commit();
        session.close();
        return true;
    }
}
