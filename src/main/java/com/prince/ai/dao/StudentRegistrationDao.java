package com.prince.ai.dao;

import org.hibernate.query.Query;
import com.prince.ai.model.StudentRegistration;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import java.util.UUID;

public class StudentRegistrationDao {
    Session session = HibernateUtil.getSessionFactory().openSession();
    public StudentRegistrationDao() {
    }

    public boolean createStudentRegistration(StudentRegistration registration){
        Transaction tx = session.beginTransaction();
        session.merge(registration);
        tx.commit();
        session.close();
        return true;
    }

    public List<StudentRegistration> registrationList() {
        return session.createQuery("from StudentRegistration", StudentRegistration.class).list();
    }

    public boolean deleteStudentRegistration(StudentRegistration registration){
        Transaction tx = session.beginTransaction();
        session.remove(registration);
        tx.commit();
        session.close();
        return true;
    }

    public StudentRegistration studRegistrationById(UUID id){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM StudentRegistration WHERE id = :id";
            Query<StudentRegistration> query = session.createQuery(hql, StudentRegistration.class);
            query.setParameter("id", id);

            return query.uniqueResult();
        }
    }
}
