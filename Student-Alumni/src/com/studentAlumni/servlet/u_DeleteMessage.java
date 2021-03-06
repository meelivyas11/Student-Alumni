package com.studentAlumni.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studentAlumni.DataProvider.DBUtils;

/**
 * Servlet implementation class u_DeleteMessage
 */
@WebServlet("/User/u_DeleteMessage")
public class u_DeleteMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public u_DeleteMessage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession s1 = request.getSession();
		String Rgrno = (String) s1.getAttribute("grno");
		String Sgrno = request.getParameter("Sgrno");
		String message = request.getParameter("Message");

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DBUtils.getConnectionObj();
			ps = con.prepareStatement(DBUtils.GET_SPECIFIC_SCRAP, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
			ps.setString(1, Sgrno);
			ps.setString(2, Rgrno);
			ps.setString(3, message);
			rs = ps.executeQuery();
			if (rs.next()) {
				rs.deleteRow();
				s1.setAttribute("counter", 0);
				out.write("<center>  <h2> THE MESSAGE IS SUCCESSFULLY DELETED</h2></center>");
				out.write(" <center>  <h3>Click On Link To Go Back </h3></center>");
				out.write("<a href='/Student-Alumni/User/u_ViewScrap.jsp' onclick='submit()'>Home</a>");
			}
		} 
		catch (Exception ex) {
			out.write(ex.toString());
		}
		finally {
			try {
				if (!rs.isClosed()) rs.close();
				if (!ps.isClosed()) ps.close();
				if (!con.isClosed()) con.close();
			} catch (Exception e) {
				log(e.getMessage());
			}
			// out.close();
		}
	}

}
