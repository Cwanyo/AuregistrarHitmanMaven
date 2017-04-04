/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.daoImpl;

import java.util.ArrayList;
import java.util.List;
import model.dao.StudentDao;
import model.pojo.Student;
import model.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
/**
 *
 * @author C.wan_yo
 */
public class StudentDaoImpl implements StudentDao{

    @Override
    public void addStudent(Student student) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Student> showAllStudents() {
        List<Student> studentList = new ArrayList();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("From Student");
            studentList = query.list();
            session.close();
            
            return studentList;
        } catch (HibernateException e) {
            return null;
        }
        
    }
    
    
    
}
