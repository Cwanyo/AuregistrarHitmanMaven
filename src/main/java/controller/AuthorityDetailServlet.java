/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.daoImpl.AuthorityDetailImpl;
import model.pojo.Authority;
import model.pojo.ChangeSectionForm;
import model.pojo.PetitionForm;

/**
 *
 * @author SONY
 */
public class AuthorityDetailServlet extends HttpServlet {

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

        Authority authority = (Authority) session.getAttribute("authorityInfo");

        if (userPath.equals("/authority/index")) {
            session.setAttribute("plist", null);
            session.setAttribute("clist", null);
            session.setAttribute("task", null);
        } else if (userPath.equals("/authority/request")) {
            List<PetitionForm> plist = new AuthorityDetailImpl().getPetitionFormRequest("waiting");
            List<ChangeSectionForm> clist = new AuthorityDetailImpl().getChangeSectionForm("waiting");
            session.setAttribute("plist", plist);
            session.setAttribute("clist", clist);
            session.setAttribute("task", "task");
        }else if(userPath.equals("/authority/approve")) {
            
        }else if(userPath.equals("/authority/suspend")) {
            
        }
        
        try {
            System.out.println("redirected-------->");
            System.out.println(userPath);
            request.getRequestDispatcher("/WEB-INF/view/authority/index.jsp").forward(request, response);
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
