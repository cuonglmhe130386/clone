<%-- 
    Document   : view-course
    Created on : 11 Jul 2024, 10:37:34
    Author     : DAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link
            href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
            rel="stylesheet"/>
        <link rel="stylesheet" href="fonts/icomoon/style.css" />

        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />

        <link rel="stylesheet" href="css/jquery.fancybox.min.css" />

        <link rel="stylesheet" href="css/bootstrap-datepicker.css" />

        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css" />

        <link rel="stylesheet" href="css/aos.css" />
        <link
            href="css/jquery.mb.YTPlayer.min.css"
            media="all"
            rel="stylesheet"
            type="text/css"/>
        <link rel="stylesheet" href="css/style.css">   
    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
        <jsp:include page="layout/header.jsp" />

        <div
            class="site-section ftco-subscribe-1 site-blocks-cover pb-4"
            style="background-image: url('images/bg_1.jpg')"
            >
            <div class="container">
                <div class="row align-items-end">
                    <div class="col-lg-7">
                        <h2 class="mb-0">Từng bước nhỏ, dẫn đến thành công lớn!</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="site-section">
            <div class="container">
                <a href="mentor/dashboard" class="btn btn-primary">Quay lại</a>
                <p></p>
                <p></p>
                <div class="row">
                    <c:forEach items="${requestScope.course}" var="course">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="course-1-item">
                                <figure class="thumnail">
                                    <div class="category"><h3>${course.course_name}</h3></div>  
                                </figure>
                                <div class="course-1-content pb-4">
                                    <h2>${course.description}</h2>
                                    <p><a href="studentDatatable?course_id=${course.course_id}" class="btn btn-primary rounded-0 px-4">Xem chi tiết</a></p>                               
                                </div>
                            </div>
                        </div>
                    </c:forEach>    
                    <div class="text-center" style="display: inline-block; margin-right:auto; width: 100%">
                        <c:forEach var="i" begin="1" end="${numPages}">
                            <a href="mentorProfile?page=${i}&name=${param.name}" class="btn btn-outline-dark ${i == page ? 'active' : ''}">
                                ${i}
                            </a>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>                           

        <div class="section-bg style-1" style="background-image: url('images/hero_1.jpg');">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                        <span class="icon flaticon-mortarboard"></span>
                        <h3>Our Philosphy</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis recusandae, iure repellat quis delectus ea? Dolore, amet reprehenderit.</p>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                        <span class="icon flaticon-school-material"></span>
                        <h3>Academics Principle</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis recusandae, iure repellat quis delectus ea?
                            Dolore, amet reprehenderit.</p>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                        <span class="icon flaticon-library"></span>
                        <h3>Key of Success</h3>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis recusandae, iure repellat quis delectus ea?
                            Dolore, amet reprehenderit.</p>
                    </div>
                </div>
            </div>
        </div>


        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <p class="mb-4"><img src="images/logo.png" alt="Image" class="img-fluid"></p>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae nemo minima qui dolor, iusto iure.</p>  
                        <p><a href="#">Learn More</a></p>
                    </div>
                    <div class="col-lg-3">
                        <h3 class="footer-heading"><span>Our Campus</span></h3>
                        <ul class="list-unstyled">
                            <li><a href="#">Acedemic</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Our Interns</a></li>
                            <li><a href="#">Our Leadership</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Human Resources</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h3 class="footer-heading"><span>Our Courses</span></h3>
                        <ul class="list-unstyled">
                            <li><a href="#">Math</a></li>
                            <li><a href="#">Science &amp; Engineering</a></li>
                            <li><a href="#">Arts &amp; Humanities</a></li>
                            <li><a href="#">Economics &amp; Finance</a></li>
                            <li><a href="#">Business Administration</a></li>
                            <li><a href="#">Computer Science</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h3 class="footer-heading"><span>Contact</span></h3>
                        <ul class="list-unstyled">
                            <li><a href="#">Help Center</a></li>
                            <li><a href="#">Support Community</a></li>
                            <li><a href="#">Press</a></li>
                            <li><a href="#">Share Your Story</a></li>
                            <li><a href="#">Our Supporters</a></li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="copyright">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- .site-wrap -->

        <!-- loader -->
        <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#51be78"/></svg></div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.fancybox.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/jquery.mb.YTPlayer.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</body>
</html>


