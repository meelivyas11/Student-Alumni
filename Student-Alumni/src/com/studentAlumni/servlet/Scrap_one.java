package com.studentAlumni.servlet;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author Meeli Vyas
 */
@SuppressWarnings("serial")
public class Scrap_one extends HttpServlet {
   
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



            PreparedStatement ps = null;
            Statement st = null, st2 = null;
            Connection con = null, con2 = null, con3 = null;
            ResultSet rs = null, rs2 = null;

            String Sgrno = "", Semail = "", Rgrno = "", Remail = "", Message = "";

            HttpSession s1 = request.getSession();
            String grno = (String) s1.getAttribute("grno");

 try {
                  String str = request.getParameter("Send");
                if (str != null && str.equals("Send")) {
                    Remail = request.getParameter("Destination");
                    Message = request.getParameter("Message");
                    Sgrno = grno;

                    InitialContext i1 = new InitialContext();
                    Context ct = (Context) i1.lookup("java:comp/env"); // this is the value of the resource reference
                    DataSource ds = (DataSource) ct.lookup("resource_ref4"); // of javax.sql
                    con = ds.getConnection();
                    st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                    String query = "Select GRNO from PROFILE where EMAILADDRESS='" + Remail + "'";
                    rs = st.executeQuery(query);
                    if (rs.next()) {
                        Rgrno = rs.getString("GRNO");
                    }


                    InitialContext i2 = new InitialContext();
                    Context ct2 = (Context) i2.lookup("java:comp/env"); // this is the value of the resource reference
                    DataSource ds2 = (DataSource) ct2.lookup("resource_ref3"); // of javax.sql
                    con2 = ds2.getConnection();
                    st2 = con2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                    String query1 = "Select EMAILADDRESS from PROFILE where GRNO='" + Sgrno + "'";
                    rs2 = st2.executeQuery(query1);
                    if (rs2.next()) {
                        Semail = rs2.getString("EMAILADDRESS");
                    }



                    InitialContext i3 = new InitialContext();
                    Context ct3 = (Context) i3.lookup("java:comp/env"); // this is the value of the resource reference
                    DataSource ds3 = (DataSource) ct3.lookup("resource_ref1"); // of javax.sql


                    con3 = ds3.getConnection();

                    ps = con3.prepareStatement("Insert into SCRAP values(?,?,?,?,?)");

                    ps.setString(1, Semail);
                    ps.setString(2, Sgrno);
                    ps.setString(3, Remail);
                    ps.setString(4, Rgrno);
                    ps.setString(5, Message);

                    int rs3 = ps.executeUpdate();

                    if (rs3 == 1) {
                        RequestDispatcher rd = request.getRequestDispatcher("/Student-Alumni/User/Scrap_Send_success.html");
                        rd.forward(request, response);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("/Student-Alumni/User/Error.html");
                        rd.forward(request, response);

                    }


                }


 } finally {
            out.close();
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
            Logger.getLogger(Scrap_one.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Scrap_one.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Scrap_one.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Scrap_one.class.getName()).log(Level.SEVERE, null, ex);
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
