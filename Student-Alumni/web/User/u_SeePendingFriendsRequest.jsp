<%--
    Document   : u_SeePendingFriendsRequest
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
					<center class="AllTitles"><h2>!!Your Friends Request!!</h2></center>
					<table align="center" cellpadding="15" class="FriendsListTable">
						<%
							Connection con = null, con2 = null;
							PreparedStatement ps = null, ps2 = null;
							ResultSet rs = null, rs2 = null;
							String FirstName, LastName, Company;
							int numberOfRecords = 0;
							try {
								con = DBUtils.getConnectionObj();
								ps = con.prepareStatement(DBUtils.GET_PENDING_FRIENDS_REQ, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
								ps.setString(1, to_grno);
								rs = ps.executeQuery();
								while (rs.next()) {
									from_grno = rs.getString("FROM_GRNO");
									con2 = DBUtils.getConnectionObj();
									ps2 = con2.prepareStatement(DBUtils.GET_PROFILE_FROM_GRNO);
									ps2.setString(1, from_grno);
									rs2 = ps2.executeQuery();
									if (rs2.next()) {
										from_grno = rs2.getString("GRNO");
										FirstName = rs2.getString("FIRSTNAME");
										LastName = rs2.getString("LASTNAME");
										String Photo = rs2.getString("PHOTO");
										Company = rs2.getString("COMPANY");
										numberOfRecords++;
						%>
						<td align="center">
							<center><img align="center" src="<%=Photo%>" width="150" height="100" alt="<%=from_grno%>" /></center>
							<center><c:out value="<%=FirstName%>" /> . <c:out value="<%=LastName%>" /></center>
							<center><c:out value="<%=Company%>" /></center>

							<form action="/Student-Alumni/User/u_AcceptFriendsRequest">
								<input type="hidden" name="from_grno" value="<%=from_grno%>">
								<button name="allow" value="<%=from_grno%>" onclick="submit()">Accept Request</button>
							</form>
						</td>
						<%
									}
								}
								if(numberOfRecords==0){
									%>
										<td align="center">
											<center>There are no Pending Friends Request</center>
										</td>
									<%
								}
							}
							finally {
								try {
									if (!rs2.isClosed()) rs2.close();
									if (!rs.isClosed()) rs.close();
									if (!ps2.isClosed()) ps2.close();
									if (!ps.isClosed()) ps.close();
									if (!con2.isClosed()) con2.close();
									if (!con.isClosed()) con.close();
								} catch (Exception e) {
									log(e.getMessage());
								}
							}
						%>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div>
		<jsp:include page="u_footer.jsp"></jsp:include>
	</div>
</body>
</html>

