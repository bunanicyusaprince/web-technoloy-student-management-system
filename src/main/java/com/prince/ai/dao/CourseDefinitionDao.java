package com.prince.ai.dao;

import com.prince.ai.model.CourseDefinition;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class CourseDefinitionDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public CourseDefinitionDao() {
    }

    public boolean addCourseDefinition(CourseDefinition definition){
        Transaction tx = session.beginTransaction();
        session.merge(definition);
        tx.commit();
        session.close();
        return true;
    }

    public List<CourseDefinition> courseDefinitionList(){
        return session.createQuery("from CourseDefinition ", CourseDefinition.class).list();
    }

    public boolean deleteDefinition(CourseDefinition definition){
        Transaction tx = session.beginTransaction();
        session.remove(definition);
        tx.commit();
        session.close();
        return true;
    }

    public CourseDefinition findUnitByName(String name) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM CourseDefinition WHERE name = :definition";
            Query<CourseDefinition> query = session.createQuery(hql, CourseDefinition.class);
            query.setParameter("definition", name);

            return query.uniqueResult();
        }
    }
}
