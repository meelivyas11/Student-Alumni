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
<link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/default.css" />
<script type="text/JavaScript">
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
	<div id="header" class="header">
		<div id="logo">
			<h1>SankalChand Patel College Of Engg.</h1>
		</div>
		<div id="Student-Alumni" style="margin-right: auto">
			<h2>Student-Alumni</h2>
		</div>
	</div>

	<div id="middle">
		<%
			String msg = "User";
			HttpSession s1 = request.getSession();
			s1.setAttribute("Sender", msg);
		%>

		<form action="Registration">
			<table align="center" style="vertical-align: middle; margin-left: 1em" border="0">
				<input type="hidden" name="status" value="PENDING" size="20" readonly="readonly" align="center" />
			    <input type="hidden" name="role" value="USER" size="20" readonly="readonly" align="center" />
				<tr><td>User ID : <input type="text" name="userid" id="userid" value="" size="20" /></td></tr>
				<tr><td><br></td></tr>
				<tr><td>Gr No. : <input type="text" name="grno" id="grno" value="" size="20" /><br></td></tr>
				<tr><td><br></td></tr>
				<tr><td>Password : <input type="password" name="password" id="password" value="" size="22" /></td></tr>
				<tr><td><br></td></tr>
				<tr><td>Retype Password : <input type="password" name="conform" id="conform" value="" size="22" /></td></tr>
				<tr><td><br></td></tr>
				<tr><td align="center"><input type="submit" value="submit" name="submit" id="submit" /></td></tr>
			</table>
		</form>
	</div>

	<div id="footer"></div>
</body>
</html>