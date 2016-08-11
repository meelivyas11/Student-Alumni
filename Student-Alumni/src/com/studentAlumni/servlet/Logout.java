/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.studentAlumni.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mehul
 */
@SuppressWarnings("serial")
public class Logout extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            HttpSession session=request.getSession();
            session.invalidate();
            Cookie[] cs = request.getCookies();
             if (cs != null && cs.length >= 2) {

                String userName = cs[0].getValue();
                String password = cs[1].getValue();
                if (userName != null && password != null) {
                   cs[0].setMaxAge(0);
                   cs[0].setValue(null);
                   response.addCookie(cs[0]);
                   cs[1].setMaxAge(0);
                   cs[1].setValue(null);
                   response.addCookie(cs[1]);
                }
             }

            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
        } catch(Exception e)
        {
            System.out.println(e.getMessage());
        }finally {
            
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
