/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.studentAlumni.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.studentAlumni.DataProvider.DBUtils;
/**
 *
 * @author Meeli Vyas
 */
@SuppressWarnings("serial")
public class u_Suggestion extends HttpServlet {
   
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
		Connection cn = null;
		PreparedStatement ps = null;
		//ResultSet rs = null;

		try {
			HttpSession s1 = request.getSession();
			String grno = (String) s1.getAttribute("grno");

			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String suggestion = request.getParameter("suggestion");

			cn = DBUtils.getConnectionObj();
			ps = cn.prepareStatement("Insert into SUGGESTION (FIRSTNAME,LASTNAME,GRNO,SUGGESTION) values(?,?,?,?)");

			ps.setString(1, firstname);
			ps.setString(2, lastname);
			ps.setString(3, grno);
			ps.setString(4, suggestion);

			int rs3 = ps.executeUpdate();
			if (rs3 == 1) {
				out.print("Suggestion Successfully send");

			}
		} finally {

			try {
				if (!ps.isClosed()) ps.close();
				if (!cn.isClosed()) cn.close();
			} catch (Exception e) {
				log(e.getMessage());
			}
			// out.close();
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
            Logger.getLogger(u_Suggestion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(u_Suggestion.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(u_Suggestion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(u_Suggestion.class.getName()).log(Level.SEVERE, null, ex);
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
