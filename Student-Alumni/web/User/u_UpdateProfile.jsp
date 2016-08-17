<%-- 
    Document   : u_UpdateProfile
    Created on : Mar 25, 2009, 12:08:42 PM
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
<%@page import="com.studentAlumni.Domain.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student</title>
    <link rel="stylesheet" type="text/css" href="/Student-Alumni/CSS/common.css" />
</head>

<body>
<div>
    <jsp:include page="u_header.jsp"></jsp:include>
</div>

<div id="middle">
<table border="10" width="100%">
    <tr>
        <td valign="top" width="15%" height="85%">
            <jsp:include page="user_options.jsp"></jsp:include>
        </td>
        <td width="85%" height="85%">
		<%
        String str = request.getParameter("Update");
        profile u1 = null;
        HttpSession s1 = request.getSession();
        String grno= (String) s1.getAttribute("grno");

        %>
        <jsp:useBean id="u2" class="com.studentAlumni.Domain.Profile"  scope="request">
            <jsp:setProperty name="u2" property="*"/>
        </jsp:useBean>
        <%
        if (str != null && str.equals("Update")) {
            boolean status = UserProfile.updateProfile(u2);
            u1 = u2;
            if (status == true) {
                out.print("Successfully Updated");
            } else {
                out.print("Fail to update!");
            }
        } else {
            u1 = UserProfile.retriveProfile(grno);
        }
            %>
       <form action="/Student-Alumni/User/u_UpdateProfile.jsp">  
       		<center class="AllTitles"><h2>My Profile</h2></center>
       		<table class="Updatetable" cellpadding="3px" align="center">
       			<tr> 
       				<td>Select A Photo:</td>
       				<td>
       					<input type="radio" name="photo" value="/Student-Alumni/images/Garden.jpg" checked="checked" /> <img src="/Student-Alumni/images/Garden.jpg" width="75" height="76" alt="Garden"/>
			            <input type="radio" name="photo" value="/Student-Alumni/images/Autumn Leaves.jpg" /> <img src="/Student-Alumni/images/Autumn Leaves.jpg" width="75" height="76" alt="Autumn Leaves"/>
			            <input type="radio" name="photo" value="/Student-Alumni/images/Forest.jpg" /> <img src="/Student-Alumni/images/Forest.jpg" width="75" height="76" alt="Forest"/>
			            <input type="radio" name="photo" value="/Student-Alumni/images/Creek.jpg" /> <img src="/Student-Alumni/images/Creek.jpg" width="75" height="76" alt="Creek"/>
			            <input type="radio" name="photo" value="/Student-Alumni/images/Waterfall.jpg" /> <img src="/Student-Alumni/images/Waterfall.jpg" width="75" height="76" alt="Waterfall"/>
			            <input type="radio" name="photo" value="/Student-Alumni/images/Humpback Whale.jpg" /> <img src="/Student-Alumni/images/Humpback Whale.jpg" width="75" height="76" alt="Humpback Whale"/>
       				 </td>
       			</tr>
       			
       			<tr>
       				<td>GrNo.</td>
       				<td><input type="text" name="grno" value="<%=u1.getGrno()%>" size="6" /></td>
       			</tr>
       			
       			<tr>
       				<td>User Id</td>
       				<td><input type="text" name="userid" value="<%=u1.getUserid()%>" size="20" /></td>
       			</tr>
       			
       			<tr>
       				<td>About Family</td>
       				<td><textarea name="aboutfamily" wrap="virtual" cols="22" rows="4" ><%=u1.getAboutfamily()%></textarea></td>
       			</tr>
       			
       			<tr>
       				<td>Maritual Status</td>
       				<td> <select name="MS">
				             <%
				     	  String Maritualstatus[]={"-------","Married","Unmarried"};
				          for (int i=0;i<3;i++) {
				              out.write("<option value=\""+Maritualstatus[i]+"\" ");
				              if(Maritualstatus[i].equals(u1.getMS())) {
				                  out.write("selected");
				              }
				              out.write(" >"+Maritualstatus[i]+"</option>");
				          }
				          %>
            			 </select>
           			</td>
       			</tr>

       			<tr>
       				<td>Email-Address</td>
       				<td><input type="text" name="emailaddress" size="20" value="<%=u1.getEmailaddress()%>" ></td>
       			</tr>
       			<tr>
       				<td>Mobile Number</td>
       				<td><input type="text" name="mobile" size="20"value="<%=u1.getMobile()%>"  ></td>
       			</tr>
       			<tr>
       				<td>Phone(O)</td>
       				<td><input type="text" name="office" size="20" value="<%=u1.getOffice()%>" >
       			</tr>
       			<tr>
       				<td>Phone(R)</td>
       				<td><input type="text" name="home" size="20"value="<%=u1.getHome()%>" ></td>
       			</tr>
       			<tr>
       				<td>Fax</td>
       				<td><input type="text" name="fax" size="20" value="<%=u1.getFax()%>" ></td>
       			</tr>
       			<tr>
       				<td>Current Address</td>
       				<td><textarea name="currentaddress" cols="22" rows="4" wrap="virtual"  > <%=u1.getCurrentaddress()%></textarea></td>
       			</tr>
       			<tr>
       				<td>Permanent Address</td>
       				<td><textarea name="permanentaddress" cols="22" rows="4" wrap="virtual" value="" ><%=u1.getPermanentaddress()%> </textarea></td>
       			</tr>
       			<tr>
       				<td>Degree</td>
       				<td> <select name="degree">
							<%
								String degree[] = { "select", "B.E./B.Tech", "M.E./M.Tech", "MCA", "M.Sc", "Ph.D" };
								for (int i = 0; i < 6; i++) {
									out.write("<option value=\"" + degree[i] + "\" ");
									if (degree[i].equals(u1.getDegree())) {
										out.write("selected");
									}
									out.write(" >" + degree[i] + "</option>");
								}
							%>
						</select>
					</td>
       			</tr>

				<tr>
       				<td>Organization</td>
       				<td><input type="text" name="organization"   value="<%=u1.getOrganization()%>" size="30"></td>
       			</tr>

				<tr>
       				<td>Job Detail</td>
       				<td><textarea name="jobdetail" cols="22" rows="2" wrap="virtual" ><%=u1.getJobdetail()%> </textarea></td>
       			</tr>
       			
				<tr>
       				<td>Specification</td>
       				<td><textarea name="specifications" cols="22" rows="2" wrap="virtual"  ><%=u1.getSpecifications()%> </textarea></td>
       			</tr>
       			
				<tr>
       				<td>Current Project Details</td>
       				<td><textarea name="currentproject" cols="22" rows="2" wrap="virtual" ><%=u1.getCurrentproject()%></textarea></td>
       			</tr>
       			
				<tr>
       				<td>Skill</td>
       				<td><textarea name="skill" cols="22" rows="2" wrap="virtual" ><%=u1.getSkill()%> </textarea></td>
       			</tr>

				<tr>
       				<td>Company</td>
       				<td><input type="text" name="company"  size="20" value="<%=u1.getCompany()%>" /></td>
       			</tr>
       			
       			<tr>
       				<td>Salary</td>
       				<td><input type="text" name="salary"  size="20"value="<%=u1.getSalary()%>"  /></td>
       			</tr>
       		</table>
       		<center><input type="submit" value="Update" name="Update"/></center>
        </form>
      </td>
    </tr>
</table>
</div>

<div>
    <jsp:include page="u_footer.jsp"></jsp:include>
</div>
</body>
</html>

