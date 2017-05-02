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
import model.pojo.FormType;
import model.pojo.StudentRequest;
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
    public int submitPetitionForm(StudentRequest s) {

        /*String hql = "INSERT INTO Employee(firstName, lastName, salary)"
                + "SELECT firstName, lastName, salary FROM old_employee";
        Query query = session.createQuery(hql);
        int result = query.executeUpdate();*/
        int result = 0;

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();

            Query query = session.createQuery("INSERT INTO StudentRequest` (`student_id`, `form_type_id`, `submit_time`, `current_stage`, `status`) VALUES (:student_id, :form_type_id, :submit_time, :current_stage, :status)");
            query.setParameter("student_id", 5715298);
            query.setParameter("form_type_id", 1);
            query.setParameter("submit_time", dateFormat.format(date));
            query.setParameter("current_stage", 0);
            query.setParameter("status", "w");

            result = query.executeUpdate();
            session.close();
        } catch (HibernateException e) {
        }

        return result;
    }

}
