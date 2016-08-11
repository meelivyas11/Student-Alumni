<%--
    Document   : Scrap_reply
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
<%@page import="java.util.*" %>

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
        String Rgrno = (String) s1.getAttribute("grno");
        String Sgrno = request.getParameter("Sgrno");
        out.print(Sgrno);
        //s1.setAttribute("Sgrno", Sgrno);
        //grno="1";
if(Sgrno!=null)
{

%>
<div id="middle">

<table border="10" width="100%">
    <tr>
        <td width="20%" height="85%">
            <jsp:include page="/Common_options.jsp"></jsp:include>
        </td>
        <td width="80%" height="85%" valign="top" align="left">

          <form action="/Student-Alumni/User/Execute_scrap_reply.jsp">
                <pre>

             <input type="hidden" name="Sgrno" value="<%= Sgrno%>">
            Message : (Only 150 Charactmessageers)
            <textarea name="Message" wrap="virtual" cols="30" rows="5" ></textarea>

            <center><input type="submit" value="Send" name="Send" /></center>
                </pre>
            </form>

   <%

}

        %>


        </td>
    </tr>

    
</table>


</div>




<div id="footer">
    <br>
    <jsp:include page="/Lfooter.jsp"></jsp:include>
</div>
</body>
</html>

