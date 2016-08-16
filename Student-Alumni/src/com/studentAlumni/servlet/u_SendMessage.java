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
import java.util.StringTokenizer;
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
public class u_SendMessage extends HttpServlet {

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

		PreparedStatement ps = null;
		PreparedStatement ps1 = null, ps2 = null;
		Connection con = null, con2 = null, con3 = null;
		ResultSet rs = null, rs2 = null;

		String Sgrno = "", Semail = "", Rgrno = "", Remail = "", Message = "";
		String temp_receivers = "";
		boolean flag = false;

		HttpSession s1 = request.getSession();
		String grno = (String) s1.getAttribute("grno");

		if (grno != "") {
			try {
				String str = request.getParameter("Send");
				if (str != null && str.equals("Send")) {
					temp_receivers = request.getParameter("Destination");
					Message = request.getParameter("Message");
					Sgrno = grno;

					StringTokenizer data = new StringTokenizer(temp_receivers, ",");

					con2 = DBUtils.getConnectionObj();
					ps2 = con2.prepareStatement(DBUtils.GET_EMAILADDRESS_FROM_GRNO, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					ps2.setString(1, Sgrno);
					
					rs2 = ps2.executeQuery();
					if (rs2.next()) {
						Semail = rs2.getString("EMAILADDRESS");
					}

					while (data.hasMoreTokens()) {
						Remail = data.nextToken();
						con = DBUtils.getConnectionObj();
						ps1 = con.prepareStatement(DBUtils.GET_PROFILE_BY_EMAILADDRESS ,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						ps1.setString(1, Remail);
						rs = ps1.executeQuery();
						if (rs.next()) {
							Rgrno = rs.getString("GRNO");
						}

						con3 = DBUtils.getConnectionObj();
						ps = con3.prepareStatement(DBUtils.INSERT_SCRAP);
						ps.setString(1, Semail);
						ps.setString(2, Sgrno);
						ps.setString(3, Remail);
						ps.setString(4, Rgrno);
						ps.setString(5, Message);
						int rs3 = ps.executeUpdate();

						if (rs3 == 1) {
							flag = true;
						} else {
							out.write("<center>  <h2> WE TRIED HARD TO SEND YOUR MESSAGE TO " + Remail);
							out.write("</h2></center>");
							out.write(" <center>  <h3>But Due To Incorect Id Its Not Possible </h3></center>");
							out.write("  <center><h1>PLEASE CHECK THE EMAIL ID!!</h1></center>");
						}

						try {
							if (!rs.isClosed())
								rs.close();
							if (!rs2.isClosed())
								rs2.close();

							if (!ps1.isClosed())
								ps1.close();
							if (!ps2.isClosed())
								ps2.close();
							if (!ps.isClosed())
								ps.close();

							if (!con.isClosed())
								con.close();
							if (!con2.isClosed())
								con2.close();
							if (!con3.isClosed())
								con3.close();
						} catch (Exception e) {
							log(e.getMessage());
						}
					}
					if (flag == true) {
						out.write("<center>  <h2> YOUR MESSAGE IS SUCCESSFULLY SEND TO ALL YOUR FRIENDS</h2></center>");
						out.write(" <center>  <h3>Wait For The Reply </h3></center>");
						out.write("  <center><h1>THANKS!!</h1></center>");
					}
				}
			} finally {
				try {
					if (!rs.isClosed())
						rs.close();
					if (!rs2.isClosed())
						rs2.close();
					if (!ps1.isClosed())
						ps1.close();
					if (!ps2.isClosed())
						ps2.close();
					if (!ps.isClosed())
						ps.close();
					if (!con.isClosed())
						con.close();
					if (!con2.isClosed())
						con2.close();
					if (!con3.isClosed())
						con3.close();
				} catch (Exception e) {
					log(e.getMessage());
				}
				out.close();
			}
		} else {
			out.write("<center>  <h2> WE TRIED HARD TO SEND YOUR MESSAGE</h2></center>");
			out.write(" <center>  <h3>But Due To Incorect Id Its Not Possible </h3></center>");
			out.write("  <center><h1>PLEASE CHECK THE EMAIL ID!!</h1></center>");
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
			Logger.getLogger(u_SendMessage.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
			Logger.getLogger(u_SendMessage.class.getName()).log(Level.SEVERE, null, ex);
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
			Logger.getLogger(u_SendMessage.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
			Logger.getLogger(u_SendMessage.class.getName()).log(Level.SEVERE, null, ex);
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
