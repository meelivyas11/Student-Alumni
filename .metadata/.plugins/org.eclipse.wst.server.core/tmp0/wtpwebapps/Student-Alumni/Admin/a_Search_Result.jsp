<%-- 
    Document   : a_Search_Result
    Created on : Mar 23, 2009, 4:15:15 AM
    Author     : Meeli Vyas
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.studentAlumni.DataProvider.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@   taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@   taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@   taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<link rel="stylesheet" type="text/css"
	href="/Student-Alumni/CSS/common.css" />
</head>

<body>
	<div id="header">
		<jsp:include page="a_Lheader.jsp"></jsp:include>
		<br>
	</div>

	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="20%" height="85%"><jsp:include
						page="admin_options.jsp"></jsp:include></td>
				<td width="80%" height="85%">
					<%
						String str = request.getParameter("Search");
						if (str != null && str.equals("Search")) {
							Connection con = null;
							PreparedStatement ps = null;
							ResultSet rs = null;
							try {
								String asgrno = request.getParameter("asgrno");
								String asfname = request.getParameter("asfname");
								String aslname = request.getParameter("aslname");
								String asYOP = request.getParameter("asYOP");
								String asbranch = request.getParameter("asbranch");
								String asuserid = request.getParameter("asuserid");
					%>

					<table width=100% border=3 align="left">
						<thead> 
							<tr>
								<th>GRNO</th>
								<th>FIRSTNAME</th>
								<th>LASTNAME</th>
								<th>YEAR OF PASSING</th>
								<th>BRANCH</th>
							</tr>
						</thead>

						<%
							con = DBUtils.getConnectionObj();
									ps = con.prepareStatement(DBUtils.GET_SPECIFIC_STUDENTDATA);
									ps.setString(1, asgrno);
									ps.setString(2, asfname);
									ps.setString(3, aslname);
									ps.setString(4, asYOP);
									ps.setString(5, asbranch);

									rs = ps.executeQuery();
									if (rs.next()) {
										String grno = rs.getString("GRNO");
										String FristName = rs.getString("FIRSTNAME");
										String LastName = rs.getString("LASTNAME");
										String YOP = rs.getString("YEAROFPASSING");
										String Branch = rs.getString("BRANCH");
						%>

						<td><c:out value="<%=grno%>" /></td>
						<td><c:out value="<%=FristName%>" /></td>
						<td><c:out value="<%=LastName%>" /></td>
						<td><c:out value="<%=YOP%>" /></td>
						<td><c:out value="<%=Branch%>" /></td>
						<%
							}
								} finally {

									try {
										if (!rs.isClosed())
											rs.close();
										if (!ps.isClosed())
											ps.close();
										if (!con.isClosed())
											con.close();
									} catch (Exception e) {
										log(e.getMessage());
									}
								}
								out.close();
							}
						%>
					</table>
				</td>
			</tr>
			</tbody>
		</table>
	</div>

	<div id="footer">
		<br>
		<jsp:include page="a_Lfooter.jsp"></jsp:include>
	</div>
</body>
</html>