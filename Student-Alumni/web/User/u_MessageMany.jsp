<%-- 
    Document   : u_MessageMany
    Created on : Apr 12, 2009, 1:44:33 AM
    Author     : Meeli Vyas
--%>

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
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="javax.servlet.RequestDispatcher" %>
<%@page import="java.util.StringTokenizer" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        PreparedStatement ps = null;
        Statement st = null, st2 = null;
        Connection con = null, con2 = null, con3 = null;
        ResultSet rs = null, rs2 = null;

        String Sgrno = "", Semail = "", Rgrno = "", Remail = "", Message = "";
        String temp_receivers = "";
        boolean flag = false;
        
        HttpSession s1 = request.getSession();
        String grno = (String) s1.getAttribute("grno");

		if(grno!=""){
	        try {
	            String str = request.getParameter("Send");
	            if (str != null && str.equals("Send")) {
	                temp_receivers = request.getParameter("Destination");
	                Message = request.getParameter("Message");
	                Sgrno = grno;
	
	                StringTokenizer data = new StringTokenizer(temp_receivers, ",");
	
	                con2 = DBUtils.getConnectionObj();
	                st2 = con2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	
	                String query1 = "Select EMAILADDRESS from PROFILE where GRNO='" + Sgrno + "'";
	                rs2 = st2.executeQuery(query1);
	                if (rs2.next()) {
	                    Semail = rs2.getString("EMAILADDRESS");
	                }
	
	                while (data.hasMoreTokens()) {
	                    Remail = data.nextToken();
	                    con = DBUtils.getConnectionObj();
	                    st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	
	                    String query = "Select GRNO from PROFILE where EMAILADDRESS='" + Remail + "'";
	                    rs = st.executeQuery(query);
	                    if (rs.next()) {
	                        Rgrno = rs.getString("GRNO");
	                    }
	
	                    con3 = DBUtils.getConnectionObj();
	
	                    ps = con3.prepareStatement("Insert into SCRAP (SEMAIL, SGRNO, REMAIL, RGRNO, MESSAGE) values(?,?,?,?,?)");
	                    ps.setString(1, Semail);
	                    ps.setString(2, Sgrno);
	                    ps.setString(3, Remail);
	                    ps.setString(4, Rgrno);
	                    ps.setString(5, Message);
	                    int rs3 = ps.executeUpdate();
	
	                    if (rs3 == 1) {
                             flag = true;
	                    } else {
	                        out.write("<center>  <h2> WE TRIED HARD TO SEND YOUR MESSAGE TO " + Remail);
	                        out.write("</h2></center>");
	                        out.write(" <center>  <h3>But Due To Incorect Id Its Not Possible </h3></center>");
	                        out.write("  <center><h1>PLEASE CHECK THE EMAIL ID!!</h1></center>");
	                    }
	
	                    try {
			                if(!rs.isClosed()) rs.close();
			                if(!rs2.isClosed()) rs2.close();
			
			                if (!st.isClosed()) st.close();
			                if (!st2.isClosed()) st2.close();
			                if (!ps.isClosed()) ps.close();
			
			                if (!con.isClosed()) con.close();
			                if (!con2.isClosed()) con2.close();
			                if (!con3.isClosed()) con3.close();
	    	            } catch (Exception e) {
	                		log(e.getMessage());
	          			  }
	                }
					if(flag==true)
					{
                       out.write("<center>  <h2> YOUR MESSAGE IS SUCCESSFULLY SEND TO ALL YOUR FRIENDS</h2></center>");
                       out.write(" <center>  <h3>Wait For The Reply </h3></center>");
                       out.write("  <center><h1>THANKS!!</h1></center>");
					}
	            }
	        } 
	        finally {
	             try {
	                if(!rs.isClosed()) rs.close();
	                if(!rs2.isClosed()) rs2.close();
	                if (!st.isClosed()) st.close();
	                if (!st2.isClosed()) st2.close();
	                if (!ps.isClosed()) ps.close();
	                if (!con.isClosed()) con.close();
	                if (!con2.isClosed()) con2.close();
	                if (!con3.isClosed()) con3.close();
	            } catch (Exception e) {
	                log(e.getMessage());
	            }
	            out.close();
        	}
		}
	else
	{
         out.write("<center>  <h2> WE TRIED HARD TO SEND YOUR MESSAGE</h2></center>");
         out.write(" <center>  <h3>But Due To Incorect Id Its Not Possible </h3></center>");
         out.write("  <center><h1>PLEASE CHECK THE EMAIL ID!!</h1></center>");
	}

        %>
    </body>
</html>
