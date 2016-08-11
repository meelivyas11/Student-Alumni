<%-- 
    Document   : Scrap_del
    Created on : Apr 12, 2009, 2:45:59 PM
    Author     : Meeli Vyas
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
       <%
       HttpSession s1 = request.getSession();
       String Rgrno = (String) s1.getAttribute("grno");
       String Sgrno = request.getParameter("Sgrno");
      
       //out.print(Sgrno);
      // out.print(Rgrno);
       Connection con = null;
       Statement st=null;
       ResultSet rs= null;

  try{
            InitialContext i1 = new InitialContext();
         Context ct =(Context) i1.lookup("java:comp/env"); // this is the value of the resource reference
         DataSource ds = (DataSource) ct.lookup("resource_ref1"); // of javax.sql
         con = ds.getConnection();
         st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
         String qry = " Select *  from SCRAP where SGRNO = '"+ Sgrno +"' and RGRNO ='"+Rgrno+"'";
         rs = st.executeQuery(qry);
          if(rs.next())
          {
               rs.deleteRow();
              out.write("<center>  <h2> THE MESSAGE IS SUCCESSFULLY DELETED</h2></center>");
              out.write(" <center>  <h3>Click On Link To Go Back </h3></center>");
            %>
            <a href="/Student-Alumni/User/ViewScrap.jsp" onclick="submit()">Home</a>
            <%
               //out.print("Success");
              }

         }
  finally{

 try {
                      if (!rs.isClosed()) rs.close();
                      if (!st.isClosed()) st.close();
                      if (!con.isClosed()) con.close();
                         }
                    catch (Exception e) { log(e.getMessage()); }
                   //out.close();
                        }
 
       %>
     
    </body>
</html>
