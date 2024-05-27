<%--
  Created by IntelliJ IDEA.
  User: 09114
  Date: 5/24/2024
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/includes/header.jsp" />
link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
<div class="container mt-3 mb-4">
    <div class="col-lg-9 mt-4 mt-lg-0">
        <div class="row">
            <div class="col-md-12">
                <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
                    <table class="table manage-candidates-top mb-0">
                        <thead>
                        <tr>
                            <th>Candidate Name</th>
                            <th class="text-center">Status</th>
                            <th class="action text-right">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="candidates-list">
                            <td class="title">
                                <div class="thumb">
                                    <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="">
                                </div>
                                <div class="candidate-list-details">
                                    <div class="candidate-list-info">
                                        <div class="candidate-list-title">
                                            <h5 class="mb-0"><a href="#">Brooke Kelly</a></h5>
                                        </div>
                                        <div class="candidate-list-option">
                                            <ul class="list-unstyled">
                                                <li><i class="fas fa-filter pr-1"></i>Information Technology</li>
                                                <li><i class="fas fa-map-marker-alt pr-1"></i>Rolling Meadows, IL 60008</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="candidate-list-favourite-time text-center">
                                <a class="candidate-list-favourite order-2 text-danger" href="#"><i class="fas fa-heart"></i></a>
                                <span class="candidate-list-time order-1">Shortlisted</span>
                            </td>
                            <td>
                                <ul class="list-unstyled mb-0 d-flex justify-content-end">
                                    <li><a href="#" class="text-primary" data-toggle="tooltip" title="" data-original-title="view"><i class="far fa-eye"></i></a></li>
                                    <li><a href="#" class="text-info" data-toggle="tooltip" title="" data-original-title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                                    <li><a href="#" class="text-danger" data-toggle="tooltip" title="" data-original-title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="candidates-list">
                            <td class="title">
                                <div class="thumb">
                                    <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                </div>
                                <div class="candidate-list-details">
                                    <div class="candidate-list-info">
                                        <div class="candidate-list-title">
                                            <h5 class="mb-0"><a href="#">Ronald Bradley</a></h5>
                                        </div>
                                        <div class="candidate-list-option">
                                            <ul class="list-unstyled">
                                                <li><i class="fas fa-filter pr-1"></i>Human Resources</li>
                                                <li><i class="fas fa-map-marker-alt pr-1"></i>Monroe Township, NJ 08831</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="candidate-list-favourite-time text-center">
                                <a class="candidate-list-favourite order-2 text-danger" href="#"><i class="fas fa-heart"></i></a>
                                <span class="candidate-list-time order-1">Shortlisted</span>
                            </td>
                            <td>
                                <ul class="list-unstyled mb-0 d-flex justify-content-end">
                                    <li><a href="#" class="text-primary" data-toggle="tooltip" title="" data-original-title="view"><i class="far fa-eye"></i></a></li>
                                    <li><a href="#" class="text-info" data-toggle="tooltip" title="" data-original-title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                                    <li><a href="#" class="text-danger" data-toggle="tooltip" title="" data-original-title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="candidates-list">
                            <td class="title">
                                <div class="thumb">
                                    <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">
                                </div>
                                <div class="candidate-list-details">
                                    <div class="candidate-list-info">
                                        <div class="candidate-list-title">
                                            <h5 class="mb-0"><a href="#">Rafael Briggs</a></h5>
                                        </div>
                                        <div class="candidate-list-option">
                                            <ul class="list-unstyled">
                                                <li><i class="fas fa-filter pr-1"></i>Recruitment Consultancy</li>
                                                <li><i class="fas fa-map-marker-alt pr-1"></i>Haines City, FL 33844</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="candidate-list-favourite-time text-center">
                                <a class="candidate-list-favourite order-2 text-danger" href="#"><i class="fas fa-heart"></i></a>
                                <span class="candidate-list-time order-1">Shortlisted</span>
                            </td>
                            <td>
                                <ul class="list-unstyled mb-0 d-flex justify-content-end">
                                    <li><a href="#" class="text-primary" data-toggle="tooltip" title="" data-original-title="view"><i class="far fa-eye"></i></a></li>
                                    <li><a href="#" class="text-info" data-toggle="tooltip" title="" data-original-title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                                    <li><a href="#" class="text-danger" data-toggle="tooltip" title="" data-original-title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="candidates-list">
                            <td class="title">
                                <div class="thumb">
                                    <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                                </div>
                                <div class="candidate-list-details">
                                    <div class="candidate-list-info">
                                        <div class="candidate-list-title">
                                            <h5 class="mb-0"><a href="#">Vickie Meyer</a></h5>
                                        </div>
                                        <div class="candidate-list-option">
                                            <ul class="list-unstyled">
                                                <li><i class="fas fa-filter pr-1"></i>Human Resources</li>
                                                <li><i class="fas fa-map-marker-alt pr-1"></i>Minneapolis, MN 55406</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="candidate-list-favourite-time text-center">
                                <a class="candidate-list-favourite order-2 text-danger" href="#"><i class="fas fa-heart"></i></a>
                                <span class="candidate-list-time order-1">Shortlisted</span>
                            </td>
                            <td>
                                <ul class="list-unstyled mb-0 d-flex justify-content-end">
                                    <li><a href="#" class="text-primary" data-toggle="tooltip" title="" data-original-title="view"><i class="far fa-eye"></i></a></li>
                                    <li><a href="#" class="text-info" data-toggle="tooltip" title="" data-original-title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                                    <li><a href="#" class="text-danger" data-toggle="tooltip" title="" data-original-title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="candidates-list">
                            <td class="title">
                                <div class="thumb">
                                    <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
                                </div>
                                <div class="candidate-list-details">
                                    <div class="candidate-list-info">
                                        <div class="candidate-list-title">
                                            <h5 class="mb-0"><a href="#">Nichole Haynes</a></h5>
                                        </div>
                                        <div class="candidate-list-option">
                                            <ul class="list-unstyled">
                                                <li><i class="fas fa-filter pr-1"></i>Information Technology</li>
                                                <li><i class="fas fa-map-marker-alt pr-1"></i>Botchergate, Carlisle</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="candidate-list-favourite-time text-center">
                                <a class="candidate-list-favourite order-2 text-danger" href="#"><i class="fas fa-heart"></i></a>
                                <span class="candidate-list-time order-1">Shortlisted</span>
                            </td>
                            <td>
                                <ul class="list-unstyled mb-0 d-flex justify-content-end">
                                    <li><a href="#" class="text-primary" data-toggle="tooltip" title="" data-original-title="view"><i class="far fa-eye"></i></a></li>
                                    <li><a href="#" class="text-info" data-toggle="tooltip" title="" data-original-title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
                                    <li><a href="#" class="text-danger" data-toggle="tooltip" title="" data-original-title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="text-center mt-3 mt-sm-3">
                        <ul class="pagination justify-content-center mb-0">
                            <li class="page-item disabled"> <span class="page-link">Prev</span> </li>
                            <li class="page-item active" aria-current="page"><span class="page-link">1 </span> <span class="sr-only">(current)</span></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">...</a></li>
                            <li class="page-item"><a class="page-link" href="#">25</a></li>
                            <li class="page-item"> <a class="page-link" href="#">Next</a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>






