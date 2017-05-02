/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.daoImpl;

import model.dao.LoginDao;
import model.pojo.Authority;
import model.pojo.Student;
import model.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author C.wan_yo
 */
public class LoginDaoImpl implements LoginDao {

    @Override
    public Student loginStudent(String email) {
        
        Student s = null;
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("FROM Student s WHERE s.email = :email");
            query.setString("email", email);
            
            s = (Student) query.uniqueResult();
            
            session.close();
        } catch (HibernateException e) {
        }
        
        return s;
    }

    @Override
    public Authority loginAuthority(String email) {
        
        Authority a = null;
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("FROM Authority a WHERE a.email = :email");
            query.setString("email", email);
            
            a = (Authority) query.uniqueResult();
            
            session.close();
        } catch (HibernateException e) {
        }
        
        return a;
    }
    
}
