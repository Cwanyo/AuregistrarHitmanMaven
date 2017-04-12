/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import function.IdTokenVerifierAndParser;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.daoImpl.LoginDaoImpl;
import model.pojo.Authority;
import model.pojo.Student;

/**
 *
 * @author C.wan_yo
 */
public class LoginServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
        response.sendRedirect("index.jsp");
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
        //processRequest(request, response);

        response.setContentType("text/html");

        try {
            String idToken = request.getParameter("id_token");
            GoogleIdToken.Payload payLoad = IdTokenVerifierAndParser.getPayload(idToken);

            String email = payLoad.getEmail();
            String pictureUrl = (String) payLoad.get("picture");

            //set session
            HttpSession session = request.getSession(true);
            session.setAttribute("userPicture", pictureUrl);

            //check as student
            Student s = new LoginDaoImpl().loginStudent(email);

            if (s == null) {
                //check as authority
                Authority a = new LoginDaoImpl().loginAuthority(email);

                if (a == null) {
                    //who the hell?
                    //redirect
                    response.sendRedirect("Logout");
                    //request.getRequestDispatcher("/Logout").forward(request, response);
                } else {
                    //login as authority
                    session.setAttribute("authorityInfo", a);
                    //redirect
                    response.sendRedirect("Authority");
                    //request.getRequestDispatcher("/WEB-INF/view/authority/mainAuthorityTest.jsp").forward(request, response);
                }
            } else {
                //login as student
                session.setAttribute("studentInfo", s);
                //redirect
                response.sendRedirect("Student");
                //request.getRequestDispatcher("/WEB-INF/view/student/mainStudentTest.jsp").forward(request, response);
            }

        } catch (Exception e) {
        }
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
