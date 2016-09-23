<%-- 
    Document   : a_Search_DB
    Created on : Mar 23, 2009, 5:05:27 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


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
				<td width="20%" height="85%">
					<jsp:include page="admin_options.jsp"></jsp:include>
				</td>
				<td width="80%" height="85%">

					<center>
						<h2>You Are Requested To Click On The DataBase</h2>
					</center>
					<center>
						<h3>That You Wish To See</h3>
					</center>
					<center>
						<h1>THANKS !!</h1>
					</center> 
					<a class="Common_options" href="a_SeeStudentsOfCollege.jsp">Students Of College</a>
					&nbsp;&nbsp; 
					<a href="a_SeeActiveStudent.jsp" class="Common_options"> Active Students</a>
					&nbsp;&nbsp; 
					<a	href="a_Profile_DB.jsp" class="Common_options"> Students Profile </a>
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