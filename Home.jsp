<%@ page language="java" import = "java.sql.*,com.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,java.util.ArrayList" %>
     <%@ page import="com.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%-- Cascading Stylesheet for Tabs --%>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
 
 <%-- JQuery JS Files for Tabs --%>
 
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

 <script>
$(function() {
$( "#tabs" ).tabs();
});
</script>

<title>Genesis VGC</title>

 <%-- Cascading Style Sheet for Calendar --%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">

 <%-- JQuery JS Files for Calendar --%>
 
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
 
<script>
$(function() {
$( "#datepicker" ).datepicker();
});
</script>

</head>

<body background = "images/Background.jpg">
<img src="images/Dota.jpg" alt="dota" style="width:310px;height:150px">
<img src="images/Assassinscreed.jpg" alt="assassins" style="width:310px;height:150px">
<img src="images/HALO.jpg" alt="halo" style="width:310px;height:150px">
<img src="images/callofduty.jpg" alt="callofduty" style="width:310px;height:150px">


<div id = "tabs">

 <ul>
<li><a href="#tabs-0">Add Video Game</a></li>
<li><a href="#tabs-1">Add Game to Collection</a></li>
<li><a href="#tabs-2">View Collection</a></li>
<li><a href="#tabs-3">SQL Query Results</a></li>
</ul>

 <%-- Tab 1 - Add Video Game --%>
 
<div id = "tabs-0" style = "background-image:url(http://s02.radikal.ru/i175/1210/f5/7ffa25c935bb.jpg);width:auto;height:auto">

<FORM ACTION="AddVideoGame.jsp" method="post">

<TABLE>

<tr>
<td align = "left">
<font face = "Apple Chancery" color = "white"><label> Video Game Name </label></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "text" name = "VName"> <br /><br />
</td></tr>

<tr>
<td align = "left">
<font face = "Apple Chancery" color = "white"><label>Category</label></font>

 <%-- JDBC Connection to Database --%>
 
<% 
Connection conn1 = null;
ArrayList<String> CategoryName = new ArrayList<String>();
ArrayList<String> ConsoleName = new ArrayList<String>();

try
{

	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/GENESIS", "root", "");
	String query11 = "select * from category";
	Statement st11 = null;
	st11 = conn1.createStatement();
	ResultSet rs11 = st11.executeQuery(query11);
	while(rs11.next())
	{
	 
	 CategoryName.add(rs11.getString("cat_name"));
	}
	
	String query12 = "select * from console";
	Statement st12 = null;
	st12 = conn1.createStatement();
	ResultSet rs12 = st12.executeQuery(query12);
	while(rs12.next())
	{
	 
	 ConsoleName.add(rs12.getString("con_name"));
	}
}


catch(SQLException e)
{
    System.out.println("Connection Failed! Check output console");
    e.printStackTrace();
}

%>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<select name="Category" style="width: 215px;">
    <%
    int size11 = CategoryName.size();
    for (int k11=0;k11<size11;k11++) {
    String s11 = (String) CategoryName.get(k11);
    %>
    <option value="<%=s11%>" ><%=s11%></option> 
    <%
  }
%>

</select><br/><br />
</td></tr>

<tr><td>

<font face = "Apple Chancery" color = "white"><label> Console </label></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<select name="Console" style="width: 215px;">
    <%
    int size12 = ConsoleName.size();
    for (int k12=0;k12<size12;k12++) {
    String s12 = (String) ConsoleName.get(k12);
    %>
    <option value="<%=s12%>" ><%=s12%></option> 
    <%
  }
%>
</select><br/> <br />
</td></tr>

<tr><td>
<font face = "Apple Chancery" color = "white"><label> Current Value for C</label></font>
&nbsp;&nbsp;
<input type = "text" name ="C"><br /><br />
</td></tr>

<tr><td>
<font face = "Apple Chancery" color = "white"><label> Current Value for CI</label></font>
&nbsp;
<input type = "text" name ="CI"> <br /><br />
</td></tr>

<tr><td>
<font face = "Apple Chancery" color = "white"><label> Current Value for CB</label></font>
&nbsp;
<input type = "text" name ="CB"> <br /><br />
</td></tr>

<tr><td>
<font face = "Apple Chancery" color = "white"><label> Current Value for CIB</label></font>
<input type = "text" name ="CIB"><br /><br />
</td></tr>
</TABLE>

<input type = "Submit" value = "Add VideoGame" style="width: 215px;">
</FORM>
</div>

 <%-- Tab 2 - Add Video Game to Collection --%>
 
 <div id="tabs-1" style = "background-image:url(http://s02.radikal.ru/i175/1210/f5/7ffa25c935bb.jpg);width:auto;height:auto">
<FORM ACTION="AddCollection.jsp" method="post">
<table>

<tr><td>
<font face = "Apple Chancery" color = "white"><label>Release (Release ID - Game Name - Console Name)</label></font>

 <%-- JDBC Connectivity to Database --%>
 
<%
Connection conn = null;
String[] Release_Name = new String[100];
int i = 0;

ArrayList<String> RID = new ArrayList<String>();
ArrayList<String> CCName = new ArrayList<String>();
ArrayList<String> CondName = new ArrayList<String>();

try
{
	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/GENESIS", "root", "");
	
String query1 = "select * from cond_comp";
Statement st1 = null;
st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);


String query2 = "select * from condition_tbl";
Statement st2 = null;
st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2); 

String query3 = "select r.R_id, v.v_name,c.Con_name from Release_tbl r JOIN videogame v ON r.Vid_id = v.vid_id JOIN console c ON r.con_id = c.Con_id";
Statement st3 = null;
st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);

while(rs1.next())
{
 
 CCName.add(rs1.getString("cc_name"));
}

while(rs2.next())
{
 
	CondName.add(rs2.getString("Cond_name"));
}

while(rs3.next())
{
	String release_id = rs3.getString("R_id");
	String game_name = rs3.getString("v_name");
	String console_name = rs3.getString("Con_name");
	Release_Name[i] = release_id + "-" + game_name + "-" + console_name;
	i++;
}

}

catch(SQLException e)
{
    System.out.println("Connection Failed! Check output console");
    e.printStackTrace();
}   
    %>
 
    <select name="Release">
    <%
    for (int j=0;j<i;j++) {
    %>
  <option value="<%=Release_Name[j]%>" ><%=Release_Name[j]%></option> 
    <%
  }
    %>
</select><br/><br/>
</td>
</tr>

<tr><td>
<font face = "Apple Chancery" color = "white"><label>Condition Completeness</label></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<select name="Conditioncomp">
    <%
    int size1 = CCName.size();
    for (int k=0;k<size1;k++) {
    String s1 = (String) CCName.get(k);
    %>
    <option value="<%=s1%>" ><%=s1%></option> 
    <%
  }
%>
</select><br/><br/>
</td>
</tr>

<tr><td>
<font face = "Apple Chancery" color = "white"><label>Condition:</label></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<select name="Condition">
   <%
    int size2 = CondName.size();
    for (int l=0;l<size2;l++) {
    String s2 = (String) CondName.get(l);
    %>
    <option value="<%=s2%>" ><%=s2%></option> 
    <%
  }
%>
</select><br/><br/>
</td>
</tr>

<tr><td>
<font face = "Apple Chancery" color = "white"><label>Date:</label></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="text" name="Date" id = "datepicker"><br/><br/>
</td></tr>

<tr><td>
<font face = "Apple Chancery" color = "white"><label>Amount Paid:(In $)</label></font>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="AmountPaid"><br/><br/>
</td>
</tr>
</table>

<input type = "submit" value = "Add Game to Collection"><br/><br/>
</form> 
</div>

 <%-- Tab 3 - Display All Games in Collection and Display Games based on Console --%>
 
<div id="tabs-2" style = "background-image:url(http://s02.radikal.ru/i175/1210/f5/7ffa25c935bb.jpg);width:auto;height:auto">

<FORM ACTION="DisplayCollection.jsp" method="post">
<font face = "Apple Chancery" color = "white">

 <%-- JDBC Connection to Database --%>
 
<%
Connection connection = null;
ArrayList<String> Con_Name = new ArrayList<String>();

try
{
	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/GENESIS", "root", "");
	
String query4 = "select * from console";
Statement st4 = null;
st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);

String query5 = "select a.v_name , c.date,c.amount_paid,d.cond_name,e.cc_name,f.current_value from videogame a JOIN release_tbl b ON a.Vid_id = b.Vid_id JOIN collection c ON b.R_id = c.R_id JOIN condition_tbl d ON c.Cond_id = d.Cond_id JOIN Cond_Comp e on c.cc_id = e.cc_id JOIN MarketPrice f ON c.cc_id = f.cc_id and c.R_id = f.R_id";
Statement st5 = null;
st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
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
while(rs5.next())
{

%>
	  <TR>
                <TD> <%= rs5.getString("v_name") %></td>
                <TD> <%= rs5.getString("date") %></TD>
                <TD> <%= rs5.getString("amount_paid") %></TD>
                <TD> <%= rs5.getString("cond_name") %></TD>
                <TD> <%= rs5.getString("cc_name") %></TD>
                <TD> <%= rs5.getString("current_value") %></TD>
     </TR>	
<% } %>
</TABLE> <br />

<label>Select Console</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<%
while(rs4.next())
{
 
 Con_Name.add(rs4.getString("con_name"));
}

}

catch(SQLException e)
{
    System.out.println("Connection Failed! Check output console");
    e.printStackTrace();
}   
    %>
 
   <select name="Console">
   <%
    int size3 = Con_Name.size();
    for (int l=0;l<size3;l++) {
    String s3 = (String) Con_Name.get(l);
    %>
    <option value="<%=s3%>" ><%=s3%></option> 
    <%
  }
%>
</select><br/><br/>
<input type = "submit" value = "Show Specific Games for Console"><br/>
</font>
</FORM>
</div>

 <%-- Tab 4 - Display Query results (Task 4) --%>
 
<div id="tabs-3" style = "background-image:url(http://s02.radikal.ru/i175/1210/f5/7ffa25c935bb.jpg);width:auto;height:auto">
<FORM ACTION="Queries.jsp" method="post">
<font face = "Apple Chancery" color = "white">
<INPUT TYPE="radio" NAME="queries" VALUE="query1" CHECKED>
             Show Unique Games in Collection
            <BR><BR>
            <INPUT TYPE="radio" NAME="queries" VALUE="query2">
             Show Duplicate Games in Collection
            <BR><BR>
            <INPUT TYPE="radio" NAME="queries" VALUE="query3">
             Total Cost of Collection
            <BR><BR>
            <INPUT TYPE="radio" NAME="queries" VALUE="query4a">
             Collector's Complete Games
            <BR><BR>
            <INPUT TYPE="radio" NAME="queries" VALUE="query4b">
             Games Missing Something
            <BR><BR>
            <INPUT TYPE="radio" NAME="queries" VALUE="query5">
             Most Expensive Game (Based on Current Market Price)
            <BR><BR>
            <INPUT TYPE="radio" NAME="queries" VALUE="query6">
             Game Purchased at a lower price than the current market price
            <BR><BR>
            <INPUT TYPE="radio" NAME="queries" VALUE="query7">
             Game with the highest increase in value
            <BR><BR>
           
            <INPUT TYPE="submit" VALUE="Show Query Results">

</font>
</FORM>
</div>
</body>
</html>