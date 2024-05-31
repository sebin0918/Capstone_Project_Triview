<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import='java.io.PrintWriter'%>
<%@ page import="review_place.Review_placeDAO"%>
<%@ page import="review_place.Review_place"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/bx_slider.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<meta charset="EUC-KR" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Place Review</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
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
								class="nav-link" href=review_place.jsp">Place Review</a> <a
								class="nav-link" href="review_restaurant.jsp">Restaurant
								Review</a> </nav>
						</div>


					</div>

				</div>
			</div>
		</div>

		<div id="layoutSidenav_content">
			<main> <!-- 이안에 메인 컨텐트 다 적기 -->

			<div class="container-fluid px-4">
				<h1 class="mt-4">Restaurant Review</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="rpWrite.jsp">후기 작성하기</a></li>
					<li class="breadcrumb-item active">Restaurant의 후기글 페이지</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<svg class="svg-inline--fa fa-table me-1" aria-hidden="true"
							focusable="false" data-prefix="fas" data-icon="table" role="img"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
							data-fa-i2svg=""> <path fill="currentColor"
							d="M64 256V160H224v96H64zm0 64H224v96H64V320zm224 96V320H448v96H288zM448 256H288V160H448v96zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64z"></path></svg>
						<!-- <i class="fas fa-table me-1"></i> Font Awesome fontawesome.com -->
						RESTAURANT REVIEW
					</div>
					<div class="card-body">
						<div
							class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
							<div class="datatable-top">
								<div class="datatable-dropdown">
									<label> <select class="datatable-selector"><option
												value="5">5</option>
											<option value="10" selected="">10</option>
											<option value="15">15</option>
											<option value="20">20</option>
											<option value="25">25</option></select> entries per page
									</label>
								</div>
								<div class="datatable-search">
									<input class="datatable-input" placeholder="Search..."
										type="search" title="Search within table"
										aria-controls="datatablesSimple">
								</div>
							</div>
							<%
// 데이터베이스 연결 설정
String url = "jdbc:mysql://localhost:3306/triview";
String username = "root";
String password = "tpahfdl3310";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    // JDBC 드라이버 로드
    Class.forName("com.mysql.jdbc.Driver");

    // 데이터베이스 연결
    conn = DriverManager.getConnection(url, username, password);

    // 데이터 검색 쿼리
    String sql = "SELECT * FROM review_restaurant";

    // 쿼리 실행
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
%>
							<div class="datatable-container">
								<table id="datatablesSimple" class="datatable-table">
									<thead>
										<tr>
											<th data-sortable="true" style="width: 10.32515337423313%;"><a
												href="#" class="datatable-sorter">닉네임</a></th>
											<th data-sortable="true" style="width: 14.572597137014313%;"><a
												href="#" class="datatable-sorter">매장 이름</a></th>
											<th data-sortable="true" style="width: 10.92842535787321%;"><a
												href="#" class="datatable-sorter">국적</a></th>
											<th data-sortable="true" style="width: 30.588957055214724%;"><a
												href="#" class="datatable-sorter">후기글 내용</a></th>
											<th data-sortable="true" style="width: 14.314928425357873%;"><a
												href="#" class="datatable-sorter">작성일</a></th>
										</tr>
									</thead>
									<tbody>
										<%
    // 결과 출력
    while (rs.next()) {
%>
										<tr>
											<td><%= rs.getString("rr_username") %></td>
											<td><%= rs.getString("r_number") %></td>
											<td><%= rs.getString("rp_nationality") %></td>
											<td><%= rs.getString("rp_comment") %></td>
											<td><%= rs.getString("rp_creatdate") %></td>
										</tr>
										<%
    }
%>
									</tbody>
								</table>
							</div>
							
							<%
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // 연결 종료
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (stmt != null) {
        try {
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
							
							<div class="datatable-bottom">
								<div class="datatable-info">Showing 1 to 10 of 57 entries</div>
								<nav class="datatable-pagination">
								
								<ul class="datatable-pagination-list">
									<li
										class="datatable-pagination-list-item datatable-hidden datatable-disabled"><a
										data-page="1" class="datatable-pagination-list-item-link">‹</a></li>
									<li class="datatable-pagination-list-item datatable-active"><a
										data-page="1" class="datatable-pagination-list-item-link">1</a></li>
									<li class="datatable-pagination-list-item"><a
										data-page="2" class="datatable-pagination-list-item-link">2</a></li>
									<li class="datatable-pagination-list-item"><a
										data-page="3" class="datatable-pagination-list-item-link">3</a></li>
									<li class="datatable-pagination-list-item"><a
										data-page="4" class="datatable-pagination-list-item-link">4</a></li>
									
									<li class="datatable-pagination-list-item"><a
										data-page="2" class="datatable-pagination-list-item-link">›</a></li>
								</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>

			</main>
		</div>
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

