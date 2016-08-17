<%--
    Document   : u_ChangePhoto
    Created on : Mar 22, 2009, 7:34:00 AM
    Author     : Meeli Vyas
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.studentAlumni.DataProvider.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.RequestDispatcher"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student</title>
<link rel="stylesheet" type="text/css"
	href="/Student-Alumni/CSS/common.css" />
</head>

<body>
	<div>
		<jsp:include page="u_header.jsp"></jsp:include>
		<br>
	</div>

	<div id="middle">
		<table border="10" width="100%">
			<tr>
				<td width="15%" height="85%">
					<jsp:include page="user_options.jsp"></jsp:include>
				</td>
				<td width="85%" height="85%">
					<form action="u_ChangePhoto.jsp">
						Select A Photo :
						    <input type="radio" name="photo" value="/Student-Alumni/images/Garden.jpg" checked="checked" />
							<img src="/Student-Alumni/images/Garden.jpg" width="75" height="76" alt="Garden" />
							<input type="radio" name="photo" value="/Student-Alumni/images/Autumn Leaves.jpg" />
							<img src="/Student-Alumni/images/Autumn Leaves.jpg" width="75" height="76" alt="Autumn Leaves" />
							<input type="radio" name="photo" value="/Student-Alumni/images/Forest.jpg" />
							<img src="/Student-Alumni/images/Forest.jpg" width="75" height="76" alt="Forest" />
							<br>
							<input type="radio" name="photo" value="/Student-Alumni/images/Creek.jpg" />
							<img src="/Student-Alumni/images/Creek.jpg" width="75" height="76" alt="Creek" />
							<input type="radio" name="photo" value="/Student-Alumni/images/Waterfall.jpg" />
							<img src="/Student-Alumni/images/Waterfall.jpg" width="75" height="76" alt="Waterfall" />
							<input type="radio" name="photo" value="/Student-Alumni/images/Humpback Whale.jpg" />
							<img src="/Student-Alumni/images/Humpback Whale.jpg" width="75" height="76" alt="Humpback Whale" />
							<br>
							
							<center>
								<input type="submit" value="Change_Photo" name="Change_Photo" />
							</center>

						<%
							String str = request.getParameter("Change_Photo");
							if (str != null && str.equals("Change_Photo"))
							{
								Connection con = null;
								PreparedStatement ps = null;
								String photo = request.getParameter("photo");
								HttpSession s1 = request.getSession();
								String grno = (String) s1.getAttribute("grno");

								try {

									con = DBUtils.getConnectionObj();
									ps = con.prepareStatement(DBUtils.UPDATE_PROFILE_PHOTO);
									ps.setString(1, photo);
									ps.setString(2, grno);
									int rs = ps.executeUpdate();
									RequestDispatcher rd = null;
									if (rs == 1) {
										rd = request.getRequestDispatcher("/User/user_home.jsp?grno=" + grno);
									}

									else {
										rd = request.getRequestDispatcher("/Error.html");
									}
									rd.forward(request, response);
								} finally {
									try {
										if (!ps.isClosed()) ps.close();
										if (!con.isClosed()) con.close();
									} catch (Exception e) {
										log(e.getMessage());
									}
								}
							}
						%>
					</form>
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

