
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<html>
  <HEAD>
    <TITLE>Random Number</TITLE>
  </HEAD>
  <BODY>

      <H1 ALIGN="right">
     
      <FONT COLOR="RED">
        <% int id= (int) (Math.random() * 10);
      out.println("Air Quality Now:-");
      out.println(id);
   String url="jdbc:mysql://localhost:3306/tarun";
        String user="root";
        String password="123456";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
       Connection myconn=DriverManager.getConnection(url,user,password);
       Statement mystmt=myconn.createStatement();
       String sql="insert into user(air_id)"  +"values("+id+")";

       mystmt.executeUpdate(sql);


        }
        catch(Exception exc)
        {
        exc.getCause();
        }
    
    response.setIntHeader("Refresh", 20);
%>

      </FONT>
    </H1>
<H4 ALIGN="center">
 <FONT COLOR="RED">
     <form name="frm" action="result.jsp" method="post" >
         <h2> press submit to get the Average status of last 2 Minute Air Quality</h2>
<input type="submit" name="Submit" value="Submit" />
 </form>
 </FONT>
 </H4>
  </BODY>
</HTML>
