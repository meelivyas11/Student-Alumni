<%--
    Document   : u_ScrapReply
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
<%@page import="java.util.*"%>

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
		String Sgrno = (String) s1.getAttribute("grno");
		String Rgrno = request.getParameter("Sgrno");
		String Remail = request.getParameter("Semail");
		//out.print(Sgrno);
		if (Sgrno != null) {
	%>
	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="20%" height="85%">
					<jsp:include page="user_options.jsp"></jsp:include>
				</td>
				<td width="80%" height="85%" valign="top" align="left">
					<form action="u_SendMessage">
						<pre>
				            <input type="hidden" name="Rgrno" value="<%=Rgrno%>">
				            <input type="hidden" name="Destination" value="<%=Remail%>">
				            Message : (Only 150 Character Message)
				            <textarea name="Message" wrap="virtual" cols="30" rows="5"></textarea>
				            <center> <input type="submit" value="Send" name="Send" /> </center>
                		</pre>
					</form> 
					<%
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

