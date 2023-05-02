<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Expense Manager - Display Expenses</title>

</head>

<body>

    <div>

	<h2>Display Expenses</h2>

	<%
	String url = "jdbc:mysql://localhost:3306/expensemanager";
	String username = "root";
	String password = "";
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    conn = DriverManager.getConnection(url, username, password);
	    // Prepare the SQL select statement
	    String sql = "SELECT * FROM userexpense ORDER BY date";
	    stmt = conn.prepareStatement(sql);
	    rs = stmt.executeQuery();
	    out.println("<table border='1'>");
	    out.println("<tr><th>Expense Category</th><th>Date</th><th>Expense Name</th><th>Description</th><th>Amount</th></tr>");
	    while (rs.next()) {
	        String expenseCategory = rs.getString("expensecategory");
	        String date = rs.getString("date");
	        String expenseName = rs.getString("expensename");
	        String description = rs.getString("description");
	        double amount = rs.getDouble("amount");
	        out.println("<tr><td>" + expenseCategory + "</td><td>" + date + "</td><td>" + expenseName + "</td><td>" + description + "</td><td>" + amount + "</td></tr>");
	    }
	    out.println("</table>");
	    } catch (ClassNotFoundException e) {
	      e.printStackTrace();
	    } catch (SQLException e) {
	      e.printStackTrace();
	    } finally {

	    try { if (rs != null) rs.close(); } catch (Exception e) {};
	    try { if (stmt != null) stmt.close(); } catch (Exception e) {};
	    try { if (conn != null) conn.close(); } catch (Exception e) {};
	}
	%>
	</div>

	<div class="button-container">
      <button class="go-to-home-button" onclick="goToHome()">Go to Home</button>
      <script>
         function goToHome() {
             window.location.href = "index.jsp";
          }
      </script>
    </div>

</body>
</html>