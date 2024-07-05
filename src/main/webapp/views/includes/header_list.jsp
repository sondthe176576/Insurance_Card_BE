<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header">
    <div class="logo">
        <i class="bi bi-shield-lock-fill"></i> My Insurance
    </div>
    <div class="user-profile">
        <i class="bi bi-person-circle"></i>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/customerinfo">Profile</a>
                <a href="${pageContext.request.contextPath}/logout">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login">Login</a>
            </c:otherwise>
        </c:choose>
        <div class="notifications">
            <i class="bi bi-bell"></i>
            <span class="badge">5</span>
        </div>
    </div>
</div>