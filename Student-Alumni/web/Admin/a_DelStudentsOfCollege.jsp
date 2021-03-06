<%-- 
    Document   : a_DelStudentsOfCollege
    Created on : Mar 23, 2009, 9:44:31 AM
    Author     : Meeli Vyas
--%>

<%@page import="com.studentAlumni.DataProvider.DBUtils"%>
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


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SeeStudentsOfCollege</title>
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
				<td width="20%" height="85%">
					<jsp:include page="/Admin/admin_options.jsp"></jsp:include>
				</td>
				<td width="80%" height="85%">
					<%
						DataSource ds = DBUtils.getOracleDataSource();
						String query = DBUtils.GET_ALL_STUDENTDATA;
					%> 
					<sql:setDataSource var="db" dataSource="<%=ds%>" /> 
					<sql:query
						var="query1" dataSource="${db}" sql="<%=query%>">
					</sql:query> 
					<br>
					<br>

					<table width=100% border=3 align="left">
						<thead> 
							<tr> 
								<th>GRNO</td>
								<th>FIRSTNAME</th>
								<th>LASTNAME</th>
								<th>GENDER</th>
								<th>BIRTHDATE</th>
								<th>ADDMISSION</th>
								<th>AGGREGATE</th>
								<th>YEAR OF PASSING</th>
								<th>BRANCH</th>
							</tr>
						</thead>

						<c:forEach var="row" items="${query1.rows}">
							<tr>
								<td><c:out value="${row.GRNO}" /></td>
								<td><c:out value="${row.FIRSTNAME}" /></td>
								<td><c:out value="${row.LASTNAME}" /></td>
								<td><c:out value="${row.GENDER}" /></td>
								<td><c:out value="${row.BIRTHDATE}" /></td>
								<td><c:out value="${row.ADDMISSION}" /></td>
								<td><c:out value="${row.AGGREGATE}" /></td>
								<td><c:out value="${row.YEAROFPASSING}" /></td>
								<td><c:out value="${row.BRANCH}" /></td>
							</tr>
						</c:forEach>
						<form action="a_DelStudentsOfCollege">
							<pre>
								<b>Enter The GRNO of Record To Be Deleted :<input type="text" name="delgrno" value="" size="6" /> </b>
								<center><input type="submit" value="Delete" name="Delete" id="Delete" /></center>
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