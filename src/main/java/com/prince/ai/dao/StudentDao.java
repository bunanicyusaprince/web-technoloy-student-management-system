package com.prince.ai.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.prince.ai.model.Student;

import java.util.List;

public class StudentDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public StudentDao() {
    }

    public boolean insertStudent(Student student){
        Transaction tx = session.beginTransaction();
        session.merge(student);
        tx.commit();
        session.close();
        return true;
    }

    public List<Student> studentList(){
        return session.createQuery("from Student", Student.class).list();
    }

    public boolean deleteStudent(Student student){
        Transaction tx = session.beginTransaction();
        session.remove(student);
        tx.commit();
        session.close();
        return true;
    }

    public Student findStudentByRegNo(String regNo){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Student WHERE regNo = :regNo";
            Query<Student> query = session.createQuery(hql, Student.class);
            query.setParameter("regNo", regNo);
            return query.uniqueResult();
        }
    }
}
