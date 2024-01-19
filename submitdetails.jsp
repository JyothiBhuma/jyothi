<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "system", "9876");

// Create and execute SQL update query
String updateQuery = "insert into studentdetails values(?,?,?,?,?,?,?,?,?)";
PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
preparedStatement.setString(1,request.getParameter("firstname"));
preparedStatement.setString(2,request.getParameter("lastname"));
preparedStatement.setString(3,request.getParameter("gender"));
preparedStatement.setString(4,request.getParameter("number"));
preparedStatement.setString(5,request.getParameter("bday"));
preparedStatement.setString(6,request.getParameter("email"));
preparedStatement.setString(7,request.getParameter("dept"));
preparedStatement.setString(8,request.getParameter("rollno"));
preparedStatement.setString(9,request.getParameter("mobileno"));

int rowsUpdated = preparedStatement.executeUpdate();
preparedStatement.close();
connection.close();

if (rowsUpdated > 0) {
    out.println("User information updated successfully.");
} else {
    out.println("Failed to update user information.");
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
