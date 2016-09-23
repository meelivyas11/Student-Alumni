<%--
    Document   : a_ViewReunionEntry
    Created on : Mar 22, 2009, 7:53:16 AM
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
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
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
                			DataSource ds = DBUtils.getOracleDataSource();
							String query = DBUtils.GET_ALL_REUNION;
 						%>

		               <sql:setDataSource  var="db" dataSource="<%=ds%>" />
		               <sql:query  var="query1" dataSource="${db}"   sql="<%=query%>" >
		               </sql:query>
						
					   <br><br>
		
			           <table width=70% border=3 align="center">
				           <thead>
				           	<tr>
					           <th>DATE</th>
					           <th>VENUE AND TIME</th>
					           <th>YEAR AND BRANCH</th>
				          	</tr>
				          </thead>
			
			             <c:forEach   var="row"  items="${query1.rows}" >
			               <tr>
			                   <td width="15%"><c:out value="${row.RDATE}" /></td>
			                   <td height="" width="10%"><textarea  readonly cols="30" rows="5">${row.VENUE}</textarea></td>
			                   <td width="20%" ><c:out value="${row.YEARBRANCH}" /></td>
			               </tr>
			             </c:forEach>
					  </table>
	             </td>
               </tr>
            </table>
        </div>
        <div>
            <br>
          <jsp:include page="a_Lfooter.jsp"></jsp:include>
        </div>
    </body>
</html>