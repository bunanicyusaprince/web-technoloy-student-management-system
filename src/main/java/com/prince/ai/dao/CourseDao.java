package com.prince.ai.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.prince.ai.model.Course;

import java.util.List;
import java.util.UUID;

public class CourseDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public CourseDao() {
    }

    public boolean insertCourse(Course course){
        Transaction tx = session.beginTransaction();
        session.merge(course);
        tx.commit();
        session.close();
        return true;
    }

    public List<Course> courseList(){
        return session.createQuery("from Course ", Course.class).list();
    }

    public boolean deleteCourse(Course course){
        Transaction tx = session.beginTransaction();
        session.remove(course);
        tx.commit();
        session.close();
        return true;
    }

    public Course courseById(UUID id){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM StudentRegistration WHERE id = :id";
            Query<Course> query = session.createQuery(hql, Course.class);
            query.setParameter("id", id);

            return query.uniqueResult();
        }
    }
}
