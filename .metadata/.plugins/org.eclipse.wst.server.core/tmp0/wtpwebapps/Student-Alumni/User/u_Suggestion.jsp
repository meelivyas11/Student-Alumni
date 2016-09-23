
<%--
    Document   : u_Suggestion
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
<link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
</head>

<body>
	<div>
		<jsp:include page="u_header.jsp"></jsp:include>
	</div>
	<%
		HttpSession s1 = request.getSession();
		String grno = (String) s1.getAttribute("grno");
	%>
	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="15%" height="85%">
					<jsp:include page="user_options.jsp"></jsp:include>
				</td>
				<td width="85%" height="85%" style="vertical-align: text-top;">
					<form action="u_Suggestion">
						<input type="hidden" name="sugg_grno" value="<%=grno%>" size="6" />
						<center class="AllTitles"><h2>Suggestion</h2></center>
						<table width="50%" align="center" class="SuggestionTable">
							<tr>
								<td>First Name : </td><td> <input type="text" name="firstname" value="" size="20" /></td>
							</tr>
							<tr>
								<td>Last Name  : </td><td> <input type="text" name="lastname" value="" size="20" /></td>
							</tr>
							<tr>
								<td>Suggestion : </td><td> <textarea name="suggestion" wrap="virtual" cols="30" rows="5"></textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Submit" name="Submit" /></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>

	<div>
		<br>
		<jsp:include page="u_footer.jsp"></jsp:include>
	</div>
</body>
</html>

