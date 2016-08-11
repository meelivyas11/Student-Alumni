<%-- 
    Document   : a_SeeActiveStudent
    Created on : Mar 23, 2009, 8:46:38 AM
    Author     : Meeli Vyas
--%>

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

<%@page import="com.studentAlumni.DataProvider.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<link rel="stylesheet" type="text/css"
	href="/Student-Alumni/CSS/common.css" />
</head>

<body>
	<div id="header">
		<jsp:include page="a_Lheader.jsp"></jsp:include>
		<br>
	</div>

	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="20%" height="85%"><jsp:include
						page="admin_options.jsp"></jsp:include></td>
				<td width="80%" height="85%">
					<%
						DataSource ds = DBUtils.getOracleDataSource();
						String query = DBUtils.GET_ALL_LOGINTABLE;
					%> 
					<sql:setDataSource var="db" dataSource="<%=ds%>" /> 
					<sql:query
						var="query1" dataSource="${db}" sql="<%=query%>">
					</sql:query> 
					
					<table width=100% border=3 align="left">
						<thead>
							<tr>
								<th>USERID</th>
								<th>PASSWORD</th>
								<th>STATUS</th>
								<th>GRNO</th>
								<th>ROLE</th>
							</tr>
						</thead>

						<c:forEach var="row" items="${query1.rows}">
							<tr>
								<td><c:out value="${row.USERID}" /></td>
								<td><c:out value="${row.PASSWORD}" /></td>
								<td><c:out value="${row.STATUS}" /></td>
								<td><c:out value="${row.GRNO}" /></td>
								<td><c:out value="${row.ROLE}" /></td>
							</tr>
						</c:forEach>
						<form action="a_UpdateActiveStudents.jsp">
							<pre>
								<b>Enter The GRNO of Record To Be Updated :<input type="text" name="upgrno" value="" size="6" /></b>
								<input type="submit" value="Update" name="Update" />
				            </pre>
						</form>
					</table>
				</td>
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