package com.prince.ai.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.prince.ai.model.Semester;

import java.util.List;

public class SemesterDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public SemesterDao() {
    }

    public boolean addSemester(Semester semester){
        Transaction tx = session.beginTransaction();
        session.merge(semester);
        tx.commit();
        session.close();
        return true;
    }
    public List<Semester> semesterList(){
        return session.createQuery("from Semester", Semester.class).list();
    }

    public boolean deleteSemester(Semester semester){
        Transaction tx = session.beginTransaction();
        session.remove(semester);
        tx.commit();
        session.close();
        return true;
    }

    public Semester findSemesterByName(String name) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Semester WHERE name = :semName";
            Query<Semester> query = session.createQuery(hql, Semester.class);
            query.setParameter("semName", name);

            return query.uniqueResult();
        }
    }
}
