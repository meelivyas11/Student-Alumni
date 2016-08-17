
<%--
    Document   : a_ViewSuggestion
    Created on : Mar 22, 2009, 7:34:00 AM
    Author     : Meeli Vyas
--%>

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
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="com.studentAlumni.DataProvider.DBUtils"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
</head>

<body>
	<div>
		<jsp:include page="a_Lheader.jsp"></jsp:include>
	</div>


	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="20%" height="85%" valign="top">
					<jsp:include page="/Admin/admin_options.jsp"></jsp:include>
				</td>
				<td width="80%" height="85%" valign="top" align="left"><br>
					<%
						HttpSession s1 = request.getSession();
						Statement st = null, st2 = null;
						Connection con = null, con2 = null;
						ResultSet rs = null, rs2 = null;
						boolean flag = false;
						String grno = (String) s1.getAttribute("grno");
						String query = DBUtils.GET_ALL_SUGGESTIONS;
						try {

							int times;
							con = DBUtils.getConnectionObj();
							st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
							rs = st.executeQuery(query);
							%>
							<center><h2>Suggestion</h2></center>
							<table border="6" align="center" cellpadding="10" class="scrap">
							<%
								while (rs.next()) {
										flag = true;
										String FirstName = rs.getString("FIRSTNAME");
										String LastName = rs.getString("LASTNAME");
										String sugg_grno = rs.getString("GRNO");
										String suggestion = rs.getString("SUGGESTION");
										%>
										<tr>
											<td width="25%" class="SuggestionTable">
												Name : <c:out value="<%=FirstName%>" />.<c:out value="<%=LastName%>" /><br>
												Grno. : <c:out value="<%=sugg_grno%>" /><br>
											</td>
											<td width="65%" class="SuggestionTable"><%=suggestion%>
												<form action="a_DeleteSuggestion">
													<center>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="hidden" name="sugg_grno" value="<%=sugg_grno%>">
														<button name="sugg_grno" value="<%=sugg_grno%>"	onclick="submit()">Delete</button>
													</center>
												</form>
											</td>
										</tr>
										<%
									}
									if (flag == false) {
									%>
										<tr>
										<td width="100%" class="SuggestionTable">
											<h2>CURRENTLY THERE ARE NO SUGGESTIONS</h2>
											<h3>You Are Requested To Check This Every 24hrs</h3>
											<h1>THANKS!!</h1>
										</td> 
									</tr>
								<%
									}
							%>
					</table> <%
 	} finally {
 		try {
 			if (!rs.isClosed()) rs.close();
 			if (!st.isClosed()) st.close();
 			if (!con.isClosed()) con.close();
 		} catch (Exception e) {
 			log(e.getMessage());
 		}
 		//out.close();
 	}
 %></td>
			</tr>

			</tbody>
		</table>


	</div>




	<div id="footer">
		<br>
		<jsp:include page="a_Lfooter.jsp"></jsp:include>
	</div>
</body>
</html>

