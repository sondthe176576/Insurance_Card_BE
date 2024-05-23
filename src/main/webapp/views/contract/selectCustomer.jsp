<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/23/2024
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Select Customer</title>
</head>
<body>
<%--<h2>Customer IDs</h2>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>CustomerID</th>--%>
<%--    </tr>--%>
<%--    <c:forEach var="customer" items="${customers}">--%>
<%--        <tr>--%>
<%--            <td><a href="selectContract?customerId=${customer.customerID}">${customer.customerID}</a></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<div class="form-group">
    <label for="customerID">Customer ID:</label>
    <select id="customerID" name="customerID">
        <option value="">Select Customer ID</option>
        <c:forEach var="customer" items="${customers}">
            <option value="${customer.customerID}">ID ${customer.customerID}</option>
        </c:forEach>
    </select>
</div>
</body>
</html>
