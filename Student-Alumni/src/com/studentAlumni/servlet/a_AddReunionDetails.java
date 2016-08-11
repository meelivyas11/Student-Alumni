/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.studentAlumni.servlet	;

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

import com.studentAlumni.DataProvider.DBUtils;
/**
 *
 * @author Meeli Vyas
 */
@SuppressWarnings("serial")
public class a_AddReunionDetails extends HttpServlet {
   
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
		Connection con2 = null;
		PreparedStatement ps = null;

		try {

			String str1 = request.getParameter("Make-Entry");
			if (str1 != null && str1.equals("Make-Entry")) {
				con2 = DBUtils.getConnectionObj();
				ps = con2.prepareStatement(DBUtils.ADD_REUNION);
				ps.setString(1, request.getParameter("date"));
				ps.setString(2, request.getParameter("Venue"));
				ps.setString(3, request.getParameter("YearBranch"));

				int rs2 = ps.executeUpdate();

				if (rs2 == 1) {
					out.print("success");
				} else {
					out.print("not success");
				}

			}

		} finally {
			try {

				if (!ps.isClosed()) {
					ps.close();
				}
				if (!con2.isClosed()) {
					con2.close();
				}

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
            Logger.getLogger(a_AddReunionDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(a_AddReunionDetails.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(a_AddReunionDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(a_AddReunionDetails.class.getName()).log(Level.SEVERE, null, ex);
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
