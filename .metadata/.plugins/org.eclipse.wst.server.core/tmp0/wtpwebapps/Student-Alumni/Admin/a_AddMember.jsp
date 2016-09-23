<%-- 
    Document   : a_AddMember
    Created on : Mar 22, 2009, 11:24:07 PM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>a_AddMember</title>
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
					<jsp:include page="/Admin/admin_options.jsp"></jsp:include>
				</td>
				<td width="80%" height="85%">
					<%
						String msg = "Administrator";
						HttpSession s1 = request.getSession();
						s1.setAttribute("Sender", msg);
					%>
					<form action="/Student-Alumni/req_reg">
							<pre>
							User ID            : <input type="text" name="userid" id="userid" value="" size="20" />
							Gr No.             : <input type="text" name="grno" id="grno" value="" size="20" />
							Password           : <input type="password" name="password" id="password" value="" size="20" />
							Retype Password    : <input type="password" name="conform" id="conform"	value="" size="20" />
							Status       : <select name="status"><option>PENDING</option>
																<option>ACTIVE</option> 
											</select>
							Role        : <select name="role"><option>Admin</option>
																<option>User</option> </select>

							<input type="submit" value="submit" name="submit" id="submit" /> 
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
