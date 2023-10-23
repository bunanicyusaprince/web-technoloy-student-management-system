package com.prince.ai.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.prince.ai.model.AcademicUnit;

import java.util.List;

public class AcademicUnitDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public AcademicUnitDao() {
    }

    public boolean insertUnit(AcademicUnit unit){
        Transaction tx = session.beginTransaction();
        session.persist(unit);
        tx.commit();
        session.close();
        return true;
    }

    public List<AcademicUnit> unitList(){
        return  session.createQuery("from AcademicUnit ", AcademicUnit.class).list();
    }

    public boolean deleteUnit(AcademicUnit unit){
        Transaction tx = session.beginTransaction();
        session.remove(unit);
        tx.commit();
        session.close();
        return true;
    }

    public AcademicUnit findUnitByName(String name) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM AcademicUnit WHERE name = :unitName";
            Query<AcademicUnit> query = session.createQuery(hql, AcademicUnit.class);
            query.setParameter("unitName", name);

            return query.uniqueResult();
        }
    }
    public AcademicUnit findUnitById(String id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM AcademicUnit WHERE name = :unitId";
            Query<AcademicUnit> query = session.createQuery(hql, AcademicUnit.class);
            query.setParameter("unitId", id);

            return query.uniqueResult();
        }
    }
}
