<%-- 
    Document   : a_UpdateStudentsOfCollege
    Created on : Mar 23, 2009, 6:15:02 AM
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
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.studentAlumni.Domain.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Amin</title>
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
					<jsp:include page="admin_options.jsp"></jsp:include>
				</td>
				<td width="80%" height="85%">
					<%
					try {
						StudentofCollege student = null;
						String upgrno = request.getParameter("upgrno");
						HttpSession s1 = request.getSession();
						String grno = (String) s1.getAttribute("grno");
					
					 	String str = request.getParameter("Submit");
					 	if (str != null && str.equals("Submit")) {
					 		%> 
							
							<jsp:useBean id="u2" class="com.studentAlumni.Domain.StudentofCollege" scope="request">
								<jsp:setProperty name="u2" property="*" />
							</jsp:useBean> 
							
							<%
					 		boolean status = a_UpdateStudentsOfCollege.update(u2);
					 		student = u2;
					 		if (status == true) {
					 			out.print("Successfully Updated");
					 		} 
					 		else {
					 			out.print("Fail to update!");
					 		}
					 	} else {
					 		student = a_UpdateStudentsOfCollege.OrgData(upgrno);
					 	}
					 	
					 	if(student!=null) 
					 	{
							%>
							<form action="a_UpdateStudentsOfCollege.jsp">
								<pre>
									GrNo            : <input type="text" name="grno" value="<%=student.getGrno()%>" size="20"/><br>
									First Name      : <input type="text" name="firstname" value="<%=student.getFirstname()%>" size="20" /><br>
									Last Name       : <input type="text" name="lastname" value="<%=student.getLastname()%>" size="20" /><br>
									Gender          : <input type="text" name="gender" 	value="<%=student.getGender()%>" size="20" /><br>
									BirthDate       : <input type="text" name="birthdate" value="<%=student.getBirthdate()%>" size="8" /><br>
									Admission      : <input type="text" name="addmission" value="<%=student.getAddmission()%>" size="8" /><br>
									Aggregate       : <input type="text" name="aggregate" value="<%=student.getAggregate()%>" size="4" /><br>
									Year Of Passing : <input type="text" name="yearofPassing" value="<%=student.getYearofPassing()%>" size="4" /><br>
									Branch          : <input type="text" name="branch"	value="<%=student.getBranch()%>" size="20" /><br>
		 							<input type="submit" value="Submit" name="Submit" />
		  						</pre>
							</form>
							<%
					 	}
					 	else
					 	{
					 		RequestDispatcher rd = request.getRequestDispatcher("/Admin/a_SeeStudentsOfCollege.jsp");
					 		rd.forward(request, response);
					 	}
					}
					catch(Exception ex){
						out.print(ex);
					}
						%>
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