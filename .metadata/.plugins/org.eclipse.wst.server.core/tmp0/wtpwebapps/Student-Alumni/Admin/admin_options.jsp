<%-- 
    Document   : admin_options
    Created on : Mar 22, 2009, 7:54:30 AM
    Author     : Meeli Vyas
--%>

<%@page import="java.sql.PreparedStatement"%>
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
<%@page import="com.studentAlumni.DataProvider.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
</head>
<body id="Common_options">
	<table border="0" width="100%" align="left" valign="top">
		<tr>
			<td><br>
			 <%
		 	HttpSession s1 = request.getSession();
		 	String grno = (String) s1.getAttribute("grno");
		 	String photo = "";
		 	Connection con = null;
		 	PreparedStatement ps = null;
		 	ResultSet rs = null;
		 	try {
		
		 		con = DBUtils.getConnectionObj();
		 		ps = con.prepareStatement(DBUtils.GET_PROFILE_FROM_GRNO);
		 		ps.setString(1, grno);
		 		rs = ps.executeQuery();
		
		 		if (rs.next()) {
		 			photo = rs.getString("PHOTO");
		 			grno = rs.getString("GRNO");
		 		}
		 	} finally {
		 		try {
		 			if (!rs.isClosed()) rs.close();
		 			if (!ps.isClosed())	ps.close();
		 			if (!con.isClosed()) con.close();
		 		} catch (Exception e) {
		 			log(e.getMessage());
		 		}
		 	}
		 %>
			<table border="0">
				<tr>
					<td><img align="center" src="<%=photo%>" width="100" height="100" alt="<%=grno%>" />&nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;<a href="/Student-Alumni/Admin/a_photo.jsp">Change
							Photo</a>
					</td>
					</tr>
			</table> 
				<a class="Common_options" href="/Student-Alumni/Admin/a_AddMember.jsp">Add Member</a><br>
				<a class="Common_options" href="/Student-Alumni/Admin/a_DelMember.jsp">Delete Member</a><br>
				<a class="Common_options" href="/Student-Alumni/Admin/a_Search_DB.jsp">Search DataBase</a><br>
				<a class="Common_options" href="/Student-Alumni/Admin/a_SeePendingRequests.jsp">See Pending Requests</a><br> 
				<a class="Common_options" href="/Student-Alumni/Admin/a_ViewSuggestion.jsp">View Suggestion</a><br>
				<a class="Common_options" href="/Student-Alumni/Admin/a_EditReunion.jsp">Reunion Information</a><br> <br>
			</td>
		</tr>
	</table>
</body>
</html>
