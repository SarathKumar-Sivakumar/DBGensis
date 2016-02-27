<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body background = "images/Background.jpg" onload="timer=setTimeout(function(){ window.location='http://localhost:8080/DBProject_New/Home.jsp';}, 5000)">

<FORM ACTION = "Home.jsp" METHOD = "post">
<center>
<br/><br/><br/>
<font face = "Apple Chancery" size = "8px" color = "white">

 <%-- JDBC Connection to Database --%>
 
<%
String release_name = request.getParameter("Release");
String release_id = release_name.substring(0,4);
String cond = request.getParameter("Condition");
String cond_comp = request.getParameter("Conditioncomp");
String date_of_purchase = request.getParameter("Date");
String month = date_of_purchase.substring(0,2);
String day = date_of_purchase.substring(3,5);
String year = date_of_purchase.substring(6,10);
String new_date = year + "-" + month + "-" + day;
String amount_paid = request.getParameter("AmountPaid");

Connection conn = null;
String coll_id_next = null;
Statement st = null;
Statement st1 = null;
Statement st2 = null;
Statement st3 = null;
Statement st4 = null;
String cc_id = null;
String cond_id = null;
String videogame_id = null;

try
{
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/GENESIS", "root", "");
String query = "select max(coll_id)+1 as coll_id_next from collection";
String query2 = "select cc_id from cond_comp where cc_name =" + "'" + cond_comp + "'";
String query3 = "select cond_id from condition_tbl where cond_name =" + "'" + cond + "'";
st = conn.createStatement();
st1 = conn.createStatement();
st2 = conn.createStatement();
st3 = conn.createStatement();
st4 = conn.createStatement();

ResultSet rs1 = st.executeQuery(query);
while(rs1.next())
{
	coll_id_next = rs1.getString("coll_id_next");
}

ResultSet rs2 = st2.executeQuery(query2);
while(rs2.next())
{
	cc_id = rs2.getString("cc_id");
}

ResultSet rs3 = st3.executeQuery(query3);
while(rs3.next())
{
	cond_id = rs3.getString("cond_id");
}

String update_query = "insert into collection values" + "(" + coll_id_next + "," + "'" + new_date + "'," + amount_paid + "," + cc_id + "," + release_id + "," + cond_id + ")";   
st4.executeUpdate(update_query);
}

catch(SQLException e)
{
    System.out.println("Connection Failed! Check output console");
    e.printStackTrace();
    return;
}

out.println("The release" + "\t" + "'" + "" + release_name + "'" + "" + "\t" + "has been added to your collection\n\n");
%>

<br />
<input type = "submit" value ="RETURN HOME" style="width: 200px; height: 50px;"><br />
<label> You will be redirected in 5 seconds..</label>

</font>
</center>
</FORM>
</body>
</html>
