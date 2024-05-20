<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Contract</title>
    <link href="${pageContext.request.contextPath}/css/createContract.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<div class="container">
    <div class="form-container">
        <h2>Create New Contract</h2>
        <form action="${pageContext.request.contextPath}/createContract" method="post">
            <div class="form-group">
                <label for="customerID">Customer ID:</label>
                <input type="number" id="customerID" name="customerID" required>
            </div>
            <div class="form-group">
                <label for="contractInfo">Contract Info:</label>
                <input type="text" id="contractInfo" name="contractInfo" required>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" id="status" name="status" required>
            </div>
            <div class="form-group">
                <label for="startDate">Start Date:</label>
                <input type="date" id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label>
                <input type="date" id="endDate" name="endDate" required>
            </div>
            <div class="form-group">
                <label for="detail">Detail:</label>
                <input type="text" id="detail" name="detail" required>
            </div>
            <div class="form-group">
                <label for="value">Value:</label>
                <input type="number" id="value" name="value" step="100" required>
            </div>
            <div class="membership-info">
                <p><strong>Introductory Member</strong> – This option requires two steps. After completing the contact
                    information and circling your choice, please submit the form to the Membership Chairperson at the
                    address below. Do not include a cheque. You will receive an invitation to attend an information
                    session. We want to provide as much information as possible to you about KAGS. At the end of the
                    session you may complete the application for membership form and pay the $50 membership fee.</p>
                <p><strong>Patron</strong> – A supporter of the Arts. Receives the newsletters, but does not exhibit or
                    gallery sit, participate in open studios or classes and is not expected to participate on a
                    committee. Membership fee is $25/year.</p>
            </div>
            <h3>Application can be dropped off or mailed to:</h3>
            <p>
                KAWARTHA ARTISTS' GALLERY & STUDIO,<br>
                420 O'CONNELL RD.,<br>
                PETERBOROUGH, ONT.<br>
                K9J 4C9
            </p>
            <p>
                705-741-2817<br>
                www.kawarthaartists.org
            </p>
            <button type="submit" class="btn-submit">Create Contract</button>
        </form>
    </div>
</div>
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
</body>
</html>
