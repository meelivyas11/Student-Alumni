<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Decorative
Description: Fixed-width, two-column design from small sites and blogs.
Version    : 1.0
Released   : 20071101

-->

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="com.studentAlumni.DataProvider.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Student-Alumni</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/Student-Alumni/CSS/common.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
	<div id="user_options">
		<ul>
			<table border="0" width="100%" align="left" valign="top">
				<tr>
					<%
					 	HttpSession s1 = request.getSession();
					 	String grno = (String) s1.getAttribute("grno");
					 	String photo = "";
					 	Connection con = null;
					 	PreparedStatement ps = null;
					 	ResultSet rs = null;
					 	try {
					
					 		con = DBUtils.getConnectionObj();
					 		ps = con.prepareStatement(DBUtils.GET_PROFILE_FROM_GRNO);
					 		ps.setString(1, grno);
					 		rs = ps.executeQuery();
					
					 		if (rs.next()) {
					 			photo = rs.getString("PHOTO");
					 			grno = rs.getString("GRNO");
					 		}
					 	} finally {
					 		try {
					 			if (!rs.isClosed()) rs.close();
					 			if (!ps.isClosed())	ps.close();
					 			if (!con.isClosed()) con.close();
					 		} catch (Exception e) {
					 			log(e.getMessage());
					 		}
					 	}
					 %>
					<td><br>
							<table border="0">
								<tr>
									<td><img align="center" src="<%=photo%>" width="100" height="100" alt="<%=grno%>" /></td>
								</tr>
								<tr>
									<td><a class="user_options" href="/Student-Alumni/User/u_ChangePhoto.jsp">Change Photo</a></td>
								</tr>
							</table>
							<br><br>
									<a class="user_options" href="/Student-Alumni/User/u_UpdateProfile.jsp">Update Profile</a><br>
									<a class="user_options" href="/Student-Alumni/User/u_SeePendingFriendsRequest.jsp">Pending Friends Request</a><br>
									<a class="user_options" href="/Student-Alumni/User/u_SelectScrapBookActivity.jsp">Scrap-book</a><br>
									<a class="user_options" href="/Student-Alumni/User/u_SearchFriend.jsp">Search Friends</a><br>
									<a class="user_options" href="/Student-Alumni/User/u_Suggestion.jsp">Suggestion Window</a><br>
									<a class="user_options" href="/Student-Alumni/User/u_Reunion.jsp">Reunion Information</a><br>
									<!--    <a  class="Common_options"href="/Student-Alumni/User/Advertizment.jsp" >Advertizment</a><br></li>
              								<a  class="Common_options"href="/Student-Alumni/User/Career_Mentoring.jsp" >Career Mentoring</a><br></li>
              								<a  class="Common_options"href="/Student-Alumni/User/Pacement.jsp" >Placement Window</a><br></li>   -->
									<br></td>
				</tr>
			</table>
		</ul>
	</div>
</body>
</html>
