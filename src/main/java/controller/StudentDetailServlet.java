/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.daoImpl.StudentDetailImpl;
import model.pojo.ChangeSectionForm;
import model.pojo.ChangeSectionFormId;
import model.pojo.FormType;
import model.pojo.PetitionForm;
import model.pojo.PetitionFormId;
import model.pojo.Student;

/**
 *
 * @author pncht
 */
public class StudentDetailServlet extends HttpServlet {

    public String userPath;

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
        userPath = request.getServletPath().toLowerCase();
        HttpSession session = request.getSession(true);

        if (userPath.equals("/student/index")) {
            session.setAttribute("petitionform", null);
        } else if (userPath.equals("/student/petition")) {
            List<FormType> f = new StudentDetailImpl().getListForm();
            session.setAttribute("petitionform", f);
        } else if (userPath.equals("/student/petition_form")) {
            Student student = (Student) session.getAttribute("studentInfo");
            int requestOption = Integer.parseInt(request.getParameter("requestoption"));
            String requestMessage = request.getParameter("requestmessage");
            String requestReason = request.getParameter("requestreason");
            PetitionFormId pid = new PetitionFormId(new Timestamp(new Date().getTime()), student.getId());
            
            PetitionForm p = new PetitionForm(pid, student, 0, "w", requestOption, requestMessage, requestReason, "");
            boolean status = new StudentDetailImpl().SubmitPetitionForm(p);
            System.out.println("submit petition_form : " + status);
        } else if (userPath.equals("/student/change_section_form")) {
            Student student = (Student) session.getAttribute("studentInfo");
            int requestOption = Integer.parseInt(request.getParameter("requestoption"));
            String courseNumber = request.getParameter("coursenumber");
            String sectionNumber = request.getParameter("sectionnumber");
            String requestMessage = request.getParameter("requestmessage");
            ChangeSectionFormId pid = new ChangeSectionFormId(new Timestamp(new Date().getTime()), student.getId());
            
            ChangeSectionForm c = new ChangeSectionForm(pid, student, 0, "w", requestOption, courseNumber, sectionNumber, requestMessage, "");
            boolean status = new StudentDetailImpl().SubmitChangeSectionForm(c);
            System.out.println("submit change_section_form : " + status);
        }

        try {
            System.out.println("redirected-------->");
            System.out.println(userPath);
            request.getRequestDispatcher("/WEB-INF/view/student/index.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
        }

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
