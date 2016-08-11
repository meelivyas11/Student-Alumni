<%-- 
    Document   : Lheader
    Created on : Mar 22, 2009, 7:41:33 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
</head>
<body>
		<div id="header">
		<div id="logo" align="center">
			<h1>
				SankalChand Patel College Of Engg. 
			</h1>
		</div>
		<div id="Student-Alumni">
			<h2>Student-Alumni</h2>
		</div>
	</div>
		<div id="TopMenuOptions">
			<br> &nbsp; <a class="Lhomeheader" href="/Student-Alumni/Admin/admin_home.jsp"> Home</a>
		&nbsp;&nbsp;|&nbsp;&nbsp; <a href="/Student-Alumni/Admin/a_Search.jsp"
			class="Lhomeheader">Search </a> &nbsp;&nbsp;|&nbsp;&nbsp;
		<%
			String grno = (String) session.getAttribute("grno");
			String message = null;
			if (grno != null && grno.length() != 0) {
				message = "Logout";
			} else {
				message = "Login";
			}
			String url = response.encodeURL("/Student-Alumni/" + message);
		%>
		<a class="Lhomeheader" href=<%=url%>><%=message%> </a>
		</div>
		<br><br>
</body>
</html>

