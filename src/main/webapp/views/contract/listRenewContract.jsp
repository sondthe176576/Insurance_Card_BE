<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Renew Contracts</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listRenewContract.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
</head>
<body class="bg-gray-100">
<%-- Thiết lập biến để nhận diện trang hiện tại --%>
<c:set var="page" value="renewContract"/>

<!-- Include header -->
<jsp:include page="/views/includes/header_list.jsp"/>
<!-- End of header -->

<!-- Include sidebar -->
<jsp:include page="/views/includes/sidebar.jsp"/>
<!-- End of sidebar -->

<!-- Main Content -->
<div class="main-content ml-64 p-6">
    <div class="container mx-auto mt-5">
        <div class="card p-8 shadow-lg rounded-lg bg-white animate__animated animate__fadeIn">
            <h2 class="text-center text-4xl font-semibold text-gray-700 mb-6">Renew Contract Management System</h2>

            <c:if test="${param.message != null}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <c:out value="${param.message}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <form class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6" method="get" action="${pageContext.request.contextPath}/listRenewContract">
                <div>
                    <label for="customerNameSearch" class="block text-gray-600 mb-2">Search by Customer Name:</label>
                    <input type="text" id="customerNameSearch" name="customerName" value="${param.customerName}"
                           class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" placeholder="Enter customer name"/>
                </div>
                <div class="flex items-end">
                    <button type="submit" class="btn bg-indigo-600 text-white py-2 px-4 rounded-md shadow-md hover:bg-indigo-700"><i class="fas fa-search"></i> Search
                    </button>
                </div>
            </form>
            <table class="min-w-full bg-white divide-y divide-gray-200 shadow overflow-hidden sm:rounded-lg">
                <thead class="bg-gray-800 text-white">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">No</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Customer ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Customer Name</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Contract ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Contract Info</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Start Date</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">End Date</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Days Overdue</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Insurance Type</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Coverage</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Premium</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Action</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <c:forEach var="entry" items="${contractDaysOverdueMap}" varStatus="status">
                    <c:set var="contract" value="${entry.key}"/>
                    <c:set var="daysOverdue" value="${entry.value}"/>
                    <tr class="hover:bg-gray-100 transition duration-150 ease-in-out">
                        <td class="px-6 py-4 whitespace-nowrap"><c:out value="${(currentPage - 1) * 10 + status.count}"/></td>
                        <td class="px-6 py-4 whitespace-nowrap"><c:out value="${contract.customerID}"/></td>
                        <td class="px-6 py-4 whitespace-nowrap"><c:out value="${contract.customerName}"/></td>
                        <td class="px-6 py-4 whitespace-nowrap"><c:out value="${contract.contractID}"/></td>
                        <td class="px-6 py-4 whitespace-nowrap"><c:out value="${contract.contractInfo}"/></td>
                        <td class="px-6 py-4 whitespace-nowrap"><fmt:formatDate value="${contract.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td class="px-6 py-4 whitespace-nowrap"><fmt:formatDate value="${contract.endDate}" pattern="yyyy-MM-dd"/></td>
                        <td class="px-6 py-4 whitespace-nowrap text-red-600">
                            <c:out value="${daysOverdue}"/> days
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap"><c:out value="${contract.insuranceType}"/></td>
                        <td class="px-6 py-4 whitespace-nowrap"><c:out value="${contract.coverage}"/></td>
                        <td class="px-6 py-4 whitespace-nowrap text-right"><fmt:formatNumber value="${contract.premium}" type="currency" currencySymbol="$"/></td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <a href="${pageContext.request.contextPath}/renewContract?contractID=${contract.contractID}"
                               class="text-indigo-600 hover:text-indigo-900"><i class="fas fa-sync-alt"></i> Renew</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Pagination -->
            <nav aria-label="Page navigation example" class="mt-4">
                <ul class="inline-flex items-center -space-x-px">
                    <c:if test="${currentPage > 1}">
                        <li>
                            <a class="page-link p-2 border border-gray-300 rounded-l-lg shadow-sm hover:bg-gray-200"
                               href="${pageContext.request.contextPath}/listRenewContract?page=${currentPage - 1}&customerName=${param.customerName}">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                            <li class="${i == currentPage ? 'active' : ''} mx-1">
                                <a class="page-link p-2 border border-gray-300 shadow-sm ${i == currentPage ? 'bg-gray-800 text-white' : ''} hover:bg-gray-200"
                                   href="${pageContext.request.contextPath}/listRenewContract?page=${i}&customerName=${param.customerName}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li>
                            <a class="page-link p-2 border border-gray-300 rounded-r-lg shadow-sm hover:bg-gray-200"
                               href="${pageContext.request.contextPath}/listRenewContract?page=${currentPage + 1}&customerName=${param.customerName}">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- End of Main Content -->
</body>
</html>