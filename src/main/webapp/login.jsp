<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Triview Login</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary" >
<div id="layoutAuthentication" >
            <div id="layoutAuthentication_content" style="background-color:#20c997">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                                    <div class="card-body">
                                        <form action="loginAction.jsp">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="u_id" type="text" placeholder="ID" />
                                                <label for="id">ID</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="u_password" type="password" placeholder="Password" />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="">비밀번호를 잊으셨나요?</a>
                                                <a class="btn btn-primary" href="place.jsp" style="background-color:#20c997; border-color:#20c997">로그인</a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="join.jsp">회원가입</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
    <!--  <h1 style = "text-align:center;">로그인</h1>  
    
	<div>
		<ul>
			<li>
		   		<span style="font-size:25px;">ID</span>
		   		<br>
		   		<input type="text" placeholder="ID" class="box" required>
		   		<br>
			</li>
			<li>
				<span style="font-size:25px;">Password</span>
		   		<br>
		   		<input type="text" placeholder="Password" class="box" required>
		   		<br>
		   	</li>
		   		
			<li>
		   		<button style="font-size:25px;" onclick="location.href='review_restaurant.jsp'">로그인</button>
			</li>

	</ul>

</div>
     
    
</body>-->
</html>