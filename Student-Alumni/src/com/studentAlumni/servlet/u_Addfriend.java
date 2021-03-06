/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.studentAlumni.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class u_Addfriend extends HttpServlet {

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

		Connection con1 = null, con2 = null;
		PreparedStatement ps = null;
		ResultSet rs1 = null, rs2 = null;
		PreparedStatement ps1 = null, ps2 = null;
		try {

			HttpSession s1 = request.getSession();
			String from_grno = (String) s1.getAttribute("grno");
			String to_grno = request.getParameter("sgrno");

			if (from_grno != null && to_grno != null) {
				con1 = DBUtils.getConnectionObj();
				ps1 = con1.prepareStatement(DBUtils.GET_FRIENDS_BY_GRNO);
				ps1.setString(1, from_grno);
				ps1.setString(2, to_grno);
				rs1 = ps1.executeQuery();
				
				con2 = DBUtils.getConnectionObj();
				ps2 = con2.prepareStatement(DBUtils.GET_FRIENDS_BY_GRNO);
				ps2.setString(1, to_grno);
				ps2.setString(2, from_grno);
				rs2 = ps2.executeQuery();
				
				if (rs1.next() || rs2.next()) {
					RequestDispatcher rd = request.getRequestDispatcher("/User/Already_friend.html");
					rd.forward(request, response);
				}

				else {
					if (!rs1.isClosed()) rs1.close();
					if (!rs2.isClosed()) rs2.close();
					if (!ps1.isClosed()) ps1.close();
					if (!ps2.isClosed()) ps2.close();
					if (!con1.isClosed()) con1.close();
					if (!con2.isClosed()) con2.close();

					con1 = DBUtils.getConnectionObj();
					ps = con1.prepareStatement(DBUtils.INSERT_FRIENDS);

					ps.setString(1, from_grno);
					ps.setString(2, to_grno);
					ps.setString(3, "PENDING");
					int rs = ps.executeUpdate();

					if (rs == 1) {
						out.write("<center>  <h2> A REQUEST FOR A FRIEND IS MADE</h2></center>");
						out.write("<center>  <h3>You Need To Wait For The Conformation From The Other Side</h3></center>");
						out.write("<center><h1>THANKS!!</h1></center>");
					} else {
						//out.print("hello");
					}
				}
			}
			else {
				out.write("<center>  <h2> IT SEAMS THAT YOU ARE NOT A VALID USER</h2></center>");
				out.write("<center>  <h3>So Are Not Allowed To Make A Friends </h3></center>");
				out.write("<center><h1>SORRY FOR INCONVIENCE!!</h1></center>");
			}

		} finally {
			try {
				if (!rs1.isClosed()) rs1.close();
				if (!rs2.isClosed()) rs2.close();
				if (!ps1.isClosed()) ps1.close();
				if (!ps2.isClosed()) ps2.close();
				if (!con1.isClosed()) con1.close();
				if (!con2.isClosed()) con2.close();
			} catch (Exception e) {
				log(e.getMessage());
			}
			out.close();
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
			Logger.getLogger(u_Addfriend.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
			Logger.getLogger(u_Addfriend.class.getName()).log(Level.SEVERE, null, ex);
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
			Logger.getLogger(u_Addfriend.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
			Logger.getLogger(u_Addfriend.class.getName()).log(Level.SEVERE, null, ex);
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
