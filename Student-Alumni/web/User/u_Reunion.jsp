<%--
    Document   : u_Reunion
    Created on : Mar 22, 2009, 7:53:16 AM
    Author     : Meeli Vyas
--%>

<%@page import="com.studentAlumni.DataProvider.DBUtils"%>
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


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student</title>
<link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
</head>

<body>
	<div>
		<jsp:include page="u_header.jsp"></jsp:include>
		<br>
	</div>

	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="15%" height="100%">
					<jsp:include page="user_options.jsp"></jsp:include>
				</td>
				<td width="85%" height="100%">
					<%
						DataSource ds = DBUtils.getOracleDataSource();
					%> 
					<sql:setDataSource var="db" dataSource="<%=ds%>" /> 
						<sql:query var="query1" dataSource="${db}" sql="select * from REUNION"> </sql:query> 
					<center><h2>Reunion Details</h2></center>
					<table width=60% border=3 align="center">
						<thead>
							<tr>
								<th>REUNION DATE</th>
								<th>VENUE AND TIME</th>
								<th>YEAR AND BRANCH</th>
							</tr>	
						</thead>

						<c:forEach var="row" items="${query1.rows}">
							<tr>
								<td width="15%" align="center" ><c:out value="${row.RDATE}" /></td>
								<td height="" width="10%" align="center"><textarea readonly cols="30" rows="5">${row.VENUE}</textarea></td>
								<td width="20%" align="center"><c:out value="${row.YEARBRANCH}" /></td>
							</tr>
						</c:forEach>
					</table>
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