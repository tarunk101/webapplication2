<%-- 
    Document   : result
    Created on : Apr 21, 2016, 10:06:22 AM
    Author     : TARUN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <H1 ALIGN="center">
         <FONT COLOR="RED">
        <%

        String url="jdbc:mysql://localhost:3306/tarun?useSSL=false";
        String user="root";
        String password="123456";
        try
        {
             Class.forName("com.mysql.jdbc.Driver");
       Connection myconn=DriverManager.getConnection(url,user,password);
       Statement mystmt=myconn.createStatement();
       String query="SELECT AVG(air_id) FROM user WHERE time > time(time(now())-interval 2 minute)";

      ResultSet rs = mystmt.executeQuery(query);
      while (rs.next())
      {
        int id = rs.getInt("AVG(air_id)");
        out.println("AVERAGE AIR QUALITY OF LAST 2 MINUTE:-");
         out.println(id) ;
         if(id<4)
              out.println("-Air Quality is poor") ;
         else if(id>=4 && id <8)
             out.println("-Air Quality is fair") ;
         else
             out.println("-Air Quality is Excellent") ;
      }
      mystmt.close();
    }
    catch (Exception e)
    {
      System.err.println("Got an exception! ");
      System.err.println(e.getMessage());
    }

        %>
        </FONT>
         </H1>
    </body>
</html>
