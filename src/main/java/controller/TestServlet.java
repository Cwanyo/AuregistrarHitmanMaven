/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.daoImpl.AuthorityDetailImpl;
import model.daoImpl.StudentDetailImpl;
import model.pojo.Authority;
import model.pojo.ChangeSectionForm;
import model.pojo.ChangeSectionFormId;
import model.pojo.FormType;
import model.pojo.Major;
import model.pojo.PetitionForm;
import model.pojo.PetitionFormId;
import model.pojo.Student;
import model.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author C.wan_yo
 */
public class TestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //This use for TESTING ONLY
        HttpSession hs = request.getSession(true);
        
        List<ChangeSectionForm> p = new StudentDetailImpl().getChangeSectionForm("w", 5715298);
        
        if (p == null) {
            System.out.println("NULKKKKK+");
        } else {
            System.out.println(p.size());
        }
        //PetitionFormId pid = new PetitionFormId(submitTime, 0);
        //PetitionForm p = new PetitionForm(id, student, 0, status, 0)
        /*Student s = (Student) hs.getAttribute("studentInfo");
        Timestamp now = new Timestamp(new Date().getTime());
        PetitionFormId pid = new PetitionFormId(now, 5715298);
        PetitionForm p = new PetitionForm(pid, s, 1, "w", 1,"","","");
        
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            session.save(p);
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            System.out.println("ffffff");
        }*/

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
