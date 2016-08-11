<%-- 
    Document   : register
    Created on : Mar 22, 2009, 8:01:24 AM
    Author     : Meeli Vyas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
     <link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
        <script type="text/JavaScript" >
/*
function ckuserid(userid)
{
   if(userid.value.match("[a-zA-Z]+"))
        {
         return true;
        }
    else
        {
          return false;
        }


}

function ckgrno(grno)
{
    if(grno.value.match("\\d{2}\\w{2}\\d{2}"))
             return true;
        else
         {
            return false;
          }

}

function ckpassword(conform)
{
     var password = document.getElementById("password");
     if (!conform.value=="" && conform.value == password.value )
          return true;

      else
            return false;


}
function check()
{
      var userid = document.getElementById("userid");
      var grno = document.getElementById("grno");
      var conform = document.getElementById("conform");
      var password = document.getElementById("password");


if(ckuserid(userid)==true)
     {

         if(ckgrno(grno)==true)
             {
              if(ckpassword(conform)==true)
                  {

                   alert("Thank U For Enter Correct Values")

                  }
               else
                  {
                      alert("Retype the password");
                      password.value="";
                      conform.value="";
                      password.focus();
                  }

             }
         else
             {
               grno.value="";
               alert("Enter Correct GR Number")
               grno.focus();
             }
     }
else
    {

          userid.value="";
          alert("Enter Correct User ID");
          userid.focus();
    }


   }*/
</script>

            </head>


    <body>
        <div id="header">
         <jsp:include page="Login_header.jsp"></jsp:include>
         <br>
        </div>

        <div id="middle">
            <table border="10" width="100%">
               <tr>
                   <td width="80%" height="85%" align="left">
                        <%
                         String msg = "User";

                         HttpSession s1 = request.getSession();
                         s1.setAttribute("Sender",msg);


                       %>

                      <form action="req_reg">
                        <table border="10" >
                          <td>
                            <pre>


    User ID         : <input type="text" name="userid" id="userid" value="" size="20" /> <br>

    Gr No.          : <input type="text" name="grno" id="grno" value="" size="20"/><br>

    Password        : <input type="password" name="password" id="password" value="" size="22" /><br>

    Retype Password : <input type="password" name="conform" id="conform" value="" size="22" /><br>
   <input type="hidden" name="status" value="PENDING" size="20"  readonly="readonly"  align="center"/>
   <input type="hidden" name="role" value="USER" size="20" readonly="readonly" align="center" />
    </pre>
    <center>
      <input type="submit" value="submit" name="submit" id="submit" />

    </center>  <br><br>
                          </td>
                          </table>
                           
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