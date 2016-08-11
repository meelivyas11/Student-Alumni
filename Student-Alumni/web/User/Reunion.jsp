<%--
    Document   : admin_home
    Created on : Mar 22, 2009, 7:53:16 AM
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

        <div id="middle">
            <table border="10" width="100%">
               <tr>
                   <td width="20%" height="85%">
                    <jsp:include page="/Common_options.jsp"></jsp:include>
                   </td>
                   <td width="80%" height="85%">


<%              InitialContext i1 = new InitialContext();
                Context ct =(Context) i1.lookup("java:comp/env"); // this is the value of the resource reference
                DataSource ds = (DataSource) ct.lookup("resource_ref2"); // of javax.sql
 %>

                <sql:setDataSource  var="db" dataSource="<%=ds%>" />
                <sql:query  var="query1" dataSource="${db}"   sql="select * from REUNION" >
                </sql:query>
<br><br>

           <table width=70% border=3 align="left">
           <thead>
           <td><b><i><u>DATE</u></i></b></td>
           <td><b><i><u>VENUE AND TIME</u></i></b></td>
           <td><b><i><u>YEAR AND BRANCH</u></i></b></td>
           </thead>

             <c:forEach   var="row"  items="${query1.rows}" >
               <tr>
                   <td width="15%"><c:out value="${row.DATE}" /></td>
                   <td height="" width="10%"><textarea  readonly cols="30" rows="5">${row.VENUE}</textarea></td>
                   <td width="20%" ><c:out value="${row.YEARBRANCH}" /></td>

               </tr>
             </c:forEach>
 <br>
 </table>

             </td>
               </tr>

                </tbody>
            </table>


        </div>




        <div id="footer">
            <br>
           <jsp:include page="/Lfooter.jsp"></jsp:include>
        </div>
    </body>
</html>