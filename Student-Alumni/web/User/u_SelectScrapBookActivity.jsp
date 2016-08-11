
<%--
    Document   : u_SelectScrapBookActivity
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
				<td width="85%" height="85%" valign="middle" align="center">
					<table cellpadding="5" class="ScrapSelectTable">
						<tr>
							<td>
								<form action="/Student-Alumni/User/u_SelectScrapBookActivity.jsp">
										Select Your Activity <br><br> 
										<input type="radio" name="Scrap" value="SendScrap" /> Send A Scrap<br> 
										<input type="radio" name="Scrap" value="ViewScrap" /> View A Scrap<br><br>
										<input type="submit" value="Continue" name="Continue" />
								</form>
							</td>
						</tr>
					</table> 
					<%
				 	String str = request.getParameter("Continue");
				 	if (str != null && str.equals("Continue")) {
				 		String Scrap = request.getParameter("Scrap");
				 		if (Scrap.equals("SendScrap")) {
				 			RequestDispatcher rd = request.getRequestDispatcher("/User/u_SendScrap.jsp");
				 			rd.forward(request, response);
				 		} else {
				 			int temp = 0;
				 			s1.setAttribute("counter", temp);
				 			RequestDispatcher rd = request.getRequestDispatcher("/User/u_ViewScrap.jsp");
				 			rd.forward(request, response);
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

