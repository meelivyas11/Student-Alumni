<%-- 
    Document   : a_DelMember
    Created on : Mar 23, 2009, 1:04:04 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
     <link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
    </head>

    <body>
        <div id="header">
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


  <center>  <h2> You Are Requested To Click On The DataBase </h2></center>
                       <center>  <h3> From Where You Want To Delete The Record </h3></center>
                       <center><h1> THANKS !!</h1></center>

 &nbsp;<a  class="Common_options" href="/Student-Alumni/Admin/a_DelStudentsOfCollege.jsp" >Students Of College</a>&nbsp;&nbsp;
   <a href="/Student-Alumni/Admin/a_DelActiveStudent.jsp" class="Common_options"> Active Students </a>&nbsp;&nbsp;
   <a href="/Student-Alumni/Admin/a_DelStudentsProfile.jsp" class="Common_options" > Students Profile </a>

                   </td>
               </tr>

                </tbody>
            </table>


        </div>

        <div id="footer">
            <br>
          <jsp:include page="a_Lfooter.jsp"></jsp:include>
        </div>
    </body>
</html>
