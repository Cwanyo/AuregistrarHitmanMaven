/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.daoImpl;

import java.util.List;
import model.dao.AuthorityDetailDao;
import model.pojo.FormType;
import model.pojo.PetitionForm;
import model.pojo.StudentRequest;
import model.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author SONY
 */
public class AuthorityDetailImpl implements AuthorityDetailDao {

    @Override
    public List<FormType> getListForm() {
        List<FormType> f = null;

        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("FROM FormType");

            f = (List<FormType>) query.list();
            session.close();
        } catch (HibernateException e) {
        }

        return f;
    }

    @Override
    public List<StudentRequest> getStudentRequests(String status) {
        List<StudentRequest> sr = null;

        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("FROM StudentRequest");
            //query.setParameter(":st", status);

            sr = (List<StudentRequest>) query.list();
            session.close();
        } catch (HibernateException e) {
        }

        return sr;
    }

    @Override
    public List<PetitionForm> getPetitionFormRequest() {
        List<PetitionForm> p = null;
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("FROM PetitionForm");
            
            p = (List<PetitionForm>) query.list();
            session.close();
        } catch (HibernateException e) {
        }
        
        return p;
    }

}