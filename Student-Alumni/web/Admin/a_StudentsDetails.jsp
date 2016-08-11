<%-- 
    Document   : a_StudentsDetails
    Created on : Mar 23, 2009, 1:09:03 PM
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
				<td width="20%" height="85%">
					<jsp:include page="admin_options.jsp"></jsp:include>
				</td>
				<td width="80%" height="85%">
					<%
						String grno = request.getParameter("grno");
					%> 
					<jsp:useBean id="s1"
						class="com.studentAlumni.Domain.StudentofCollege" scope="request">
						<jsp:setProperty name="s1" property="*" />
					</jsp:useBean>
					 <%
					 	StudentofCollege student = null;
					 	student = a_UpdateStudentsOfCollege.OrgData(grno);
					 %> 
					 <pre>
						GrNo            : <%=student.getGrno()%><br>
						First Name      : <%=student.getFirstname()%><br>
						Last Name       : <%=student.getLastname()%><br>
						Gender          : <%=student.getGender()%><br>
						BirthDate       : <%=student.getBirthdate()%><br>
						Addmission      : <%=student.getAddmission()%><br>
						Aggregate       : <%=student.getAggregate()%><br>
						Year Of Passing : <%=student.getYearofPassing()%><br>
						Branch          : <%=student.getBranch()%><br>
		          </pre>
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

