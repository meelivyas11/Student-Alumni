package com.studentAlumni.Domain;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Meeli Vyas
 */
public class ad_StuData_delete extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, NamingException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Statement st=null;
        Connection con = null;
        ResultSet rs = null;

        try {

         String grno = request.getParameter("delgrno");

         InitialContext i1 = new InitialContext();
         Context ct =(Context) i1.lookup("java:comp/env"); // this is the value of the resource reference
         DataSource ds = (DataSource) ct.lookup("resource_ref1"); // of javax.sql
         con = ds.getConnection();
         st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
         String qry = " Select *  from STUDENTSDATA where GRNO = '"+ grno +"'";
         rs = st.executeQuery(qry);
          if(rs.next())
          {

               rs.deleteRow();
               try{
                    InitialContext i12 = new InitialContext();
                    Context ct2 =(Context) i12.lookup("java:comp/env"); // this is the value of the resource reference
                    DataSource ds2 = (DataSource) ct2.lookup("resource_ref2"); // of javax.sql
                    Connection con2 = ds2.getConnection();
                    Statement st2 = con2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
                    String qry2 = " Select *  from LOGINTABLE where GRNO = '"+ grno +"'";
                    ResultSet rs2 = st2.executeQuery(qry2);
                    if(rs2.next())
                             {
                                rs2.deleteRow();
                                out.print("record Deleted");
                             }
                   }
               finally {
                    try {
                      if (!rs.isClosed()) rs.close();
                      if (!st.isClosed()) st.close();
                      if (!con.isClosed()) con.close();
                         } 
                    catch (Exception e) { log(e.getMessage()); }
                   //out.close();
                        }
          }
          else
          {
             out.print("Plz Enter Correct Grno");
          }
          
        }
        
        finally {


             try {
                if (!rs.isClosed()) {
                    rs.close();
                }
                if (!st.isClosed()) {
                    st.close();
                }
                if (!con.isClosed()) {
                    con.close();
                }
            } catch (Exception e) {
                log(e.getMessage());
            }


            //out.close();
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
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            Logger.getLogger(ad_StuData_delete.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ad_StuData_delete.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            Logger.getLogger(ad_StuData_delete.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ad_StuData_delete.class.getName()).log(Level.SEVERE, null, ex);
        }
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
