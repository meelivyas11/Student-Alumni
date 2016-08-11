<%--
    Document   : u_FrontPageFriendsList
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

    </head>

    <body>
        <%
        HttpSession s1 = request.getSession();
        PreparedStatement ps = null, ps2 = null;
        Connection con = null, con2 = null;
        ResultSet rs = null, rs2 = null;
        int temp = (Integer) s1.getAttribute("counter");
        int i = temp, j;
        String Friend_grno = "";
        boolean flag = true;
        String grno = (String) s1.getAttribute("grno");

        try {
            int times;
            con = DBUtils.getConnectionObj();
            ps = con.prepareStatement(DBUtils.GET_FRIENDS_FOR_GRNO,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, grno);
            ps.setString(2, grno);
            if (temp == 0) {
                rs = ps.executeQuery();
                rs.last();
                int totalrows = rs.getRow();
                s1.setAttribute("totalrows", totalrows);
                rs.beforeFirst();
                s1.setAttribute("current_row_no", 1);
                times = (Integer) s1.getAttribute("totalrows");
            } else {
                rs = ps.executeQuery();
                int row = (Integer) s1.getAttribute("current_row_no");
                rs.absolute(row);
                times = (Integer) s1.getAttribute("totalrows");
            }
            while (rs.next() && times >= 0) {
        %>
		        <table class="FriendsListTable">
		            <tr><td>Friends List</td></tr>
		            <%
		            for (j = 0; j < 3 && times>=0 && flag==true; j++) {
		                temp = (Integer) s1.getAttribute("counter");
		            %>
		            <tr>
		                <%
		                for (i = temp; i <= (temp + 2) && times >= 0; i++) {
		                    times = (Integer) s1.getAttribute("totalrows");
		                    times--;
		                    s1.setAttribute("totalrows", times);
		
		                    String grno1 = rs.getString("FROM_GRNO");
		                    String grno2 = rs.getString("TO_GRNO");
		
		                    if (grno1.equals(grno)) {
		                        Friend_grno = grno2;
		                    } else if (grno2.equals(grno)) {
		                        Friend_grno = grno1;
		                    }
		                    con2 = DBUtils.getConnectionObj();
		                    ps2 = con2.prepareStatement(DBUtils.GET_PROFILE_FROM_GRNO,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		                    ps2.setString(1, Friend_grno);
		                    rs2 = ps2.executeQuery();
		                    if (rs2.next()) {
		                        String FirstName = rs2.getString("FIRSTNAME");
		                        String LastName = rs2.getString("LASTNAME");
		                        String Photo = rs2.getString("PHOTO");
		                        String Company = rs2.getString("COMPANY");
				                %>
				                <pre><td align="center">
				                <center><img align="center" src="<%=Photo%>" width="100" height="100" alt="<%=Friend_grno%>"/></center>
				                <center><c:out value="<%=FirstName%>" />.<c:out value="<%=LastName%>" /></center>
				                <center><c:out value="<%=Company%>" /></center></td></pre>
				                <%
		                    }
		
		                    if (times > 0) {
		                        rs.next();
		                    } else {
		                        //out.print("bas have pati gayu!!");
		                        flag = false;
		                        break;
		                    }
		                }
		                // row ends
		                //column starts
		                if(times>=0)
		                 {
		                	s1.setAttribute("counter", i);
		                 }
		                else{
		                        //out.print("bas have pati gayu!!");
		                        break;
		                    }
		                %>
		            </tr>
		            <%
		            }
		            if (times > 0) {
		                rs.next();
		            } else {
		                //out.print("bas have pati gayu!!");
		                break;
		            }
		
		            if (times >= 0) {
		                int current_row_no = rs.getRow()-1;
		                s1.setAttribute("current_row_no", current_row_no);
		                s1.setAttribute("counter", i);
		            %>
		            <tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <a href="/Student-Alumni/User/u_ViewAllFriends.jsp"> View All >> </a></tr>
		        </table>
        		<%                
        			break;
        		  } else {
                    //out.print("all overr");
                }
                break;
            }
        } finally {
            try {
                if (!rs.isClosed()) rs.close();
                if (!ps.isClosed()) ps.close();
                if (!con.isClosed()) con.close();
            } catch (Exception e) {
                log(e.getMessage());
            }
        }
     %>
    </body>
</html>

