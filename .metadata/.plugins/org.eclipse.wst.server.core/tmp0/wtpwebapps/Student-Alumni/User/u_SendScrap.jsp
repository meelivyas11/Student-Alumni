<%--
    Document   : u_SendScrap
    Created on : Mar 22, 2009, 7:34:00 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.sql.DataSource" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

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
	        <td width="85%" height="85%" valign="top" align="left">
			<br><br> <br>
	            <form action="u_SendMessage">
					 <table align="center" cellpadding="5" class="ScrapSelectTable">
					 	<tr><td>(Separate The Email-Address By Comma(,))</td></tr>
					 	<tr><td>TO : <input type="text" name="Destination" value=""/></td></tr>
					 	<tr><td>Message : (Only 150 Character messages)</td></tr>
					 	<tr><td><textarea name="Message" wrap="virtual" cols="30" rows="5" ></textarea></td></tr>
					 	<tr><td> <center><input type="submit" value="Send" name="Send" /></center></td></tr>
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

