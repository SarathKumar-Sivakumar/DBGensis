<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>

<body background = "images/Background.jpg">

<FORM ACTION = "Home.jsp" METHOD = "post">
<center>
<br/><br/><br/>
<font face = "Apple Chancery" size = "4px" color = "white">

 <%-- JDBC Connection to Database --%>
<%
String query_number = request.getParameter("queries");

Connection conn = null;
Statement st1 = null;
Statement st2 = null;
Statement st3 = null;
Statement st4a = null;
Statement st4b = null;
Statement st5 = null;
Statement st6 = null;
Statement st7 = null;
Statement st8 = null;
Statement st9 = null;
String query;
String query_2,query_3;


try{
	
	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/GENESIS", "root", "");
	st1 = conn.createStatement();
	st2 = conn.createStatement();
	st3 = conn.createStatement();
	st4a= conn.createStatement();
	st4b = conn.createStatement();
	st5 = conn.createStatement();
	st6 = conn.createStatement();
	st7 = conn.createStatement();
	if(query_number.equalsIgnoreCase("query1"))
	{
    
		query = "SELECT distinct r.R_id, v.V_name, cn.Con_name from release_tbl as r, collection as c, videogame as v, category as ct, console as cn Where r.R_id = c.R_id and v.vid_id = r.vid_id and ct.Cat_id = v.Cat_id and r.Con_id = cn.Con_id group by r.R_id order by r.R_id";
		ResultSet rs1 = st1.executeQuery(query);
		
%>

<TABLE BORDER="1">
<TR>
                <TH>Release ID</TH>
                <TH>Video Game</TH>
                <TH>Console Name</TH>              
</TR>

<% 					
while(rs1.next())
{ %>
	  <TR>
      <TD> <%= rs1.getString("R_id") %></TD>
      <TD> <%= rs1.getString("V_name") %></TD>
      <TD> <%= rs1.getString("Con_name") %></TD>    
</TR>

<% 	
} %>

</TABLE> <br />
<%				
	}
	
	else if(query_number.equalsIgnoreCase("query2"))
	{
		
		query = "Select c.R_id, v.v_name as Videogame, count(c.R_id) as Noofduplicates, ct.Cat_name as CategoryName From collection As c, videogame As v, release_tbl As r, category as ct Where c.R_id = r.R_id and v.vid_id = r.vid_id and ct.Cat_id = v.Cat_id Group by c.R_id having Noofduplicates > 1";
		ResultSet rs2 = st2.executeQuery(query);		
%>

<TABLE BORDER="1">
<TR>
                <TH>Release ID</TH>
                <TH>VideoGame</TH>
                <TH>Number of Duplicates</TH>
                <TH>Category Name</TH>
                
</TR>

<% 					
while(rs2.next())
{ %>
	  <TR>
      <TD> <%= rs2.getString("R_id") %></td>
      <TD> <%= rs2.getString("Videogame") %></TD>
      <TD> <%= rs2.getString("Noofduplicates") %></TD>
      <TD> <%= rs2.getString("CategoryName") %></TD>
    
</TR>
<% 	
} %>

</TABLE> <br />

<%		
	}	
	else if(query_number.equalsIgnoreCase("query3"))
	{
		
		query = "Select sum(m.Current_value) As Total_cost from collection As c, marketprice As m where c.cc_id = m.cc_id And c.R_id = m.R_id";
		ResultSet rs3 = st3.executeQuery(query);		
%>

<TABLE BORDER="1">
<TR>
                <TH>Total Cost</TH>                              
</TR>

<% 					
while(rs3.next())
{ %>
	  <TR>
      <TD> <%= rs3.getString("Total_cost") %></td>          
</TR>
<% 	
} %>

</TABLE> <br />

<%								
	}		
	else if(query_number.equalsIgnoreCase("query4a"))
	{		
		query = "SELECT c.Coll_id, c.Date, c.Amount_paid, e.cc_name,c.R_id,d.cond_name FROM collection AS c ,condition_tbl as d, cond_comp e where c.cond_id = d.cond_id and c.cc_id = e.cc_id and e.cc_name like" +  "'" + "CIB" + "'";
		ResultSet rs4a = st4a.executeQuery(query);		
%>

<TABLE BORDER="1">
<TR>
                <TH>Collection ID</TH>
                <TH>Date of Purchase</TH>
                <TH>Amount Paid</TH>
                <TH>Condition Completeness</TH>
                <TH>Release ID</TH>
                <TH>Condition</TH>                               
</TR>

<% 					
while(rs4a.next())
{ %>
	  <TR>
      <TD> <%= rs4a.getString("Coll_id") %></td>
      <TD> <%= rs4a.getString("Date") %></td>
      <TD> <%= rs4a.getString("Amount_paid") %></TD>
      <TD> <%= rs4a.getString("cc_name") %></TD>
      <TD> <%= rs4a.getString("R_id") %></TD>
      <TD> <%= rs4a.getString("cond_name") %></TD>         
</TR>

<% 	
} %>
</TABLE> <br />

<%								
	}	
	else if(query_number.equalsIgnoreCase("query4b"))
	{
		
		query = "SELECT c.Coll_id, c.Date, c.Amount_paid, e.cc_name,c.R_id,d.cond_name FROM collection AS c ,condition_tbl as d, cond_comp e where c.cond_id = d.cond_id and c.cc_id = e.cc_id and e.cc_name not like" + "'" + "CIB" + "'";
		ResultSet rs4b = st4b.executeQuery(query);		
%>

<TABLE BORDER="1">
<TR>
                <TH>Collection ID</TH>
                <TH>Date of Purchase</TH>
                <TH>Amount Paid</TH>
                <TH>Condition Completeness</TH>
                <TH>Release ID</TH>
                <TH>Condition</TH>                               
</TR>

<% 					
while(rs4b.next())
{ %>
	  <TR>
      <TD> <%= rs4b.getString("Coll_id") %></td>
      <TD> <%= rs4b.getString("Date") %></td>
      <TD> <%= rs4b.getString("Amount_paid") %></TD>
      <TD> <%= rs4b.getString("cc_name") %></TD>
      <TD> <%= rs4b.getString("R_id") %></TD>
      <TD> <%= rs4b.getString("cond_name") %></TD>          
</TR>

<% 	
} %>
</TABLE> <br />

<%				
	}	
	else if(query_number.equalsIgnoreCase("query5"))
	{
		
		query = "Select v.Vid_id,v.V_name,c.cc_name,r.R_id,m.Current_value From marketprice as m, videogame As v, cond_comp As c, release_tbl As r where  m.cc_id = c.cc_id and m.R_id = r.R_id And r.Vid_id = v.Vid_id and m.Current_value = (Select Max(m1.Current_value) From  marketprice As m1, collection As c Where m1.R_id = c.R_id and m1.cc_id = c.cc_id)";
		ResultSet rs5 = st5.executeQuery(query);		
%>

<TABLE BORDER="1">
<TR>
                <TH>Video Game ID</TH>
                <TH>Video Game Name</TH>
                <TH>Condition Completeness Name</TH>
                <TH>Release ID</TH>
                <TH>Current Value</TH>                               
</TR>

<% 					
while(rs5.next())
{ %>
	  <TR>
      <TD> <%= rs5.getString("Vid_id") %></td>
      <TD> <%= rs5.getString("V_name") %></td>
      <TD> <%= rs5.getString("cc_name") %></TD>
      <TD> <%= rs5.getString("R_id") %></TD>
      <TD> <%= rs5.getString("Current_value") %></TD>              
</TR>

<% 	
} %>
</TABLE> <br />

<%		
	}	
	else if(query_number.equalsIgnoreCase("query6"))
	{		
		query = "Select v.Vid_id,r.R_id,v.V_name, d.cc_name,m.Current_value, c.Amount_paid as Purchased_Amount From  marketprice As m, collection As c, videogame As v, cond_comp As d , release_tbl as r where m.Current_value > c.Amount_paid And m.R_id = c.R_id  And m.cc_id = c.cc_id  And m.R_id = r.R_id And R.vid_id = v.Vid_id  And d.cc_id = m.cc_id";
		ResultSet rs6 = st6.executeQuery(query);		
%>

<TABLE BORDER="1">
<TR>
                <TH>Video Game ID</TH>
                <TH>Release ID</TH>
                <TH>Video Game Name</TH>
                <TH>Condition Completeness Name</TH>
                <TH>Current Value</TH>
                <TH>Purchased Amount</TH>               
</TR>

<% 				
while(rs6.next())
{ %>
	  <TR>
      <TD> <%= rs6.getString("Vid_id") %></td>
      <TD> <%= rs6.getString("R_id") %></td>
      <TD> <%= rs6.getString("V_name") %></TD>
      <TD> <%= rs6.getString("cc_name") %></TD>
      <TD> <%= rs6.getString("Current_value") %></TD>
      <TD> <%= rs6.getString("Purchased_Amount") %></TD>   
</TR>

<% 	
} %>
</TABLE> <br />

<%	
	}
	else if(query_number.equalsIgnoreCase("query7"))
	{	
		query = "Create View View1 as (Select c.coll_id, r.R_id, v.Vid_id, v.V_name, d.cc_name, m.Current_value, c.Amount_paid as Purchased_Amount, (m.Current_value - c.Amount_paid) As IncreasedAmount From  marketprice As m, collection As c, videogame As v, cond_comp As d , release_tbl as r where m.Current_value > c.Amount_paid And m.R_id = c.R_id And m.cc_id = c.cc_id And m.R_id = r.R_id And R.vid_id = v.Vid_id And d.cc_id = m.cc_id)";
		query_2 = "select * from View1 where IncreasedAmount = (select max(IncreasedAmount) from View1)";
		query_3 = "Drop View View1;";
		st7.executeUpdate(query);	
		PreparedStatement pst = conn.prepareStatement(query_2);
		PreparedStatement pst2 = conn.prepareStatement(query_3);
		ResultSet rs8 = pst.executeQuery(query_2);
		
%>

<TABLE BORDER="1">
<TR>
                <TH>Collection ID</TH>
                <TH>Release ID</TH>
                <TH>Video Game ID</TH>
                <TH>Video Game Name</TH>
                <TH>Condition Completeness Name</TH>
                <TH>Current Value</TH>
                <TH>Purchased Amount</TH>
                <TH>Increased Amount</TH>             
</TR>

<% 				
while(rs8.next())
{ %>
	  <TR>
      <TD> <%= rs8.getString("coll_id") %></td>
      <TD> <%= rs8.getString("R_id") %></td>
      <TD> <%= rs8.getString("Vid_id") %></td>
      <TD> <%= rs8.getString("v_name") %></TD>
      <TD> <%= rs8.getString("cc_name") %></td>
      <TD> <%= rs8.getString("Current_value") %></td>
      <TD> <%= rs8.getString("Purchased_Amount") %></td>
      <TD> <%= rs8.getString("IncreasedAmount") %></TD>  
</TR>

<% 	

}
pst2.executeUpdate(query_3);
%>
</TABLE> <br />

<%		
	}
}

catch(SQLException e)
{
    System.out.println("Connection Failed! Check output console");
    e.printStackTrace();
    return;
}
%>
<input type = "submit" value = "Return Home">

</font>
</center>
</FORM>
</body>
</html>