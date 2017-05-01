/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.daoImpl;

import java.util.List;
import model.dao.StudentDetailDao;
import model.pojo.FormType;
import model.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author pncht
 */
public class StudentDetailImpl implements StudentDetailDao{

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
    
}
