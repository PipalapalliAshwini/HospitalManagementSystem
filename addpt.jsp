<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>ADMIT NEW PATIENT</title>
   </head>
   <body background ="University_College_Hospital.jpg" bgproperties="fixed">
      <body bgcolor="lightblue">
         <form action="addpt.jsp" method=post>
            <%!String a="",b=""; Date d=null,e=null; String f="",g="",h="",i="";long j=0; String patGender=""; %>
            <center>
               <table border=3>
                  <tr>
                     <td ALIGN=CENTER>
                        <h1>ADMIT NEW PATIENT</h1>
                     </td>
                  </tr>
               </table>
               <br><br>
               <table border=5 width=1000>
               <tr>
                  <td>
                     <h3>ADD NEW PATIENT</h3>
                     <table BORDER=3 >
                        <tr>
                           <td WIDTH=50%>
                              <br><br><br>
                              <h4>PATIENT DETAILS</h4>
                              <input type="submit"  name="button1" value="SEARCH PATIENT" style="left:100px;top:215px;">
                              <br>
                              <%
                                 try
                                 {	a=request.getParameter("button1"); 
                                 	if(a.equals("SEARCH PATIENT"))
                                 	{
                                 	String str1= request.getParameter("patId");
                                 	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
                                  	Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vikram", "vikram");
                                  	PreparedStatement ps = null;
                                  	ResultSet r = null;
                                 	if(str1!="")
                                 	{	
                                 		String sql2="select * from T_AS_PATIENT where PATIENT_ID = ?";
                                 		ps = c.prepareStatement(sql2);
                                  		ps.setString(1, str1);
                                  		r = ps.executeQuery();
                                 		if(r.next())
                                 		{
                                 			j=r.getLong("PATIENT_ID");
                                 			b=r.getString("PATIENT_NAME");	
                                 			patGender=r.getString("GENDER");
                                 			d=r.getDate("DOB");
                                 			e=r.getDate("DOJ");
                                 			g=r.getString("BLOOD_GROUP");
                                 			h=r.getString("PATIENT_CATEGORY");
                                 		}
                                 		else
                                 		{	
                                 			%><script language="javascript">
                                 alert("PATIENT ID=<%=str1%>does not exist in database..!!!");
                              </script>
                              <%			
                                 }	
                                 
                                 }
                                 
                                 }
                                 }catch(Exception e) {}
                                 %>
                              <br>
                              PATIENT ID    <input type="text" name=patId maxlength=10 size=10 value=<%=j%>><BR>
                              PATIENT NAME  <input type="text" name="patName" maxlength=25 size=25 value=<%=b%>><BR>
                              GENDER        
                              <SELECT name="patGender" value=<%=patGender%>>
                                 <option>MALE
                                 <OPTION>FEMALE
                              </SELECT>
                              <BR><br>
                              DATE OF BIRTH <input type="text" name="dob" maxlength=15 size=20 value=<%=d%>><BR>
                              DATE OF JOINING    <input type="text" name="doj" maxlength=15 size=20 value=<%=e%>><BR>
                              BLOOD GROUP   <input type="text" name="bloodGrp" maxlength=10 size=20 value=<%=g%>><BR>
                              PATIENT CATEGORY   <input type="text" name="patCatg" maxlength=10 size=20 value=<%=h%>><BR>
                              <input type="submit"  name="button2" value="ADD PATIENT">
                              <br>
                              <br>
                              <br>
                           </td>
                           <%
                              try
                              {	a=request.getParameter("button2"); 
                              	if(a.equals("ADD PATIENT"))
                              	{
                              	//String str1= request.getParameter("patId");
                              	String str2= request.getParameter("patName");
                              	String str3= request.getParameter("patGender");
                              	String str4= request.getParameter("dob");
                              	String str5= request.getParameter("doj");
                              	String str6= request.getParameter("bloodGrp");
                              	String str7= request.getParameter("patCatg");
                              	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
                               	Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vikram", "vikram");
                               	PreparedStatement ps = null;
                               	ResultSet rs = null;
                               	if(str2!=""&&str3!=""&&str4!=""&&str5!=""&&str6!=""&&str7!="")
                              	{	
                              		String sql="insert into T_AS_PATIENT (PATIENT_ID,PATIENT_NAME,GENDER,DOB,DOJ,BLOOD_GROUP,PATIENT_CATEGORY) values(patient_sequence.nextval, ?, ?, ?, ?, ?, ?)";
                              		ps = c.prepareStatement(sql);
                                   	ps.setString(1, str2);
                                   	ps.setString(2, str3);
                                   	ps.setString(3, str4);
                                   	ps.setString(4, str5);
                                   	ps.setString(5, str6);
                                   	ps.setString(6, str7);
                              		ps.executeUpdate();
                              		%><script language="javascript">
                              alert("INSERT SUCESSFUL");
                           </script>
                           <%	
                              }
                              else
                              {
                              	%><script language="javascript">
                              alert("Insert failed in database..!!!");
                           </script>
                           <%	
                              }
                              }
                              }
                              catch(Exception e) {}
                              
                              %>
                     </table>
            </center>
         </form>
         <input type="button" name="bttn" value="HOME" onclick="location.href='home.jsp'">
   </body>
</html>