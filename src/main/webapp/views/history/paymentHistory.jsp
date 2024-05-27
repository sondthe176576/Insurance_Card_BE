<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Payment History</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h2>Payment History</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Payment Date</th>
            <th>Amount</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Context initContext = new InitialContext();
                Context envContext = (Context) initContext.lookup("java:/comp/env");
                DataSource ds = (DataSource) envContext.lookup("jdbc/PaymentDB");
                conn = ds.getConnection();

                String sql = "SELECT id, payment_date, amount, description FROM payment_history WHERE customer_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, 1); // Replace with dynamic customer ID if necessary
                rs = stmt.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("id");
                    Date paymentDate = rs.getDate("payment_date");
                    double amount = rs.getDouble("amount");
                    String description = rs.getString("description");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= paymentDate %></td>
            <td><%= amount %></td>
            <td><%= description %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
