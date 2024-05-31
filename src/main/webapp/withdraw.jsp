<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<link href="css/styles2.css" rel="stylesheet" />
    <div>
        <h1>회원탈퇴</h1>
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
                    <h2>탈퇴 안내</h2>
                    <a>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</a>
            
                    <br>
                    <br>
                    <br>
                    <br>
            
                    <h2>√사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다. </h2>
                    <a><span style="color:red">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</span>하오니 신중하게 선택하시기 바랍니다.</h5></a>
            
                    <br>
                    <br>
                    <br>
                    <br>
            
                    <h2>√탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다. </h2>


                    <div class="go">
                        <div class="space1"></div>
                        <button type="button" onclick="location.href='main.jsp'" class="btn1">Apply</button>
                        <div class="space2"></div>
                        <button type="button" onclick="location.href='main.jsp'" class="btn2">Cancel</button>
                    </div>

            </section>
        </aside>


    </div>
</body>
</html>