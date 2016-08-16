
<%--
    Document   : u_ViewAllFriends
    Created on : Mar 22, 2009, 7:34:00 AM
    Author     : Meeli Vyas
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.studentAlumni.DataProvider.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.RequestDispatcher"%>

<link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student</title>
<link rel="stylesheet" type="text/css"
	href="/Student-Alumni/CSS/common.css" />
</head>

<body>
	<div>
		<jsp:include page="u_header.jsp"></jsp:include>
		<br>
	</div>


	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="15%" height="85%">
					<jsp:include page="user_options.jsp"></jsp:include>
				</td>
				<td width="85%" height="85%" valign="top" align="right">
					<%
						HttpSession s1 = request.getSession();
						PreparedStatement ps = null, ps2 = null;
						Connection con = null, con2 = null;
						ResultSet rs = null, rs2 = null;
						int temp = (Integer) s1.getAttribute("counter");
						int i = temp, j;
						String Friend_grno = "";

						String grno = (String) s1.getAttribute("grno");

						try {
							con = DBUtils.getConnectionObj();
							ps = con.prepareStatement(DBUtils.GET_FRIENDS_FOR_GRNO, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
							ps.setString(1, grno);
							ps.setString(2, grno);
							rs = ps.executeQuery();
							
							int row = (Integer) s1.getAttribute("current_row_no");
							rs.absolute(row - 1);
							int hell = 0;
							%>

							<table border="6" align="center" cellpadding="5">
								<thead>
									<center>
										<h2>Friends List</h2>
									</center>
								</thead>
								
								<tr>
									<%
									while (rs.next()) {
										hell++;
										String grno1 = rs.getString("FROM_GRNO");
										String grno2 = rs.getString("TO_GRNO");

										if (grno1.equals(grno)) {
											Friend_grno = grno2;
										} else if (grno2.equals(grno)) {
											Friend_grno = grno1;
										}

										con2 = DBUtils.getConnectionObj();
										ps2 = con2.prepareStatement(DBUtils.GET_PROFILE_FROM_GRNO, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
										ps2.setString(1, Friend_grno);
										rs2 = ps2.executeQuery();

										if (rs2.next()) {
											String FirstName = rs2.getString("FIRSTNAME");
											String LastName = rs2.getString("LASTNAME");
											String Photo = rs2.getString("PHOTO");
											String Company = rs2.getString("COMPANY");
											%>
											<pre>
												<td align="center">
				               						<center>
														<img align="center" src="<%=Photo%>" width="100" height="100"	alt="<%=Friend_grno%>" />
													</center>
				                					<center>
														<c:out value="<%=FirstName%>" />.<c:out value="<%=LastName%>" />
													</center>
				                    				<center>
														<c:out value="<%=Company%>" />
													</center>
												</td>
											</pre>
											<%
										}
										if (hell % 4 == 0) {
											%>
											</tr>
											<tr>
											<%
										}

									}
								%>
								</table> 
								<%
					 	} 
						finally {
					 		try {
					 			if (!rs.isClosed()) rs.close();
					 			if (!ps.isClosed()) ps.close();
					 			if (!con.isClosed()) con.close();
					 			if (!rs2.isClosed()) rs2.close();
					 			if (!ps2.isClosed()) ps2.close();
					 			if (!con2.isClosed()) con2.close();
					 		} catch (Exception e) {
					 			log(e.getMessage());
					 		}
					 		//out.close();
					 	}
 					%>
				</td>
			</tr>
		</table>
	</div>

	<div>
		<jsp:include page="u_footer.jsp"></jsp:include>
	</div>
</body>
</html>

