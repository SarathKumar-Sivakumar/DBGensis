<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Video Games</title>
</head>

<body background = "images/Background.jpg" onload="timer=setTimeout(function(){ window.location='http://localhost:8080/DBProject_New/Home.jsp';}, 5000)">
<FORM ACTION="Home.jsp" method="post">
<center>
<br/><br/><br/>
<font face = "Apple Chancery" size = "8px" color = "white">

 <%-- JDBC Connection to Database --%>
 
<%
Connection conn = null;
Statement st1 = null;
Statement st2 = null;
Statement st3 = null;
Statement st31 = null;
Statement st4 = null;
Statement st5 = null;
Statement st6 = null;
Statement st7 = null;
Statement st8 = null;
Statement st9 = null;
String videogameid_next = null;
String releaseid_next = null;
String category_id = null;
String console_id = null;

try
{
	String currvalue_c = request.getParameter("C");
	String currvalue_ci = request.getParameter("CI");
	String currvalue_cb = request.getParameter("CB");
	String currvalue_cib = request.getParameter("CIB");
	String videogame_name = request.getParameter("VName");
	String category_name = request.getParameter("Category");
	String console_name = request.getParameter("Console");
	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/GENESIS", "root", "");
	String query1 = "select max(vid_id) + 100 as maxvideogameid from videogame";
	String query2 = "select cat_id from category where cat_name =" + "'" + category_name + "'";
	st1 = conn.createStatement();
	st2 = conn.createStatement();
	st3 = conn.createStatement();
	st31 = conn.createStatement();
	st4 = conn.createStatement();
	st5 = conn.createStatement();
	st6 = conn.createStatement();
	st7 = conn.createStatement();
	st8 = conn.createStatement();
	st9 = conn.createStatement();
	ResultSet rs1 = st1.executeQuery(query1);
	while(rs1.next())
	{
		videogameid_next = rs1.getString("maxvideogameid");
	}
	
	ResultSet rs2 = st2.executeQuery(query2);
	while(rs2.next())
	{
		category_id = rs2.getString("cat_id");
	}
	
	String update_query = "insert into videogame values" + "(" + videogameid_next + "," + "\"" + videogame_name + "\"" + "," + category_id + ")";    
	st31.executeUpdate(update_query);
	
	String query3 = "select max(R_id) + 1 as maxreleaseid from release_tbl";
	String query4 = "select con_id from console where con_name =" + "'" + console_name + "'";
	
	ResultSet rs3 = st3.executeQuery(query3);
	while(rs3.next())
	{
		releaseid_next = rs3.getString("maxreleaseid");
	}

	
	ResultSet rs4 = st4.executeQuery(query4);
	while(rs4.next())
	{
		console_id = rs4.getString("con_id");
	}
	
    String update_query_1 = "insert into release_tbl values" + "(" + releaseid_next + "," + console_id  + "," + videogameid_next + ")";   
    
	st5.executeUpdate(update_query_1);
	
    String update_query_2 = "insert into marketprice values" + "(" + currvalue_c + "," + "111"  + "," + releaseid_next + ")";   
    
	st6.executeUpdate(update_query_2);
	
	String update_query_3 = "insert into marketprice values" + "(" + currvalue_ci + "," + "112"  + "," + releaseid_next + ")";   
	    
	 st7.executeUpdate(update_query_3);
		
	 String update_query_4 = "insert into marketprice values" + "(" + currvalue_cb + "," + "113"  + "," + releaseid_next + ")";   
		    
	  st8.executeUpdate(update_query_4);
			
	  String update_query_5 = "insert into marketprice values" + "(" + currvalue_cib + "," + "114"  + "," + releaseid_next + ")";   
			    
	  st9.executeUpdate(update_query_5);
	
	  out.println("The VideoGame" + "\t" + videogame_name + "\t" + "has been added");
}

catch(SQLException e)
{
    System.out.println("Connection Failed! Check output console");
    e.printStackTrace();
    return;
}
%>

<br /><br />
<input type = "submit" value = "Return Home" style="width: 200px; height: 50px;"><br /> <br />
<label>You will be redirected in 5 seconds..</label>

</font>
</center>
</FORM>
</body>
</html>