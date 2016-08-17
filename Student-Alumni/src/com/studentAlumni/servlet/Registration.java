package com.studentAlumni.servlet;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
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
public class Registration extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NamingException, SQLException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement ps = null;
		try {

			String userid = request.getParameter("userid");
			String password = request.getParameter("password");
			String grno = request.getParameter("grno");
			String status = request.getParameter("status");
			String role = request.getParameter("role");
			String Sender;

			HttpSession s1 = request.getSession();
			s1.setAttribute("userid", userid);
			s1.setAttribute("password", password);
			s1.setAttribute("grno", grno);
			s1.setAttribute("status", status);
			s1.setAttribute("role", role);

			Sender = (String) s1.getAttribute("Sender");

			con = DBUtils.getConnectionObj();
			ps = con.prepareStatement(DBUtils.INSERT_LOGINTABLE);

			ps.setString(1, userid);
			ps.setString(2, password);
			ps.setString(3, status);
			ps.setString(4, grno);
			ps.setString(5, role);

			int rs = ps.executeUpdate();

			if (rs == 1) {
				RequestDispatcher rd = null;
				if (Sender.equals("Administrator")) {
					rd = request.getRequestDispatcher("/Admin/Success.html");
				}
				else if (Sender.equals("User")) {
					rd = request.getRequestDispatcher("/request_pending_ack.html");
				}
				rd.forward(request, response);

			} else {
				response.getWriter().write("lodin Fail");
			}
		} catch (SQLException ex) {
			out.print(ex.toString());
			Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
		} catch (Exception e) {
			out.print(e.getMessage());
		} finally {

			try {

				if (!ps.isClosed()) {
					ps.close();
				}
				if (!con.isClosed()) {
					con.close();
				}
			} catch (Exception e) {
				log(e.getMessage());
			}
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on
	// the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (NamingException ex) {
			Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
			Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (NamingException ex) {
			Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
			Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
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
