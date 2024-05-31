<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/bx_slider.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link href="css/styles.css" rel="stylesheet" />
<title>Triview Join</title>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content"
			style="background-color: #20c997">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">회원가입</h3>
								</div>
								<div class="card-body">
									<form action="joinAction.jsp">



										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="u_name"
												placeholder=" Enter your Name" required /> <label
												for="inputName">name</label>
										</div>



										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="u_id"
												placeholder=" Enter your ID" required /> <label
												for="inputID">ID</label>
										</div>



										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" name="u_password"
														type="password" placeholder="Create a password" required />
													<label for="inputPassword">Password</label>
												</div>
											</div>
											<!--  <div class="col-md-6">
              <div class="form-floating mb-3 mb-md-0">
                 <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="Confirm password" required/>
                 <label for="inputPasswordConfirm">Confirm Password</label>
               </div>
           </div>-->
										</div>





										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="u_nationality"
												placeholder=" Enter your Nationality" required /> <label
												for="inputNationality">Nationality</label>
										</div>




										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="u_race"
												placeholder=" Enter your Race" required /> <label
												for="inputRace">Race</label>
										</div>




										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="u_address"
												placeholder=" Enter your Address" required /> <label
												for="inputAddress">Address</label>
										</div>



										<span style="font-size: 25px;">Start Date of Residence</span>
										<div class="form-floating mb-3">
											<input class="form-control" type="date" name="u_addressstart"
												placeholder="Date" required /> <label for="inputDate">Date</label>
										</div>

										<div class="mt-4 mb-0">
											<div class="d-grid">
												<a class="btn btn-primary btn-block" href="login.jsp"
													style="background-color: #20c997; border-color: #20c997">회원가입</a>
											</div>
										</div>


									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="login.jsp">이미 계정이 있으신가요? 로그인</a>
									</div>
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
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</body>
</html>
