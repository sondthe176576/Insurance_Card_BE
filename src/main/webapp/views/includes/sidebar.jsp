<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar">
    <div class="sidebar-header">
        <i class="bi bi-list"></i> Menu
    </div>
    <a href="${pageContext.request.contextPath}/listWaitingContract" class="${page == 'newContract' ? 'active' : ''}">
        <i class="bi bi-file-earmark-plus"></i> New Contracts
    </a>
    <a href="${pageContext.request.contextPath}/listAccident" class="${page == 'accidents' ? 'active' : ''}">
        <i class="bi bi-exclamation-triangle"></i> Accidents
    </a>
    <a href="${pageContext.request.contextPath}/listCompensation" class="${page == 'compensation' ? 'active' : ''}">
        <i class="bi bi-cash"></i> Compensation
    </a>
    <a href="${pageContext.request.contextPath}/listPunishment" class="${page == 'punishment' ? 'active' : ''}">
        <i class="bi bi-exclamation-triangle"></i> Punishments
    </a>
    <a href="#" class="${page == 'settings' ? 'active' : ''}">
        <i class="bi bi-gear"></i> Settings
    </a>
</div>