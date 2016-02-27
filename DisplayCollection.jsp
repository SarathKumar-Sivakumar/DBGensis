<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body background = "images/Background.jpg">

<FORM ACTION = "Home.jsp" METHOD = "post">
<center>
<font face = "Apple Chancery" size = "4px" color = "white">
<br /><br />

<%
Connection conn = null;
Statement st = null;
String console_name = request.getParameter("Console");
if(console_name.equalsIgnoreCase("Sega"))
{ %>
	<img src = "images/SEGA_logo.png" alt="sega" style="width:500px;height:150px">	
 <% }
else if(console_name.equalsIgnoreCase("PS3"))
{
	%>
	<img src = "images/PS3_Logo.png" alt="ps3" style="width:500px;height:150px">	
 <%	
}
else if(console_name.equalsIgnoreCase("XBOX"))
{
	%>
	<img src = "images/Xbox_logo.png" alt="xbox" style="width:500px;height:150px">	
 
  <%-- JDBC Connection to Database --%>
 <%	
}

try
{
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/GENESIS", "root", "");
String query = "select a.v_name , c.date,c.amount_paid,d.cond_name,e.cc_name,f.current_value from videogame a JOIN release_tbl b ON a.Vid_id = b.Vid_id  JOIN collection c ON b.R_id = c.R_id JOIN condition_tbl d ON c.Cond_id = d.Cond_id JOIN Cond_Comp e on c.cc_id = e.cc_id  JOIN MarketPrice f ON c.cc_id = f.cc_id and c.R_id = f.R_id  where c.R_id IN (select g.R_id from release_tbl g where g.Con_id IN (select h.Con_id from console h where h.Con_name =" +  "'" + console_name + "'))";
st = conn.createStatement();
ResultSet rs1 = st.executeQuery(query);
%>

<TABLE BORDER="1">
<TR>
                <TH>GAME NAME</TH>
                <TH>DATE OF PURCHASE</TH>
                <TH>AMOUNT PAID</TH>
                <TH>CONDITION</TH>
                <TH>CONDITION COMPLETENESS</TH>
                <TH>CURRENT VALUE</TH>
</TR>

<% 
while(rs1.next())
{
%>
	  <TR>
                <TD> <%= rs1.getString("v_name") %></td>
                <TD> <%= rs1.getString("date") %></TD>
                <TD> <%= rs1.getString("amount_paid") %></TD>
                <TD> <%= rs1.getString("cond_name") %></TD>
                <TD> <%= rs1.getString("cc_name") %></TD>
                <TD> <%= rs1.getString("current_value") %></TD>
     </TR>	
<% } %>
</TABLE> <br />

 <% 
 }
catch(SQLException e)
{
    System.out.println("Connection Failed! Check output console");
    e.printStackTrace();
    return;
}
%>
<br />
<input type = "submit" value ="Return to Home" style="width: 200px; height: 25px;"><br />

</font>
</center>
</FORM>
</body>
</html>
