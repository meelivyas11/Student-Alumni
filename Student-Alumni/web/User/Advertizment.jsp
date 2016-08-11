
<%--
    Document   : Advertizment
    Created on : Mar 22, 2009, 7:34:00 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.sql.DataSource" %>
<%@page import="java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
     <link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
    </head>

    <body>
        <div id="header">
         <jsp:include page="/Lheader.jsp"></jsp:include>
         <br>
        </div>



<%

 HttpSession s1 = request.getSession();
 String grno= (String) s1.getAttribute("grno");
//grno ="06IT44";
        %>
        <div id="middle">
            <table border="10" width="100%">
               <tr>
                   <td width="20%" height="85%">
                      <jsp:include page="/Common_options.jsp"></jsp:include>
                   </td>
                   <td width="80%" height="85%" valign="top" align="right">

<%
 int temp = 0;
 s1.setAttribute("counter",temp);
//grno ="06IT44";
        %>


 <jsp:include page="/User/u_FrontPageFriendsList.jsp"></jsp:include>



                   </td>
               </tr>

                </tbody>
            </table>


        </div>




        <div id="footer" class="footer" >
            <br>
          <jsp:include page="/Lfooter.jsp"></jsp:include>
        </div>
    </body>
</html>

