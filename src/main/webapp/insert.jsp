<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% String expensecategory = request.getParameter("expensecategory");
String date = request.getParameter("date");
String expensename = request.getParameter("expensename");
String description = request.getParameter("description");
double amount = Double.parseDouble(request.getParameter("amount"));


String url = "jdbc:mysql://localhost:3306/expensemanager";
String username = "root";
String password = "";

Connection conn = null;
PreparedStatement stmt = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);
    String sql = "INSERT INTO userexpense (ID, ExpenseCategory, Date, ExpenseName, Description, Amount) " +
                 "VALUES (null, ?, ?, ?, ?, ?)";
    stmt = conn.prepareStatement(sql);
    stmt.setString(1, expensecategory);
    stmt.setString(2, date);
    stmt.setString(3, expensename);
    stmt.setString(4, description);
    stmt.setDouble(5, amount);
    int rowsAffected = stmt.executeUpdate();
    out.println(rowsAffected + " row(s) inserted.");
     } catch (ClassNotFoundException e) {
       e.printStackTrace();
     } catch (SQLException e) {
       e.printStackTrace();
     } finally {
    try { if (stmt != null) stmt.close(); } catch (Exception e) {};
    try { if (conn != null) conn.close(); } catch (Exception e) {};
}
%>

