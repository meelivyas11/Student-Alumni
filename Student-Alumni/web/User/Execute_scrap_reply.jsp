<%--
    Document   : Execute_scrap_reply
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
if(Sgrno!=null){
        PreparedStatement ps = null;
        Statement st = null, st2 = null;
        Connection con = null, con2 = null, con3 = null;
        ResultSet rs = null, rs2 = null;

        String  Semail = "", Remail = "", Message = "";

        try {
            String str = request.getParameter("Send");
            if (str != null && str.equals("Send")) {

                Message = request.getParameter("Message");

                String temp="0" ;

                temp = Sgrno;
                Sgrno=Rgrno;
                Rgrno=temp;


                InitialContext i1 = new InitialContext();
                Context ct = (Context) i1.lookup("java:comp/env"); // this is the value of the resource reference
                DataSource ds = (DataSource) ct.lookup("resource_ref4"); // of javax.sql
                con = ds.getConnection();
                st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                String query = "Select EMAILADDRESS from PROFILE where GRNO='" + Rgrno + "'";
                rs = st.executeQuery(query);
                if (rs.next()) {
                    Remail = rs.getString("EMAILADDRESS");
                }


                InitialContext i2 = new InitialContext();
                Context ct2 = (Context) i2.lookup("java:comp/env"); // this is the value of the resource reference
                DataSource ds2 = (DataSource) ct2.lookup("resource_ref3"); // of javax.sql
                con2 = ds2.getConnection();
                st2 = con2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                String query1 = "Select EMAILADDRESS from PROFILE where GRNO='" + Sgrno + "'";
                rs2 = st2.executeQuery(query1);
                if (rs2.next()) {
                    Semail = rs2.getString("EMAILADDRESS");
                }



                InitialContext i3 = new InitialContext();
                Context ct3 = (Context) i3.lookup("java:comp/env"); // this is the value of the resource reference
                DataSource ds3 = (DataSource) ct3.lookup("resource_ref1"); // of javax.sql


                con3 = ds3.getConnection();

                ps = con3.prepareStatement("Insert into SCRAP values(?,?,?,?,?)");

                ps.setString(1, Semail);
                ps.setString(2, Sgrno);
                ps.setString(3, Remail);
                ps.setString(4, Rgrno);
                ps.setString(5, Message);

                int rs3 = ps.executeUpdate();

                if (rs3 == 1) {

                    out.write("<center>  <h2> YOUR MESSAGE IS SUCCESSFULLY SEND</h2></center>");
                    out.write(" <center>  <h3>Wait For The Reply </h3></center>");
                    out.write("  <center><h1>THANKS!!</h1></center>");
                    %>

                    <a href="/Student-Alumni/User/ViewScrap.jsp">Back</a>

                    <%

                } else {
                    out.write("<center>  <h2> WE TRIED HARD TO SEND YOUR MESSAGE</h2></center>");
                    out.write(" <center>  <h3>But Due To Incorect Id Its Not Possible </h3></center>");
                    out.write("  <center><h1>PLEASE CHECK THE EMAIL ID!!</h1></center>");


                }




            }


        } finally {

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




           // out.close();
        }
}

else
  {
       out.write("<center>  <h2> DUE TO SOME TECHNICAL PROBLEM WE CAN'T SEND THE MESSAGE</h2></center>");
       out.write(" <center>  <h3>Please Go To Home</h3></center>");
       %>

<a href="/User/user_home.jsp">Home</a>

<%
}
   %>



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

