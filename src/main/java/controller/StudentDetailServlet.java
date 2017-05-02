/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import model.pojo.FormType;

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

        switch (userPath) {
            // Back to index
            case "/student/index":
                session.setAttribute("petitionform", null);
                System.out.println("redirected-------->");
                System.out.println(userPath);
                break;
            // if petition list is requested
            case "/student/petition":
                List<FormType> f = new StudentDetailImpl().getListForm();
                session.setAttribute("petitionform", f);
                System.out.println("redirected-------->");
                System.out.println(userPath);
                break;
            // if student submit petition form
            case "/student/petition_form":
                //StudentRequest s = new StudentRequest(new StudentRequestId(5715298,1,new Date()), formType, student, 0, userPath);
                //int r = new StudentDetailImpl().submitPetitionForm(null);
                //System.out.println("stage:"+r); 
                break;
            default:
                break;
        }

        try {
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
