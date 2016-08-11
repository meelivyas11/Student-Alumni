
<%--
    Document   : Search_result
    Created on : Mar 22, 2009, 7:34:00 AM
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
    <title>Student</title>

</head>

<body>
<div id="header">
    <jsp:include page="/Lheader.jsp"></jsp:include>
    <br>
</div>



<%

//HttpSession s1 = request.getSession();
        //String grno= (String) s1.getAttribute("grno");
//grno ="06IT44

%>
<div id="middle">
<table border="10" width="100%">
    <tr>
        <td width="20%" height="85%" valign="top">
            <jsp:include page="/Common_options.jsp"></jsp:include>
        </td>
        <td width="80%" height="85%">

            <form action="">
                <%
        Statement st = null;
        Connection con = null;
        ResultSet rs = null;
        int i;

        try {

            HttpSession s1 = request.getSession();
            int temp = (Integer) s1.getAttribute("counter");
            String query;
            int times;

            //int times;
            if (temp == 0) {

                //rs.absolute(1);
                query = "";

                String str = request.getParameter("grno_userid");
                if (str != null && str.equals("grno_userid")) {
                    String sgrno = request.getParameter("sgrno");
                    String suserid = request.getParameter("suserid");

                    if (sgrno != "") {
                        sgrno.trim();
                    }
                    if (suserid != "") {
                        suserid.trim();
                    }

                    if (sgrno == "" && suserid == "") {
                        out.print("Enter the values");
                    }
                    if (sgrno == "" && suserid != "") {
                        query = "Select * from PROFILE where GRNO like'%'and USERID like'" + suserid + "'";
                    }

                    if (sgrno != "" && suserid == "") {
                        query = "Select * from profile where GRNO like'" + sgrno + "'and USERID like '%'";
                    }
                    if (sgrno != "" && suserid != "") {
                        query = "Select * from profile where GRNO like '" + sgrno + "'and USERID like '" + suserid + "'";
                    }
                }

                %>


                <%
                        String str1 = request.getParameter("name_email");
                        if (str1 != null && str1.equals("name_email")) {
                            String sfname = request.getParameter("sfname");
                            String slname = request.getParameter("slname");
                            String semail = request.getParameter("semail");

                            if (sfname != "") {
                                sfname.trim();
                            }
                            if (slname != "") {
                                slname.trim();
                            }
                            if (semail != "") {
                                semail.trim();
                            }


                            if (sfname == "" && slname == "" && semail == "") {
                                out.print("Enter the values");
                            }
                            if (sfname == "" && slname == "" && semail != "") {
                                query = "Select * from profile where FIRSTNAME like'%' and LASTNAME like '%' and EMAILADDRESS like '" + semail + "'";
                            }
                            if (sfname == "" && slname != "" && semail == "") {
                                query = "Select * from profile where FIRSTNAME like'%' and LASTNAME like '" + slname + "' and EMAILADDRESS like '%'";
                            }
                            if (sfname == "" && slname != "" && semail != "") {
                                query = "Select * from profile where FIRSTNAME like'%' and LASTNAME like '" + slname + "' and EMAILADDRESS like '" + semail + "'";
                            }


                            if (sfname != "" && slname == "" && semail == "") {
                                query = "Select * from profile where FIRSTNAME like '" + sfname + "' and LASTNAME like '%' and EMAILADDRESS like '%'";
                            }
                            if (sfname != "" && slname == "" && semail != "") {
                                query = "Select * from profile where FIRSTNAME like'" + sfname + "' and LASTNAME like '%' and EMAILADDRESS like '" + semail + "'";
                            }
                            if (sfname != "" && slname != "" && semail == "") {
                                query = "Select * from profile where FIRSTNAME like'" + sfname + "' and LASTNAME like '" + slname + "' and EMAILADDRESS like '%'";
                            }
                            if (sfname != "" && slname != "" && semail != "") {
                                query = "Select * from profile where FIRSTNAME like'" + sfname + "' and LASTNAME like '" + slname + "' and EMAILADDRESS like '" + semail + "'";
                            }

                        }

                %>



                <%
                        String str2 = request.getParameter("yop_branch_degree");
                        if (str2 != null && str2.equals("yop_branch_degree")) {

                            String sYOP = request.getParameter("sYOP");
                            String sbranch = request.getParameter("sbranch");
                            String sdegree = request.getParameter("sdegree");

                            if (sYOP != "") {
                                sYOP.trim();
                            }
                            if (sbranch != "") {
                                sbranch.trim();
                            }
                            if (sdegree != "") {
                                sdegree.trim();
                            }


                            if (sYOP == "" && sbranch == "" && sdegree == "") {
                                out.print("Enter the values");
                            }
                            if (sYOP == "" && sbranch == "" && sdegree != "") {
                                query = "Select * from profile where YEAROFPASSING like'%' and BRANCH like '%' and DEGREE like '" + sdegree + "'";
                            }
                            if (sYOP == "" && sbranch != "" && sdegree == "") {
                                query = "Select * from profile where YEAROFPASSING like'%' and BRANCH like '" + sbranch + "' and DEGREE like '%'";
                            }
                            if (sYOP == "" && sbranch != "" && sdegree != "") {
                                query = "Select * from profile where YEAROFPASSING like'%' and BRANCH like '" + sbranch + "' and DEGREE like '" + sdegree + "'";
                            }


                            if (sYOP != "" && sbranch == "" && sdegree == "") {
                                query = "Select * from profile where YEAROFPASSING like '" + sYOP + "' and BRANCH like '%' and DEGREE like '%'";
                            }
                            if (sYOP != "" && sbranch == "" && sdegree != "") {
                                query = "Select * from profile where YEAROFPASSING like '" + sYOP + "' and BRANCH like '%' and DEGREE like '" + sdegree + "'";
                            }
                            if (sYOP != "" && sbranch != "" && sdegree == "") {
                                query = "Select * from profile where YEAROFPASSING like '" + sYOP + "' and BRANCH like '" + sbranch + "' and DEGREE like '%'";
                            }
                            if (sYOP != "" && sbranch != "" && sdegree != "") {
                                query = "Select * from profile where YEAROFPASSING like '" + sYOP + "' and BRANCH like '" + sbranch + "' and DEGREE like '" + sdegree + "'";
                            }


                        }

                %>



                <%
                        String str3 = request.getParameter("current");
                        if (str3 != null && str3.equals("current")) {
                            String sskill = request.getParameter("sskill");
                            String scompany = request.getParameter("scompany");

                            if (sskill != "") {
                                sskill.trim();
                            }
                            if (scompany != "") {
                                scompany.trim();
                            }

                            if (sskill == "" && scompany == "") {
                                out.print("Enter the values");
                            }
                            if (sskill == "" && scompany != "") {
                                query = "Select * from profile where SKILL like'%'and COMPANY like'" + scompany + "'";
                            }

                            if (sskill != "" && scompany == "") {
                                query = "Select * from profile where SKILL like '" + sskill + "'and COMPANY like '%'";
                            }
                            if (sskill != "" && scompany != "") {
                                query = "Select * from profile where SKILL like '" + sskill + "'and COMPANY like'" + scompany + "'";
                            }


                        }

                        InitialContext i1 = new InitialContext();
                        Context ct = (Context) i1.lookup("java:comp/env"); // this is the value of the resource reference
                        DataSource ds = (DataSource) ct.lookup("resource_ref2"); // of javax.sql
                        con = ds.getConnection();
                        st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        rs = st.executeQuery(query);

                        s1.setAttribute("query", query);

                        rs.last();
                        int total_no_of_rows = rs.getRow();
                        s1.setAttribute("total_no_of_rows", total_no_of_rows);
                        rs.absolute(0);

                        times = (Integer) s1.getAttribute("total_no_of_rows");


                    } else {

                        InitialContext i1 = new InitialContext();
                        Context ct = (Context) i1.lookup("java:comp/env"); // this is the value of the resource reference
                        DataSource ds = (DataSource) ct.lookup("resource_ref2"); // of javax.sql
                        con = ds.getConnection();
                        st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                        query = (String) s1.getAttribute("query");

                        rs = st.executeQuery(query);
                        int row = (Integer) s1.getAttribute("current_row_no");

                        rs.absolute(row);

                        times = (Integer) s1.getAttribute("total_no_of_rows");
                    }

                    //totalrow = rs.getRow();
                    while (rs.next() && times >= 0) {


                        for (i = temp; i <= (temp + 1) && times>=0; i++) {

                             times = (Integer) s1.getAttribute("total_no_of_rows");
                             times--;
                             s1.setAttribute("total_no_of_rows", times);

                            String grno = rs.getString("GRNO");
                            String Userid = rs.getString("USERID");

                            String FristName = rs.getString("FIRSTNAME");
                            String LastName = rs.getString("LASTNAME");
                            String Email = rs.getString("EMAILADDRESS");

                            String YOP = rs.getString("YEAROFPASSING");
                            String Branch = rs.getString("BRANCH");
                            String Degree = rs.getString("DEGREE");

                            String Skill = rs.getString("SKILL");
                            String Company = rs.getString("COMPANY");



                %>

                <table width=25% border=3 align="LEFT" class="table">
                    <td>
                        <pre>

Grno            : <c:out value="<%=grno%>" /><br>
Userid          : <c:out value="<%=Userid%>" /><br>
First Name      : <c:out value="<%=FristName%>" /><br>
Last Name       : <c:out value="<%=LastName%>" /><br>
Email Address   : <c:out value="<%=Email%>" /><br>
Year Of Passing : <c:out value="<%=YOP%>" /><br>
Branch          : <c:out value="<%=Branch%>" /><br>
Degree          : <c:out value="<%=Degree%>" /><br>
Skill           : <c:out value="<%=Skill%>" /><br>
Company         : <c:out value="<%=Company%>" /><br></pre>
                </td></table>



                <%
                    if (times > 0) {
                        rs.next();
                    } else {

                        out.print("bas have pati gayu!!");
                        break;
                    }

              
                }

                if (times >= 0) {
                    int current_row_no = rs.getRow()- 1;
                    // current_row_no++;
                    s1.setAttribute("current_row_no", current_row_no);
                    s1.setAttribute("counter", i);

                %>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="/Student-Alumni/User/Search_result.jsp"> View More </a>
                <%
                            break;
                        } else
                            out.print("all overr");
                            break;

                           
                    }


                %>





                <%
        } finally {
            try {
                if (!rs.isClosed()) {
                    rs.close();
                }

                if (!st.isClosed()) {
                    st.close();
                }

                if (!con.isClosed()) {
                    con.close();
                }

            } catch (Exception e) {
                log(e.getMessage());
            }
        //out.close();
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

