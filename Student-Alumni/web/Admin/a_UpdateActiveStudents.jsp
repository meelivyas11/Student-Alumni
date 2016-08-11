<%-- 
    Document   : a_UpdateActiveStudents.jsp
    Created on : Mar 23, 2009, 8:53:02 AM
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
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>


<%@page import="com.studentAlumni.Domain.*"%>

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
				<td width="20%" height="85%"><jsp:include
						page="admin_options.jsp"></jsp:include></td>
				<td width="80%" height="85%">

					<form action="a_UpdateActiveStudents.jsp">
						<%
							String grno = request.getParameter("upgrno");
							LoginTable lgt = null;
							lgt = a_LoginTable_update.OrgData(grno);
	
							String str = request.getParameter("Submit");
					 		if (str != null && str.equals("Submit")) {
							 %> 
								<jsp:useBean id="lt2" class="com.studentAlumni.Domain.LoginTable" scope="request">
									<jsp:setProperty name="lt2" property="*" />
								</jsp:useBean> 
							 <%
							 	boolean status = a_LoginTable_update.update(lt2);
							 	lgt = lt2;
							 	if (status == true) {
							 		out.print("Successfully Updated");
							 	} 
							 	else {
							 		out.print("Fail to update!");
							 	}
						 	}
					 %>
						<pre>
							UserId   : <input type="text" name="userid" value="<%=lgt.getUserid()%>" size="20" /><br>
							Password : <input type="text" name="password" value="<%=lgt.getPassword()%>" size="20" /><br>
							Status   : <input type="text" name="status" value="<%=lgt.getStatus()%>" size="20" /><br>
							GrNo     : <input type="text" name="grno" value="<%=lgt.getGrno()%>" size="20" /><br>
							Role     : <input type="text" name="role" value="<%=lgt.getRole()%>" size="8" /><br>
							   <input type="submit" value="Submit" name="Submit" />
						 </pre>
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