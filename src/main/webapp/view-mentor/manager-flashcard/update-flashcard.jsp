<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Flashcard</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="../view-mentor/css/styles.css" rel="stylesheet" type="text/css"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #299be4;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn {
                color: #566787;
                float: right;
                font-size: 13px;
                background: #fff;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn:hover, .table-title .btn:focus {
                color: #566787;
                background: #f2f2f2;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.settings {
                color: #2196F3;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">MEMORYCALL</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="hidden"  />

                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user fa-fw"></i> <span class="icon-user"></span> ${sessionScope.user.name}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../userProfile">Thông tin người dùng</a>
                        <a class="dropdown-item" href="../updateProfile">Thay đổi thông tin</a>
                        <form action="forgot-password" method="post">
                            <input type="hidden" name="email" value="${sessionScope.user.email}">
                            <button type="submit" class="dropdown-item">Đổi mật khẩu</button>
                        </form>
                        <a class="dropdown-item" href="../login">Đăng xuất</a>           
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="dashboard">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý danh mục</div>
                            <a class="nav-link" href="manage-category">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Xem tất cả
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý câu hỏi</div>
                            <a class="nav-link" href="manageFlashCard">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-eye"></i></div>
                                Xem tất cả
                            </a>
                            <a class="nav-link" href="add-flashcard">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-plus"></i></div>
                                Thêm câu hỏi
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý khóa học</div>
                            <a class="nav-link" href="manageCourse">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-eye"></i></div>
                                Xem tất cả
                            </a>
                            <a class="nav-link" href="add-course">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-plus"></i></div>
                                Thêm khóa học
                            </a>
                            <div class="sb-sidenav-menu-heading">Quản lý học sinh</div>
                            <a class="nav-link" href="manageStudent">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Xem tất cả
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        MEMTOR
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h2>Sửa <b>thẻ nhớ</b></h2>
                                        </div>
                                    </div>
                                </div>
                                <form action="manageFlashCard" method="post">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="flashcard_id" value="${flashcard.flashcard_id}">
                                    <c:if test="${not empty errorMessage}">
                                        <div class="alert alert-danger" role="alert">
                                            ${errorMessage}
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <label>Câu hỏi</label>
                                        <input type="text" name="question" class="form-control" value="${flashcard.question}" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Đáp án</label>
                                        <input type="text" name="answer" class="form-control" value="${flashcard.answer}" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày tạo</label>
                                        <input type="text" name="date_created" class="form-control" value="${flashcard.create_at}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label>Trạng thái</label>
                                        <select name="active" class="form-control" disabled>
                                            <option value="1" ${flashcard.active == 1 ? 'selected' : ''}>Kích hoạt</option>
                                            <option value="0" ${flashcard.active == 0 ? 'selected' : ''}>Vô hiệu</option>
                                        </select>
                                        <input type="hidden" name="active" value="1">
                                    </div>
                                    <div class="form-group">
                                        <label>ID Danh mục</label>
                                        <select class="form-control" id="category" name="category_id">
                                            <c:forEach var="category" items="${categories}">
                                                <option value="${category.category_id}" ${category.category_id == flashcard.category_id ? 'selected' : ''}>${category.category_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <!--                                                                        <div class="form-group">
                                                                                                                <label>Hình ảnh</label>
                                                                                                                <input type="text" name="image" class="form-control" value="${flashcard.image}" required>
                                                                                                            </div>-->

                                    <div class="form-group">
                                        <label>Hình ảnh ban đầu</label>
                                        <div id="originalImageContainer">
                                            <img id="originalImage" src="${flashcard.image}" alt="Original Image" style="max-width: 20%; display: ${flashcard.image ? 'block' : 'none'};">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Hình ảnh thay đổi</label>
                                        <!-- Thay đổi input để cho phép upload file -->
                                        <input type="file" name="imageFile" id="imageFile" class="form-control-file">
                                        <!-- Hiển thị hình ảnh sau khi upload -->
                                        <img id="previewImage" src="#" alt="Preview Image" style="max-width: 10%; display: none;">
                                        <!-- Input ẩn để lưu base64 string -->
                                        <input type="hidden" name="image" id="imageBase64" value="">
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Thay đổi</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div> 
                </main>

            </div>
        </div>
        <script>
            window.addEventListener('DOMContentLoaded', event => {

                // Toggle the side navigation
                const sidebarToggle = document.body.querySelector('#sidebarToggle');
                if (sidebarToggle) {
                    // Uncomment Below to persist sidebar toggle between refreshes
                    // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
                    //     document.body.classList.toggle('sb-sidenav-toggled');
                    // }
                    sidebarToggle.addEventListener('click', event => {
                        event.preventDefault();
                        document.body.classList.toggle('sb-sidenav-toggled');
                        localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
                    });
                }

            });
        </script>
        <script>
            $(document).ready(function () {
                // Validate form inputs
                $('form').on('submit', function (e) {
                    var isValid = true;
                    // Kiểm tra xem đã chọn file hình ảnh hay chưa
                    if ($('#imageFile').get(0).files.length === 0) {
                        alert('Vui lòng chọn file hình ảnh.');
                        isValid = false;
                    }
                    // Kiểm tra các trường text và textarea khác
                    $('input[type="text"], textarea').each(function () {
                        if ($.trim($(this).val()) === '') {
                            alert('Các trường không được để trống hoặc chỉ chứa khoảng trắng.');
                            isValid = false;
                            return false;
                        }
                    });
                    if (!isValid) {
                        e.preventDefault();
                    }
                });
            });
        </script>

        <script>
            // Xử lý khi người dùng chọn file hình ảnh
            document.getElementById('imageFile').addEventListener('change', function (event) {
                var file = event.target.files[0];

                // Kiểm tra nếu không phải là file hình ảnh
                if (!file.type.startsWith('image/')) {
                    alert('Vui lòng chỉ chọn file hình ảnh.');
                    document.getElementById('imageFile').value = ''; // Xóa lựa chọn file
                    return;
                }

                var reader = new FileReader();

                reader.onload = function (e) {
                    // Hiển thị hình ảnh đã chọn
                    document.getElementById('previewImage').src = e.target.result;
                    document.getElementById('previewImage').style.display = 'block';

                    // Chuyển đổi file thành base64 string và định dạng data URI
                    var base64String = e.target.result.split(',')[1];
                    var formattedBase64 = 'data:' + file.type + ';base64,' + base64String;
                    document.getElementById('imageBase64').value = formattedBase64; // Lưu base64 string vào input ẩn
                };

                reader.readAsDataURL(file);
            });
        </script>
        <script>
            // JavaScript code to display original image from base64 string
            window.addEventListener('DOMContentLoaded', function () {
                var originalImage = document.getElementById('originalImage');
                var originalImageContainer = document.getElementById('originalImageContainer');
                var imageBase64 = '${flashcard.image}'; // Replace with your actual base64 string

                if (imageBase64) {
                    originalImage.src = imageBase64;
                    originalImage.style.display = 'block';
                } else {
                    originalImageContainer.style.display = 'none';
                }
            });
        </script>

    </body>
</html>
