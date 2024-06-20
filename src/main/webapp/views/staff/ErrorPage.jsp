<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<jsp:include page="/views/includes/header.jsp" />
<div class="container">
    <h2>Error</h2>
    <div class="alert alert-danger">
        ${error}
    </div>
    <a href="${pageContext.request.contextPath}/customer-manage" class="btn btn-default">Back</a>
</div>
<jsp:include page="/views/includes/footer.jsp" />
