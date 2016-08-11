<%--
    Document   : Search
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
                   <td width="80%" height="85%">

                      <form action="Search_result.jsp">
     <%
    String str = request.getParameter("Search");
     if (str != null && str.equals("Search"))
       {
     int temp = 0;
     s1.setAttribute("counter",temp);

     String ser = request.getParameter("ser");
   //  out.print(ser);
           if(ser.equals("grno_userid"))
            {
            %>
<pre>
             GrNo.           : <input type="text" name="sgrno"  size="20" /><br>
             Userid          : <input type="text" name="suserid" size="20" /><br>

                 <center><input type="submit" value="grno_userid" name="grno_userid" /></center>
</pre>
            <%
            }



 ///////////////////////////////////////////////////////////////////////////////////
       if(ser.equals("name_email"))
            {

           %>
<pre>
            First Name      : <input type="text" name="sfname"  size="20" /><br>
            Last  Name      : <input type="text" name="slname"  size="20" /><br>
            Email Address   : <input type="text" name="semail"  size="20" /><br>

             <center><input type="submit" value="name_email" name="name_email" /></center>

</pre>
           <%
            }


////////////////////////////////////////////////////////////////////////////////////
        if(ser.equals("yop_branch_degree"))
            {

            %>
<pre>
            Year Of Passing : <input type="text" name="sYOP"  size="20" /><br>
            Branch          : <input type="text" name="sbranch"  size="20" /><br>
            Degree          : <input type="text" name="sdegree"  size="20" /><br>

                 <center><input type="submit" value="yop_branch_degree" name="yop_branch_degree" /></center>
</pre>

            <%
            }


////////////////////////////////////////////////////////////////////////////////////
        if(ser.equals("current"))
            {
            %>

<pre>

            Skill           : <input type="text" name="sskill"  size="20" /><br>
            Company         : <input type="text" name="scompany"  size="20" /><br>

                 <center><input type="submit" value="current" name="current" /></center>
</pre>


       <%

          }

    }
          %>

</form>
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















