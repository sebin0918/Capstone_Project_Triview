<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
</head>
<body>
	<link href="css/styles2.css" rel="stylesheet" />
    <div>
        <h1>개인정보 수정</h1>
    </div>

    <div class="container">
        <article>
            <section class="content">
                <div class="pic">
                    <img src="images/지도.jpg", alt="my pic">
                </div>
                
                <p class="user">내 이름</p>
                
                <br>

                <ul class="menu">
                    <li>
                        <a href="upload.jsp">개인 정보 수정</a>
                    </li>
                    <br>
                    <li>
                        <a href="post.jsp">나의 후기글</a>
                    </li>
                    <br>
                    <li>
                        <a href="place.jsp">찜한 장소</a>
                    </li>
                </ul>
            </section>
        </article>

        <aside class="sidebar">
            <section>
                <ul class="info">
                    <li>
                        <span style="font-size:25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Profile</span>
                        <input type="file" name="photo" id="photo" required>
                        <input type="submit" value="업로드">
                        <br>
                    </li>
                    <br>
                    <li>
                           <span style="font-size:25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID</span>
                           <input type="text" placeholder="ID" class="box" required>
                           <button>edit</button>
                           <br>
                    </li>
                    <br>
                    <li>
                        <span style="font-size:25px;">&nbsp;&nbsp;Password</span>
                        <input type="text" placeholder="Password" class="box" required>
                        <button>edit</button>
                        <br>
                    </li>
                    <br>
                    <li>
                        <span style="font-size:25px;">Nationality</span>
                        <input type="text" placeholder="South Korea" class="box" required>
                        <br>
                    </li>
                    <br>
                    <li>
                        <span style="font-size:25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Race</span>
                        <input type="text" placeholder="White" class="box" required>
                        <button>edit</button>
                        <br>
                    </li>
                    <br>
                    <li>
                        <span style="font-size:25px;">&nbsp;&nbsp;&nbsp;&nbsp;Address</span>
                        <input type="text" placeholder="Address" class="box" required>
                        <button>edit</button>
                        <br>
                    </li>       
                    <br>
                    <li>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="withdraw.jsp">회원탈퇴</a>
                    </li> 
                    <br>                   
                    <div class="go" >
                        <div class="space3"></div>
                        <button type="button" onclick="location.href='main.jsp'" class="btn1">Apply</button>
                        <div class="space2"></div>
                        <button type="button" onclick="location.href='main.jsp'" class="btn2">Cancel</button>
                    </div>
        
            </ul>
            </section>
        </aside>


    </div>
</body>
</html>