<%-- 
    Document   : admin_home
    Created on : Mar 22, 2009, 7:53:16 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
<link rel="stylesheet" type="text/css" 	href="/Student-Alumni/CSS/common.css" />
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
				<td width="80%" height="85%"></td>
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