/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.daoImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.dao.AuthorityDetailDao;
import model.pojo.ChangeSectionForm;
import model.pojo.ChangeSectionFormId;
import model.pojo.FormType;
import model.pojo.PetitionForm;
import model.pojo.PetitionFormId;
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
    public List<PetitionForm> getPetitionFormRequest(String status) {
        List<PetitionForm> p = null;

        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("FROM PetitionForm P WHERE P.status = :st");
            query.setString("st", status);

            p = (List<PetitionForm>) query.list();
            session.close();
        } catch (HibernateException e) {
        }

        return p;
    }

    @Override
    public List<ChangeSectionForm> getChangeSectionForm(String status) {
        List<ChangeSectionForm> c = null;

        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("FROM ChangeSectionForm C WHERE C.status = :st");
            query.setString("st", status);

            c = (List<ChangeSectionForm>) query.list();
            session.close();
        } catch (HibernateException e) {
        }

        return c;
    }

    @Override
    public List<PetitionForm> getPetitionFormsRequestForRole(String role, String status) {
        String[] flow = new String[]{"student", "advisor", "dean"};
        List<PetitionForm> ptemp = getPetitionFormRequest("waiting");
        List<PetitionForm> presult = new ArrayList<>();

        for (int i = 0; i < ptemp.size(); i++) {
            //if the form in the stage of the role
            if (role.toLowerCase().equals(flow[ptemp.get(i).getCurrentStage()])) {
                presult.add(ptemp.get(i));
            }
        }

        return presult;
    }

    @Override
    public List<ChangeSectionForm> getChangeSectionFormForRole(String role, String status) {
        String[] flow = new String[]{"student", "dean"};
        List<ChangeSectionForm> ctemp = getChangeSectionForm("waiting");
        List<ChangeSectionForm> cresult = new ArrayList<>();

        for (int i = 0; i < ctemp.size(); i++) {
            //if the form in the stage of the role
            if (role.toLowerCase().equals(flow[ctemp.get(i).getCurrentStage()])) {
                cresult.add(ctemp.get(i));
            }
        }

        return cresult;
    }

    @Override
    public boolean updatePetitionForm(int studentId, String date, String auSig, String role, String type) {

        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            PetitionForm p = (PetitionForm) session.load(PetitionForm.class, new PetitionFormId(Timestamp.valueOf(date), studentId));
            session.getTransaction().commit();

            if (role.toLowerCase().equals("advisor")) {
                p.setAdvisorApprovalSignature(auSig);
                p.setAdvisorApprovalDate(new Timestamp(new Date().getTime()));
            } else if (role.toLowerCase().equals("dean")) {
                p.setDeanApprovalSignature(auSig);
                p.setDeanApprovalDate(new Timestamp(new Date().getTime()));
            }
            p.setCurrentStage(p.getCurrentStage() + 1);

            if (type.equals("approved")) {
                if (p.getCurrentStage() == 3) {
                    p.setStatus("approved");
                }
            }else if(type.equals("suspend")){
                p.setStatus("suspend");
            }
            
            session.beginTransaction();
            session.update(p);
            session.getTransaction().commit();
            
            session.close();
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public boolean updateChangeSectionForm(int studentId, String date, String auSig, String role, String type) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            ChangeSectionForm c = (ChangeSectionForm) session.load(ChangeSectionForm.class, new ChangeSectionFormId(Timestamp.valueOf(date), studentId));
            session.getTransaction().commit();

            if (role.toLowerCase().equals("dean")) {
                c.setDeanApprovalSignature(auSig);
                c.setDeanApprovalDate(new Timestamp(new Date().getTime()));
            }
            c.setCurrentStage(c.getCurrentStage() + 1);

            if (type.equals("approved")) {
                if (c.getCurrentStage() == 2) {
                    c.setStatus("approved");
                }
            }else if(type.equals("suspend")){
                c.setStatus("suspend");
            }
            
            session.beginTransaction();
            session.update(c);
            session.getTransaction().commit();
            
            session.close();
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

}
