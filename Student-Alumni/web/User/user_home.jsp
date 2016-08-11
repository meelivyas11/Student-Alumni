
<%-- 
    Document   : admin_home
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
	<div>
		<table border="10" width="100%" align="left">
			<tr>
				<td width="10%">
					<jsp:include page="user_options.jsp"></jsp:include>
				</td>
				<td width="80%" style="margin-right: 20em" align="right" valign="top">
					<%
						int temp = 0;
						s1.setAttribute("counter", temp);
					%>  <jsp:include page="/User/u_FrontPageFriendsList.jsp"></jsp:include> 
				</td>
			</tr>
		</table>
	</div>

	<div id="footer">
		<jsp:include page="u_footer.jsp"></jsp:include>
	</div>
</body>
</html>

