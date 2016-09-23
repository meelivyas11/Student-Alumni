
<%--
    Document   : u_FriendSearchResult
    Created on : Mar 22, 2009, 7:34:00 AM
    Author     : Meeli Vyas
--%>

<%@page import="java.awt.image.DataBuffer"%>
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
<%@page import="javax.servlet.RequestDispatcher"%>

<link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student</title>
</head>

<body>
	<div>
		<jsp:include page="u_header.jsp"></jsp:include>
	</div>

	<div id="middle">
		<table border="10" width="100%" height="100%">
			<tr>
				<td width="15%" height="100%" valign="top">
					<jsp:include page="user_options.jsp"></jsp:include>
				</td>
				<td width="85%" height="100%" valign="top"><br>
				<%
					int numOfRecordsInPage = 3;
				 	Statement st = null;
				 	Connection con = null;
				 	ResultSet rs = null;
				 	int i;
				 	HttpSession s1 = request.getSession();
				 	try {
				 		String grno = (String) s1.getAttribute("grno");
				 		int temp = (Integer) s1.getAttribute("counter");
				 		String query = "";
				 		int times;
				 		String sgrno = "";
				 		if (temp == 0) {
					 	String str1 = request.getParameter("Find");
			 			if (str1 != null && str1.equals("Find")) {
			 				String sfname = request.getParameter("sfname");
			 				String slname = request.getParameter("slname");
			 				String semail = request.getParameter("semail");
			
			 				if (sfname != "") sfname.trim();
			 				if (slname != "") slname.trim();
			 				if (semail != "") semail.trim();
			
			 				if (sfname == "" && slname == "" && semail == "") {
			 					out.print("Enter the values");
			 				}
			 				if (sfname == "" && slname == "" && semail != "") {
			 					query = "Select * from profile where FIRSTNAME like'%' and LASTNAME like '%' and EMAILADDRESS like '"
			 							+ semail + "'";
			 				}
			 				if (sfname == "" && slname != "" && semail == "") {
			 					query = "Select * from profile where FIRSTNAME like'%' and LASTNAME like '" + slname
			 							+ "' and EMAILADDRESS like '%'";
			 				}
			 				if (sfname == "" && slname != "" && semail != "") {
			 					query = "Select * from profile where FIRSTNAME like'%' and LASTNAME like '" + slname
			 							+ "' and EMAILADDRESS like '" + semail + "'";
			 				}

			 				if (sfname != "" && slname == "" && semail == "") {
			 					query = "Select * from profile where FIRSTNAME like '" + sfname
			 							+ "' and LASTNAME like '%' and EMAILADDRESS like '%'";
			 				}
			 				if (sfname != "" && slname == "" && semail != "") {
			 					query = "Select * from profile where FIRSTNAME like'" + sfname
			 							+ "' and LASTNAME like '%' and EMAILADDRESS like '" + semail + "'";
			 				}
			 				if (sfname != "" && slname != "" && semail == "") {
			 					query = "Select * from profile where FIRSTNAME like'" + sfname + "' and LASTNAME like '"
			 							+ slname + "' and EMAILADDRESS like '%'";
			 				}
			 				if (sfname != "" && slname != "" && semail != "") {
			 					query = "Select * from profile where FIRSTNAME like'" + sfname + "' and LASTNAME like '"
			 							+ slname + "' and EMAILADDRESS like '" + semail + "'";
			 				}
		 				}

			 			con = DBUtils.getConnectionObj();
			 			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			 			rs = st.executeQuery(query);
			 			s1.setAttribute("query", query);
			 			rs.last();
			 			int total_no_of_rows = rs.getRow();
			 			s1.setAttribute("total_no_of_rows", total_no_of_rows);
			 			rs.beforeFirst();
			 			times = (Integer) s1.getAttribute("total_no_of_rows");
				 		} 
				 		else {
				 			con = DBUtils.getConnectionObj();
				 			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				 			query = (String) s1.getAttribute("query");
				 			rs = st.executeQuery(query);
				 			int row = (Integer) s1.getAttribute("current_row_no");
				 			rs.absolute(row);
				 			times = (Integer) s1.getAttribute("total_no_of_rows");
			 			}
 		
				 		while (rs.next() && times >= 0) { %>
				 			<table cellpadding="25" border="0" align="center">
							<tr>
 							<% for (i = temp; i <= (temp + numOfRecordsInPage) && times >= 0; i++) {
				 				times = (Integer) s1.getAttribute("total_no_of_rows");
				 				times--;
				 				s1.setAttribute("total_no_of_rows", times);
				
				 				sgrno = rs.getString("GRNO");
				 				String FirstName = rs.getString("FIRSTNAME");
				 				String LastName = rs.getString("LASTNAME");
				 				String Photo = rs.getString("PHOTO");
				 				String Company = rs.getString("COMPANY");
								%>
									<td>
										<center><img src="<%=Photo%>" width="150" height="100" alt="<%=sgrno%>" /></center>
										<center> <c:out value="<%=FirstName%>" /> . <c:out value="<%=LastName%>" /></center>
										<center><c:out value="<%=Company%>" /></center>
			
										<br/>
										<form action="u_Addfriend" method="POST">
											<input type="hidden" name="sgrno" value="<%=sgrno%>">
											<center><button name="Addfriend" value="<%=sgrno%>" onclick="submit()">Add Friend</button></center>
										</form>
									</td>
									<td></td>
								<%
				 				if (times > 0) {
				 					rs.next();
				 				} else {
				 					//out.print("bas have pati gayu!!");
				 					break;
				 				}
 							}
							%>
							</tr>
							</table>
							<% 
				 			if (times >= 1) {
				 				int current_row_no = rs.getRow() - 2;
				 				s1.setAttribute("current_row_no", current_row_no);
				 				s1.setAttribute("counter", i);
							    %>
  						        <center><a href="/Student-Alumni/User/u_FriendSearchResult.jsp"> View More </a></center> 
						       <%
				 			   break;
				 			} 
				 			else
				 				//out.print("all overr");
 							break;
 					}
			 	} 
				finally {
			 		try {
			 			if (!rs.isClosed()) rs.close();
			 			if (!st.isClosed()) st.close();
			 			if (!con.isClosed()) con.close();
			 		} catch (Exception e) {
			 			log(e.getMessage());
			 		}
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

