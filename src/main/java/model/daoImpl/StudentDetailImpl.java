/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.daoImpl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.dao.StudentDetailDao;
import model.pojo.ChangeSectionForm;
import model.pojo.FormType;
import model.pojo.PetitionForm;
import model.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author pncht
 */
public class StudentDetailImpl implements StudentDetailDao {

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
    public List<PetitionForm> getPetitionFormRequest(String status, String studentId) {
        List<PetitionForm> p = null;

        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("FROM PetitionForm P WHERE P.status = :st AND P.student = :id");
            query.setString("st", status);
            query.setInteger("id", Integer.parseInt(studentId));

            p = (List<PetitionForm>) query.list();
            session.close();
        } catch (HibernateException e) {
        }

        return p;
    }

    @Override
    public List<ChangeSectionForm> getChangeSectionForm(String status,String studentId) {
        List<ChangeSectionForm> c = null;

        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("FROM ChangeSectionForm P WHERE P.status = :st AND P.student = :id");
            query.setString("st", status);
            query.setInteger("id", Integer.parseInt(studentId));

            c = (List<ChangeSectionForm>) query.list();
            session.close();
        } catch (HibernateException e) {
        }

        return c;
    }

    @Override
    public boolean SubmitPetitionForm(PetitionForm p) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            session.save(p);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public boolean SubmitChangeSectionForm(ChangeSectionForm c) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            session.save(c);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

}
