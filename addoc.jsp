<%@  page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>DOCTORS INFORMATION WINDOW</title>
   </head>
   <body background="Hospital main entrance-blue sky.jpg" bgproperties="fixed">
      <center>
         <table border=3 width=500>
            <tr>
               <td>
                  <h1>DOCTOR PROFILE WINDOW</h1>
               </td>
            </tr>
         </table>
         <br><br><br>
         <table border=5 width=800>
            <tr>
               <td>
                  <form action="addoc.jsp" method="post">
                     <%!String a="",b="",d="",e="",f="",g="",h="",i="",j="";
                        long doc_id, doc_phone, dept_id; %>
                     <table BORDER=3 >
                        <br><br><br>
                        <tr>
                           <td>DOCTOR ID  <input type="text" name="t1" maxlength="10" size="20"><BR></td>
                           <td>
                              <h4>DOCTOR DETAILS</h4>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <input type="submit"  name="Button1" value="ADD DOCTOR PROFILE"><br><br>
                              <input type="submit"  name="Button1" value="SEARCH DOCTOR PROFILE"><br><br>
                              <input type="submit"  name="Button1" value="DELETE DOCTOR PROFILE"><br><br>
                              <!-- <input type="submit"  name="Button1" value="EDIT DOCTOR PROFILE"><br><br> -->
                              <%
                                 try
                                 {	a=request.getParameter("Button1"); 
                                 	if(a.equals("SEARCH DOCTOR PROFILE"))
                                 	{
                                 	String str1= request.getParameter("t1");
                                 	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
                                 	Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vikram", "vikram");
                                 	PreparedStatement ps = null;
                                 	ResultSet r = null;
                                 	
                                 	if(str1!="")
                                 	{	
                                 		String sql2="select * from T_AS_DOCTOR where DOCTOR_ID = ? ";
                                 		ps = c.prepareStatement(sql2);
                                 		ps.setString(1, str1);
                                 		r = ps.executeQuery();
                                 		
                                 		int rowcount = r.getRow(); 
                                 		while(r.next())
                                 		{
                                 			doc_id=r.getLong("doctor_id");
                                 			b=r.getString("doctor_name");	
                                 			d=r.getString("doc_city");
                                 			doc_phone=r.getLong("doc_phone");
                                 			f=r.getString("doc_specialization");
                                 			dept_id=r.getLong("DEPARTMENT_ID");
                                 		}
                                 }
                                 }
                                 }
                                 	catch(Exception e) {
                                 		e.printStackTrace();
                                 	}
                                 %>
                           </td>
                           <td>
                              <br>
                              <br>
                              DOCTOR NAME<input type="text" name="docName" maxlength=25 size=25 value=<%=b%>><BR>
                              DOCTOR CITY<input type="text" name="docCity" maxlength=20 size=20 value=<%=d%>><BR>
                              DOCTOR PHONE<input type="text" name="docPhone" maxlength=10 size=10 value=<%=doc_phone%>><BR>
                              DOC SPECIALIZATION<input type="text" name="docSpec" maxlength=20 size=20 value=<%=f%>><BR>
                              DEPARTMENT ID<input type="text" name="docDept" maxlength=10 size=10 value=<%=dept_id%>><BR>
                           </td>
                        </tr>
                        <%
                           try{
                           	a=request.getParameter("Button1");
                           	String str1= request.getParameter("docName");
                           	String str2= request.getParameter("docCity");
                           	String str3= request.getParameter("docPhone");
                           	String str4= request.getParameter("docSpec");
                           	String str5= request.getParameter("docDept");
                           	
                           	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
                           Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vikram", "vikram");
                           PreparedStatement ps = null;
                           ResultSet r = null;
                           	if(a.equals("ADD DOCTOR PROFILE"))
                           	{	
                           
                           	if(str1!=""&&str2!=""&&str3!=""&&str4!=""&&str5!="")
                           	{	
                           		String sql="insert into T_AS_DOCTOR (DOCTOR_ID, DOCTOR_NAME, DOC_CITY, DOC_PHONE, DOC_SPECIALIZATION, DEPARTMENT_ID) values(doc_sequence.nextval, ?, ?, ?, ?, ?)";
                           		ps = c.prepareStatement(sql);
                           		ps.setString(1, str1);
                           		ps.setString(2, str2);
                           		ps.setString(3, str3);
                           		ps.setString(4, str4);
                           		ps.setString(5, str5);
                           		ps.executeUpdate();
                           		%><script language="javascript">
                           alert("INSERT SUCESSFUL");
                        </script>
                        <%
                           }
                           else
                           {
                           	%><script language="javascript">
                           alert("ENTER COMPLETE DETAILS..!!!");
                        </script>
                        <%		
                           }
                           }
                           	
                           else if(a.equals("DELETE DOCTOR PROFILE"))
                           {
                            String str= request.getParameter("t1");
                           	if(str!="")
                           	{
                           		PreparedStatement ps1 = null;
                           		ResultSet rs = null;
                           		String sq="select * from T_AS_DOCTOR where DOCTOR_ID = ?";
                           		ps1 = c.prepareStatement(sq);
                           ps1.setString(1, str);
                           rs = ps1.executeQuery();
                           		if(rs.next())
                           		{	
                           			PreparedStatement psDel = null;
                           			String sql = "delete from T_AS_DOCTOR where DOCTOR_ID = ?";
                           			psDel = c.prepareStatement(sql);
                           			psDel.setString(1, str);
                            		psDel.executeUpdate();
                           			%><script language="javascript">
                           alert("PROFILE OF DOCTOR WITH ID <%=str%> DELETED");
                        </script>
                        <%
                           }
                           else
                           {
                           	%><script language="javascript">
                           alert("INVALID DOCTOR ID <%=str%>..!!!");
                        </script>
                        <%
                           }
                           }
                           else
                           {
                           %><script language="javascript">
                           alert("ENTER DOCTOR'S ID TO DELETE..!!!");
                        </script>
                        <%	
                           }
                           }
                           else if(a.equals("EDIT DOCTOR PROFILE"))
                           {
                           String str= request.getParameter("t1");
                           if(str!="")
                           {
                            
                           PreparedStatement ps1 = null;
                           ResultSet rs = null;
                           String sq="select * from T_AS_DOCTOR where DOCTOR_ID = ?";
                           ps1 = c.prepareStatement(sq);
                           ps1.setString(1, str);
                           rs = ps1.executeQuery();
                           
                           	if(rs.next())
                           	{	
                           		PreparedStatement psUpdate = null;
                           String sql = "UPDATE T_AS_DOCTOR SET ? = ? WHERE DOCTOR_ID = ?";
                           psUpdate = c.prepareStatement(sql);
                           psUpdate.setString(1, "DOC_PHONE");
                           psUpdate.setString(2, str3);
                           psUpdate.setString(3, str);
                           psUpdate.executeUpdate();
                           		%><script language="javascript">
                           alert("PROFILE OF DOCTOR WITH ID <%=str%>EDITED");
                        </script>
                        <%
                           }
                           else
                           {
                           	%><script language="javascript">
                           alert("INVALID DOCTOR ID <%=str%>..!!!");
                        </script>
                        <%
                           }
                           }
                           else
                           {
                           %><script language="javascript">
                           alert("ENTER DOCTOR'S ID TO EDIT..!!!");
                        </script>
                        <%	
                           }
                           }
                           }catch(Exception e) {}
                           
                           %>
                     </table>
                  </form>
                  <input type="button" name="bttn" value="HOME" onclick="location.href='home.jsp'">
               </td>
            </tr>
         </table>
      </center>
   </body>
</html>