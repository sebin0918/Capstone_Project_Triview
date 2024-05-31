<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import='java.io.PrintWriter'%>
<%@ page import="review_restaurant.Review_restaurantDAO"%>
<%@ page import="review_restaurant.Review_restaurant"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/bx_slider.js"></script>
<script type="text/javascript" src="js/js.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Triview Restaurant Review Write</title>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<%
	String u_id = null;
	if (session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
	<!-- Navbar Brand--> <a href="restaurant.jsp"> <img
		src="./image/triview.png" width="210" , height="40"
		, style="padding: 0px 30px 0px 20px;">
	</a> <!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#!">
		<i class="fas fa-bars"></i>
	</button>
	<!-- Navbar Search-->
	<form
		class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		<div class="input-group">
			<input class="form-control" type="text" placeholder="Search for..."
				aria-label="Search for..." aria-describedby="btnNavbarSearch" />
			<button class="btn btn-primary" id="btnNavbarSearch" type="button"
				background-color="black">
				<i class="fas fa-search"></i>
			</button>
		</div>
	</form>
	<!-- Navbar-->
	<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
			aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>

			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="mypage.jsp">MyPage</a></li>

				<li><hr class="dropdown-divider" /></li>
				<%
				if (u_id == null) {
				%>

				<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
				<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
				<%
				} else {
				%>
				<li><a class="dropdown-item" href="login.jsp">로그아웃</a></li>
				<%
				}
				%>
			</ul></li>
	</ul>

	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading">Map</div>
					<a class="nav-link" href="place.jsp"> Place </a> <a
						class="nav-link" href="restaurant.jsp"> Restaurant </a>

					<div class="sb-sidenav-menu-heading">Interface</div>
					<a class="nav-link" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapsePages" aria-expanded="true"
						aria-controls="collapsePages">
						<div class="sb-nav-link-icon">
							<svg class="svg-inline--fa fa-book-open" aria-hidden="true"
								focusable="false" data-prefix="fas" data-icon="book-open"
								role="img" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 576 512" data-fa-i2svg=""> <path
								fill="currentColor"
								d="M249.6 471.5c10.8 3.8 22.4-4.1 22.4-15.5V78.6c0-4.2-1.6-8.4-5-11C247.4 52 202.4 32 144 32C93.5 32 46.3 45.3 18.1 56.1C6.8 60.5 0 71.7 0 83.8V454.1c0 11.9 12.8 20.2 24.1 16.5C55.6 460.1 105.5 448 144 448c33.9 0 79 14 105.6 23.5zm76.8 0C353 462 398.1 448 432 448c38.5 0 88.4 12.1 119.9 22.6c11.3 3.8 24.1-4.6 24.1-16.5V83.8c0-12.1-6.8-23.3-18.1-27.6C529.7 45.3 482.5 32 432 32c-58.4 0-103.4 20-123 35.6c-3.3 2.6-5 6.8-5 11V456c0 11.4 11.7 19.3 22.4 15.5z"></path></svg>
							<!-- <i class="fas fa-book-open"></i> Font Awesome fontawesome.com -->
						</div> Review
						<div class="sb-sidenav-collapse-arrow">
							<svg class="svg-inline--fa fa-angle-down" aria-hidden="true"
								focusable="false" data-prefix="fas" data-icon="angle-down"
								role="img" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 384 512" data-fa-i2svg=""> <path
								fill="currentColor"
								d="M169.4 342.6c12.5 12.5 32.8 12.5 45.3 0l160-160c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 274.7 54.6 137.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l160 160z"></path></svg>
							<!-- <i class="fas fa-angle-down"></i> Font Awesome fontawesome.com -->
						</div>
					</a>
					<div class="collapse show" id="collapsePages"
						aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion"
						style="">


						<div class="collapse show" id="pagesCollapseAuth"
							aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordionPages" style="">
							<nav class="sb-sidenav-menu-nested nav"> <a
								class="nav-link" href="review_place.jsp">Place Review</a> <a
								class="nav-link" href="review_restaurant.jsp">Restaurant
								Review</a> </nav>
						</div>


					</div>

				</div>
			</div>
		</div>
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">Restaurant Review 작성</h1>

				<div class="card-body">

					<div class="row">
						<form method="post" action="rrWriteAction.jsp">

							<table class="table table-striped"
								style="text-align: enter; border: 1px solid #dddddd;">

								<tbody>
									
									<tr>
										<td><textarea class="form-control" placeholder="글 내용"
												name="rp_comment" maxlength="2480" style="height: 350px;"></textarea></td>
									</tr>
									<tr>
										<td><span style="font-size: 19px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사진
												첨부하기</span> <input type="file"  name="photo" id="photo" required>
											<br></td>
									</tr>

								</tbody>
							</table>
							<input type="submit" class="btn btn-primary pull-right"
								value="글쓰기"> <input type="submit"
								class="btn btn-primary pull-right" value="영수증 인증하기">



						</form>
					</div>


				</div>
			</div>
			</main>
		</div>



		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			crossorigin="anonymous"></script>
		<script src="js/scripts.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
			crossorigin="anonymous"></script>
		<script src="assets/demo/chart-area-demo.js"></script>
		<script src="assets/demo/chart-bar-demo.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
			crossorigin="anonymous"></script>
		<script src="js/datatables-simple-demo.js"></script>
</body>
</html>