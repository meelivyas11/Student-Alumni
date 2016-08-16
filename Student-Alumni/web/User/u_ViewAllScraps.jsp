<%--
    Document   : u_ViewAllScraps
    Created on : Mar 22, 2009, 7:34:00 AM
    Author     : Meeli Vyas
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.studentAlumni.DataProvider.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@   taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@   taglib  prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@   taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.sql.DataSource" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="javax.servlet.RequestDispatcher" %>

<link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student</title>
    <link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
</head>

<body>
<div>
    <jsp:include page="u_header.jsp"></jsp:include>
</div>


<div id="middle">
<table border="10" width="100%">
    <tr>
        <td width="15%" height="85%" valign="top">
            <jsp:include page="user_options.jsp"></jsp:include>
        </td>
        <td width="85%" height="85%" valign="top" align="left">
            <%
	        HttpSession s1 = request.getSession();
	        PreparedStatement ps = null, ps2 = null;
	        Connection con = null, con2 = null;
	        ResultSet rs = null, rs2 = null;
	        String grno = (String) s1.getAttribute("grno");
			
    	    try {
	            int times;
	            con = DBUtils.getConnectionObj();
	            ps = con.prepareStatement(DBUtils.GET_SCRAP_BY_RGRNO,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ps.setString(1, grno);
	            rs = ps.executeQuery();
	            
	            int row = (Integer) s1.getAttribute("current_row_no");
	            rs.absolute(row);
	            times = (Integer) s1.getAttribute("totalrows");
		        %>
		        <center><h2>My Messages</h2></center>
         		<table border="6"align="center" cellpadding="5" class="scrap">
	                <tr>
                    <%
                        while (rs.next()) {
                            String Sender_email = rs.getString("SEMAIL");
                            String Sgrno = rs.getString("SGRNO");
                            String Message = rs.getString("MESSAGE");
                            con2 = DBUtils.getConnectionObj();
                            
                            ps2 = con2.prepareStatement(DBUtils.GET_PROFILE_BY_EMAILADDRESS, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ps2.setString(1, Sender_email);
                            rs2 = ps2.executeQuery();
                            
                            if (rs2.next()) {
                                String FirstName = rs2.getString("FIRSTNAME");
                                String LastName = rs2.getString("LASTNAME");
                                String Photo = rs2.getString("PHOTO");
			                    %>
							    <tr>
							      <td width="25%" class="C2" >
							             <center><img align="center" src="<%=Photo%>" width="100" height="100" alt="<%=Sgrno%>"/></center>
							                <center><c:out value="<%=FirstName%>" />.<c:out value="<%=LastName%>" /></center>
							                <center><c:out value="<%=Sender_email%>" /></center>
							      </td>
							      <td width="55%" class="C2">
							         <%=Message%>
							      </td>   
							      <td width="55%" class="C2">
							            <form action="u_DeleteMessage" method="post">
							          		<center>
							          			<input type="hidden" name="Sgrno" value="<%= Sgrno%>">
							          			<input type="hidden" name="Message" value="<%=Message%>">
							              		<button name="Sgrno" value="<%=Sgrno%>" onclick="submit()">Delete</button>
							              	</center>
							             </form>
								  </td>
							      <td width="55%" class="C2">
							         	 <form  action="/Student-Alumni/User/u_ScrapReply.jsp">
							            	<center>
								              	<input type="hidden" name="Sgrno" value="<%= Sgrno%>">
								              	<input	type="hidden" name="Semail" value="<%=Sender_email%>">
							           		    <button name="Sgrno" value="<%=Sgrno%>" onclick="submit()">Reply</button>
							           		</center>
						           		</form>
								  </td>
							   </tr>
			                   <%
                            }
                            if (!rs2.isClosed()) rs2.close();
                            if (!ps2.isClosed()) ps2.close();
                            if (!con2.isClosed()) con2.close();
                        }
                    %>
                </tr>
            </table>
            <%
        	} 
    	    finally {
	            try {
	                if (!rs.isClosed()) rs.close();
	                if (!ps.isClosed()) ps.close();
	                if (!con.isClosed()) con.close();
	            } catch (Exception e) {
                log(e.getMessage());
            }
	        //out.close();
       		}
          	 %>
        	</td>
   		</tr>
	</table>
</div>
<div>
    <jsp:include page="u_footer.jsp"></jsp:include>
</div>
</body>
</html>

