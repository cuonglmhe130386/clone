<%-- 
    Document   : courses
    Created on : 28 May 2024, 19:23:07
    Author     : DAT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Academics &mdash; Website by Colorlib</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <link rel="stylesheet" href="css/jquery.fancybox.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">

        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

        <link rel="stylesheet" href="css/aos.css">
        <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/viewcourse.css">

        <script>
            function getOnclick() {
                let form = document.getElementById("f1");
                form.submit();
            }

            function getUrlParameter(name) {
                name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                var results = regex.exec(location.search);
                return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
            }

            function updateUrlParameter() {
                var courseName = document.getElementById('courseName').value;
                var categoryId = document.getElementById('category_id').value;

                var url = new URL(window.location.href);

                if (courseName) {
                    url.searchParams.set('course_name', courseName);
                }
                if (categoryId) {
                    url.searchParams.set('category_id', categoryId);
                }

                window.history.replaceState({}, '', url);
            }

            function redirectToCourse() {
                updateUrlParameter();
                var courseName = document.getElementById('courseName').value;
                var categoryId = document.getElementById('category_id').value;
                var url = 'viewcourse?course_name=' + encodeURIComponent(courseName) + '&category_id=' + encodeURIComponent(categoryId);
                window.location.href = url;
            }

            function paginate(page) {
                var courseName = getUrlParameter('course_name');
                var categoryId = getUrlParameter('category_id');
                var url = 'viewcourse?page=' + page;

                if (courseName) {
                    url += '&course_name=' + encodeURIComponent(courseName);
                }
                if (categoryId) {
                    url += '&category_id=' + encodeURIComponent(categoryId);
                }

                window.location.href = url;
            }

            window.onload = function () {
                var courseName = getUrlParameter('course_name');
                var categoryId = getUrlParameter('category_id');
                if (courseName) {
                    document.getElementById('courseName').value = courseName;
                }
                if (categoryId) {
                    document.getElementById('category_id').value = categoryId;
                }
            }
        </script>
    </head>

    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

        <div class="site-wrap">

            <div class="site-mobile-menu site-navbar-target">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close mt-3">
                        <span class="icon-close2 js-menu-toggle"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>


            <%@include file="layout/header.jsp" %>

            <div class="site-section">           
                <div class="container">    
                    <a href="index.jsp">Trang chủ</a>
                    <span class="mx-3 icon-keyboard_arrow_right"></span>
                    <a class="current">Khóa học</a>
                    <h2 class="mt-6"><a href="courseEnroll" class="btn btn-primary">Ấn để xem các khóa học đã đăng kí</a> </h2> 
                    <p></p>
                    <p></p>

                    <div class="container">
                        <div class="row mb-4">
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Nhập tên khóa học" id="courseName" oninput="updateUrlParameter()">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button" onclick="redirectToCourse()">Tìm kiếm</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row mb-4">
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <select class="form-control" name="category_id" id="category_id" onchange="redirectToCourse()"> 
                                        <option value="0">Tổng hợp</option>
                                        <c:forEach items="${requestScope.category}" var="category" varStatus="loop">
                                            <option 
                                                <c:if test="${requestScope.selected==category.category_id}">
                                                    selected
                                                </c:if>
                                                value="${category.category_id}">${category.category_name}</option>      
                                        </c:forEach> 
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="container">
                        <div class="row">
                            <c:forEach items="${requestScope.course}" var="course">
                                <div class="col-lg-4 col-md-6 mb-4">
                                    <div class="course-1-item">
                                        <figure class="thumnail">
                                            <div class="category"><h3>${course.course_name}</h3></div>  
                                        </figure>
                                        <div class="course-1-content pb-4">
                                            <h2>${course.description}</h2>
                                            <p><a href="course-detail?course_id=${course.course_id}" class="btn btn-primary rounded-0 px-4">Xem chi tiết</a></p>                               
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>    
                            <div class="text-center" style="display: inline-block; margin-right:auto; width: 100%">
                                <c:forEach var="i" begin="1" end="${numPages}">
                                    <a href="javascript:void(0)" class="btn btn-outline-dark ${i == page ? 'active' : ''}" onclick="paginate(${i})">${i}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row mb-4">
                            <div class="col-lg-6">
                            </div>
                        </div>
                    </div>                  

                    <div class="col-3 align-self-center">
                        <div>                          
                        </div>
                    </div>                 
                </div>
            </div>
        </div>
        <!-- .site-wrap -->

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

</html>