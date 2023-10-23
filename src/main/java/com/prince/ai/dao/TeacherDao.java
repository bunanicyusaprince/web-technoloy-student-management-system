package com.prince.ai.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.prince.ai.model.Teacher;

import java.util.List;

public class TeacherDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public TeacherDao() {
    }

    public boolean addTeacher(Teacher teacher){
        Transaction tx = session.beginTransaction();
        session.merge(teacher);
        tx.commit();
        session.close();
        return true;
    }

    public List<Teacher> teacherList(){
        return session.createQuery("from Teacher ", Teacher.class).list();
    }

    public boolean deleteTeacher(Teacher teacher){
        Transaction tx = session.beginTransaction();
        session.remove(teacher);
        tx.commit();
        session.close();
        return true;
    }

    public Teacher findTeacherByName(String name) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Teacher WHERE name = :teacherName";
            Query<Teacher> query = session.createQuery(hql, Teacher.class);
            query.setParameter("teacherName", name);
            return query.uniqueResult();
        }
    }
}
