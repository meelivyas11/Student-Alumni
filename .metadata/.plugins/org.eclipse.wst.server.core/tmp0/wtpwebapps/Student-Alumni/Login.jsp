<%-- 
    Document   : Login
    Created on : Mar 22, 2009, 7:07:11 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.studentAlumni.servlet.*"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student-Alumni</title>
<link rel="stylesheet" type="text/css"
	href="/Student-Alumni/CSS/default.css" />


</head>
<body>
	<div id="header" class="header">
		<div id="logo">
			<h1>
				SankalChand Patel College Of Engg. 
			</h1>
		</div>
		<div id="Student-Alumni" style="margin-right: auto">
			<h2>Student-Alumni</h2>
		</div>
	</div>

	<div id="middle">
		<table width="100%" height="80%" align="center">
			<tr>
				<td >
					<table style="margin-left: 1em" border="1">
						<td>
							<center>
								<form action="Login">
									<br> <br> 
									User ID:&nbsp;
										<input type="text" id="userid"	name="userid" size="20" onblur="ckuserid(this)" /> 
									<br> <br>
									Password:&nbsp;
										<input type="password" id="password" name="password" size="20" onblur="ckpassword(this)" /> 
									<br><br>
									<input type="submit" value="Login" name="Login" />
								</form>
							</center> <br>
						<br>
						<br>
						<center>
							 <b>Want To Register Yourself ??</b> 
						</center>
						<br>
							<form action="register.jsp">
								<center>
									<input type="submit" value="Register" name="Register" />
								</center>
								<br>
								<br>
							</form>
						</td>
					</table>

				</td>
			</tbody>
		</table>
	</div>

	<div id="footer"></div>

</body>
</html>
