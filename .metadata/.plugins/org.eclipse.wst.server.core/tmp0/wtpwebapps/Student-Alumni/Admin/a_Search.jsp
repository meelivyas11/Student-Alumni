<%-- 
    Document   : Search
    Created on : Mar 23, 2009, 1:07:54 AM
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<link rel="stylesheet" type="text/css"
	href="/Student-Alumni/CSS/common.css" />
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
					<jsp:include page="admin_options.jsp"></jsp:include>
				</td>
				<td width="80%" height="85%">
					<form action="a_Search_Result.jsp">
						<center>
							<h2>You Are Requested To Enter All Details You Know About The Person</h2>
						</center>
						<center>
							<h3>Please Enter Only Those Field That U Are Sure For</h3>
						</center>
						<center>
							<h1>THANKS !!</h1>
						</center>
						<pre>
	                       GrNo.           : <input type="text"	name="asgrno" value="" size="20" /><br>
	                       First Name      : <input type="text" name="asfname" value="" size="20" /><br>
	                       Last  Name      : <input type="text" name="aslname" value="" size="20" /><br>
	                       Year Of Passing : <input type="text" name="asYOP" value="" size="20" /><br>
	                       Branch          : <input type="text" name="asbranch" value="" size="20" /><br>
	                       Userid          : <input type="text" name="asuserid" value="" size="20" /><br>
                        </pre>
						<center>
							<input type="submit" value="Search" name="Search" />
						</center>
						<br>
						<br>
					</form>
				</td>
			</tr>

			</tbody>
		</table>


	</div>




	<div>
		<br>
		<jsp:include page="a_Lfooter.jsp"></jsp:include>
	</div>
</body>
</html>