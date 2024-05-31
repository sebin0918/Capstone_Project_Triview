<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="css/styles2.css" rel="stylesheet" />
</head>
<body>
    <div>
        <h1>마이페이지</h1>
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
                <div class="upper">
                    <h3 class="title1">기본 정보</h3>

                    
                        <div class="pic">
                            <img src="" alt="my pic">
                        </div>
                        <ul class="info1">
                            <br>
                            <li>
                               <span style="font-size:15px;">이름(실명작성)</span>
                               <input type="text" placeholder="이름" class="box" required>
                               <button>edit</button>
                               <br>
                            </li>
                            <br>
                            <li>
                                <span style="font-size:15px;">이메일(이용자 이메일)</span>
                                <input type="text" placeholder="Password" class="box" required>
                                <button>edit</button>
                                <br>
                            </li>
                            <br>
                            <li>
                                <span style="font-size:15px;">휴대전화</span>
                                <input type="text" placeholder="010-1234-5678" class="box" required>
                                <br>
                            </li>

                    

                        <button style="float: right;" onclick="location.href='upload.jsp'" >개인정보수정</button>
                    </ul>

                
                    <h3 style="padding-left: 1px; margin-left: 1px;">영수증 인증</h3>
                    <div class="receipt">
                        <div class="dl">인증1회</div>
                        <div class="dl">인증2회</div>
                        <div class="dl">인증2회</div>
                        <div class="dl">인증5회</div>                        
                    </div>

                </div>



                <h2>나의 후기글&nbsp;&nbsp;<a href="post.html" style="font-size: small;">more+</a></h2>
                <div class="post">
                    <div class="dl">후기글1</div>
                    <div class="dl">후기글2</div>
                    <div class="dl">후기글3</div>
                    <div class="dl">후기글4</div>                        
                </div>

                <ul>
                    <div class="go">
                        <div class="space1"></div>
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