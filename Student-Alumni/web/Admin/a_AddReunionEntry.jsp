<%--
    Document   : a_AddReunionEntry
    Created on : Mar 22, 2009, 7:53:16 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@   taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@   taglib  prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@   taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.sql.DataSource" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="javax.servlet.RequestDispatcher" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin</title>
    <link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
</head>

<body>
<div>
    <jsp:include page="a_Lheader.jsp"></jsp:include>
    <br>
</div>

<div id="middle">
	<table border="10" width="100%">
	    <tr>
	        <td width="20%" height="85%">
	            <jsp:include page="/Admin/admin_options.jsp"></jsp:include>
	        </td>
	        <td width="80%" height="85%">
			   <form action="a_AddReunionDetails">
		           <pre>
						Year And Branch     : <input type="text" name="YearBranch" value="" size="30" /> <br>
						Date (yyyy-mm-dd) : <input type="text" name="date" value="" size="10" /> <br>
						Venue And Time (150 characters only) : <textarea name="Venue" wrap="virtual" cols="30" rows="5"></textarea> <br>
						<input type="submit" value="Make-Entry" name="Make-Entry" />
			       </pre>
		   	  </form>
	        </td>
	    </tr>
	</table>
</div>

<div>
    <br>
    <jsp:include page="a_Lfooter.jsp"></jsp:include>
</div>
</body>
</html>