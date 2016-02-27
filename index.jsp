<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Genesis VGC</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
 <script>
$(function() {
$( "#datepicker" ).datepicker();
});
</script>


</head>
<body>
<h1 align = "center">Genesis VGC</h1>



<FORM ACTION="AddCollection.jsp" method="post">
<table>
<tr><td>
<label>Video game:</label>
<%
Connection conn = null;
ArrayList<String> VName = new ArrayList<String>();
ArrayList<String> CCName = new ArrayList<String>();
try
{
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/game", "root", "");
String query = "select * from videogame";
Statement st = null;
st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query1 = "select * from cond_comp";
Statement st1 = null;
st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);

while(rs.next())
{
 
 VName.add(rs.getString("Name"));
}


while(rs1.next())
{
 
 CCName.add(rs1.getString("cc_name"));
}


}
catch(SQLException e)
{
    System.out.println("Connection Failed! Check output console");
    e.printStackTrace();
}


   int size = VName.size();
    %>
    <select name="VideoGame">
    <%
    for (int i=0;i<size;i++) {
    String s = (String) VName.get(i);
    %>
    <option value="<%=s%>" ><%=s%></option>
    <%
    }
    %>
</select><br/>
</td>
</tr>

<tr><td>
<label>Condition Completeness:</label>
<select name="Conditioncomp">
    <%
    int size1 = CCName.size();
    for (int i=0;i<size1;i++) {
    String s1 = (String) CCName.get(i);
    %>
    <option value="<%=s1%>" ><%=s1%></option>
    <%
    }
%>
</select><br/>
</td>
</tr>

<tr><td>
<label>Condition:</label>
<select name="Condition">
<option value="New">New</option>
<option value="Mint">Mint</option>
<option value="VeryGood">Very Good</option>
<option value="Good">Good</option>
<option value="Poor">Poor</option>
<option value="Acceptable">Acceptable</option>
</select><br/>
</td>
</tr>

<tr><td>
<label>Type:</label>
<select name="Type">
<option value="Catridge">Catridge</option>
<option value="CD">CD</option>
<option value="DVD">DVD</option>
</select><br/>
</td>
</tr>

<tr><td>
<label>Date:</label>

<input type="date" name="Date" id = "datepicker"><br/>
</td></tr>


<tr><td>
<label>Amount Paid:(In $)</label>
<input type="text" name="AmountPaid"><br/>
</td>
</tr>
</table>

<input type = "submit" value = "Add Video game"><br/>

</form> 

</body>
</html>