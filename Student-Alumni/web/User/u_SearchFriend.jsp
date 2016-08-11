<%--
    Document   : u_SearchFriend
    Created on : Mar 22, 2009, 7:34:00 AM
    Author     : Meeli Vyas
--%>

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
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

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
	</div>

	<%
		HttpSession s1 = request.getSession();
		String to_grno = (String) s1.getAttribute("grno");
		String from_grno = "";
		int temp = 0;
		s1.setAttribute("counter", temp);
	%>
	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="15%" height="85%">
					<jsp:include page="user_options.jsp"></jsp:include>
				</td>
				
				<td width="85%" height="85%" valign="top">
					<form action="u_FriendSearchResult.jsp">
						<table class="ScrapSelectTable" align="center" cellpadding="15px">
						<tr><td><h2>Search A Friend</h2></td></tr>
						<tr><td>First Name : <input type="text" name="sfname" size="20" /></td></tr>
						<tr><td>Last  Name : <input type="text" name="slname" size="20" /></td></tr>
						<tr><td>Email Address : <input type="text" name="semail" size="20" /></td></tr>
						<tr><td><center><input type="submit" value="Find" name="Find" /></center></td></tr>			
						</table>
					</form>  
				</td>
			</tr>
		</table>
	</div>

	<div>
		<jsp:include page="u_footer.jsp"></jsp:include>
	</div>
</body>
</html>

