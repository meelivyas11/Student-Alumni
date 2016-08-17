<%--
    Document   : u_SelectSearchOptions
    Created on : Mar 22, 2009, 7:34:00 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>

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
	<%
		HttpSession s1 = request.getSession();
		String grno = (String) s1.getAttribute("grno");
	%>
	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="20%" height="85%"><jsp:include
						page="user_options.jsp"></jsp:include></td>
				<td width="80%" height="85%" style="vertical-align: text-top;">
					<form action="u_EnterSearchValues.jsp">
						<center class="AllTitles"><h2>Select Search Criteria</h2></center>
						<table align="center" class="SuggestionTable" cellpadding="5px">
							<tr><td><input type="radio" name="ser" value="grno_userid" />Search By Grno. And/Or Userid </td></tr>
							<tr><td><input type="radio" name="ser" value="name_email" />Search By Name And/Or Email-Address </td></tr>
							<tr><td><input type="radio" name="ser" value="yop_branch_degree" />Search By Year Of Passing , Branch And/Or Degree </td></tr>
							<tr><td><input type="radio" name="ser" value="current" />Search By Current Prospects </td></tr>
							<tr><td><input type="submit" value="Search" name="Search" /></td></tr>
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























































