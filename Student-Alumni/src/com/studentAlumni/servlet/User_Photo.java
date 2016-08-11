package com.studentAlumni.servlet;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



import java.io.IOException;
import java.sql.Connection;
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
public class User_Photo extends HttpServlet {
   
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
        Connection con = null;
        Statement st = null;
        String photo = request.getParameter("photo");
        HttpSession s1 = request.getSession();
        String grno= (String) s1.getAttribute("grno");
       
        try
        {

            InitialContext initialCiontext = new InitialContext();
            Context context = (Context) initialCiontext.lookup("java:comp/env");
            DataSource ds = (DataSource) context.lookup("resource_ref2");
            con= ds.getConnection();
           
            st=con.createStatement();
            
            String qry ="UPDATE PROFILE  SET PHOTO = '" + photo +"' WHERE GRNO ='" +grno+"'";
            int rs = st.executeUpdate(qry);
            RequestDispatcher rd = null;
            if (rs==1)
                   {
                    rd = request.getRequestDispatcher("/User/user_home.jsp?grno="+grno);
                   }

            else
               {
                   rd = request.getRequestDispatcher("/Error.html");
                   }
            rd.forward(request, response);
          }
        finally
        {

         try {
                if (!st.isClosed()) st.close();
                if (!con.isClosed()) con.close();
                }
             catch (Exception e)
                {
                log(e.getMessage());
                }


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
            Logger.getLogger(User_Photo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User_Photo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(User_Photo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User_Photo.class.getName()).log(Level.SEVERE, null, ex);
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
