<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wemade</title>

    <meta property="og:type" content="website" />
    <meta property="og:site_name" content="wemade" />
    <meta property="og:title" content="wemade" />
    <meta property="og:description" content="정성으로 빗는 wemade" />
    


    <!-- reset.css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">    
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Song+Myung&display=swap" rel="stylesheet">
    <!--material design(구글 아이콘) 
        https://material.io/develop/web/getting-started -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!-- main.css -->
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/main.css">

    <!-- lodash.js 부하 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.20/lodash.min.js" integrity="sha512-90vH1Z83AJY9DmlWa8WkjkV79yfS2n2Oxhsi2dZbIv0nC4E6m5AbH8Nh156kkM7JePmqD6tcZsfad1ueoaovww==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- gsap.js 애니메이션&ScrollToPlugin 라이브러리-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js" integrity="sha512-UxP+UhJaGRWuMG2YC6LPWYpFQnsSgnor0VUF3BHdD83PS/pOpN+FYbZmrYN+ISX8jnvgVUciqP/fILOXDjZSwg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/ScrollToPlugin.min.js" integrity="sha512-1OG9UO4krPizjtz/c9iDbjCqtXznBYdJeD4ccPaYfJHzC6F1qoQ3P1bgQ3J8lgCoK5qGVCqsY4+/RKjLDzITVQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!--swiper.js-->  
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!--scrollmagic.js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- defer: html문서 해석 후 -->
    <script defer src="/resources/js/common.js"></script>
    <script defer src="/resources/js/main.js"></script>

</head>
<body>
    <!-- HEADER -->
        <header>
            <div class="inner">
                <a href="/" class="logo">
                    <img src="/resources/img/icon.png" alt="wemade" class="logo">
                </a>
			<div class="bar">
				<ul>
				<c:set var = "session" scope = "session" value = "${ sessionName}"/>
			<c:choose>
					<c:when test="${empty session}">
						<li><a href="/my/login"><img src="/resources/img/icon_login.png" alt="login" id="login" class="logo"></a></li>
					</c:when>
					<c:otherwise>
					<li id="sessionUser">${sessionName}님</li>
					<div id="userContent">
						<div id="personal" ><a href="/my/user">▶ 개인정보 수정</a></div>
						<div id="personalorder"><a href="/my/order">▶ 주문내역</a></div>
					</div>
					<li><a href="/my/logout"><img src="/resources/img/icon_logout.png" alt="logout" id="logout" class="logo"></a></li>
				    </c:otherwise>
			</c:choose>

					<li><a href="/store/list"><img src="/resources/img/icon_store.jpg" alt="store" id="store" class="logo"></a></li>
					
				</ul>
			</div>
              

            </div>

            <div class="badges">
                <div class="badge">
                    <img src="/resources/img/badge1.jpg" alt="Badge">
                </div>
                <div class="badge">
                    <img src="/resources/img/badge2.jpg" alt="Badge">
                </div>
            </div>

        </header>

        <!--VISUAL-->
        <section class="visual">
          <div class="inner">
            <div class="title fade-in">
              <img src="/resources/img/visual_wemade_re.png" alt="WEMADE">
            </div>
            
            <div class="fade-in">
              <img src="/resources/img/bread1_remove.png" alt="bread1_remove" class="cup1 image">
          
            <div class="fade-in">
              <img src="/resources/img/bread2_remove.png" alt="bread2_remove" class="cup2 image">
           
            </div>
            <div class="fade-in">
              <img src="/resources/img/visual_spoon.png" alt="Spoon" class="spoon">
            </div>
          </div>
        </section>


        <section class="notice">
          <div class="notice-line">
            <div class="bg-left"></div>
            <div class="bg-right"></div>
            <div class="inner">
              <div class="inner__left">
                <h2>공지사항</h2>
                <div class="swiper-container">
                  <div class="swiper-wrapper">
               
                    <div class="swiper-slide">
                      <a href="javascript:void(0)">[당첨자 발표] 2023 wemade 플래너 이벤트</a>
                    </div> 
                    <div class="swiper-slide">
                      <a href="javascript:void(0)">wemade 애플리케이션 버전 업데이트 안내</a>
                    </div> 
                    <div class="swiper-slide">
                      <a href="javascript:void(0)">[당첨자 발표] 리뷰 이벤트</a>
                    </div>  
                  </div>
                </div>
          
              </div>
              
          </div>
        </div>

        <div class="promotion">
          <div class="promotion_title">
          	이달의 신상
          </div>
          
          <div class="swiper-container">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <img src="/resources/img/promotion_slide1.jpg" alt="위메이드신상1">
               
              </div>
              <div class="swiper-slide">
                <img src="/resources/img/promotion_slide2.jpg" alt="위메이드신상2">
                
              </div>
              <div class="swiper-slide">
                <img src="/resources/img/promotion_slide3.jpg" alt="위메이드신상3">
              
              </div>
              <div class="swiper-slide">
                <img src="/resources/img/promotion_slide4.jpg" alt="위메이드신상4">
               
              </div>
              <div class="swiper-slide">
                <img src="/resources/img/promotion_slide5.jpg" alt="위메이드신상5">
        
              </div>
            </div>
          </div>

          <div class="swiper-pagination"></div>
          <div class="swiper-prev">
            <div class="material-icons">arrow_back</div>
          </div>
          <div class="swiper-next">
            <div class="material-icons">arrow_forward</div>
          </div>
        </div>
        </section>




        <!--AWARDS-->
        <section class="awards">
          <div class="inner">
            <div class="swiper-container">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide1.jpg" alt="">
                </div>
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide2.jpg" alt="">
                </div>
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide3.jpg" alt="">
                </div>
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide4.jpg" alt="">
                </div>
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide5.jpg" alt="">
                </div>
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide6.jpg" alt="">
                </div>
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide7.jpg" alt="">
                </div>
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide8.jpg" alt="">
                </div>
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide9.jpg" alt="">
                </div>
                <div class="swiper-slide">
                  <img src="/resources/img/awards_slide10.jpg" alt="">
                </div>
              </div>
            </div>

            <div class="swiper-prev">
              <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
              <div class="material-icons">arrow_forward</div>
            </div>
          </div>
        </section>


        <!--FOOTER-->
        <footer>
          <div class="inner">
            <ul class="menu">
              <li><a href="javascript:void(0)" class="green">개인정보처리방침</a></li>
              <li><a href="javascript:void(0)">영상정보처리기기 운영관리 방침</a></li>
              <li><a href="javascript:void(0)">홈페이지 이용약관</a></li>
              <li><a href="javascript:void(0)">위치정보 이용약관</a></li>
              <li><a href="javascript:void(0)">위메이드 카드 이용약관</a></li>
              <li><a href="javascript:void(0)">윤리경영 핫라인</a></li>
            </ul>
            <div class="btn-group">
              <a href="javascript:void(0)" class="btn btn--white">찾아오시는 길</a>
              <a href="javascript:void(0)" class="btn btn--white">신규입점제의</a>
              <a href="javascript:void(0)" class="btn btn--white">사이트 맵</a>
            </div>

            <div class="info">
              <span>사업자등록번호 202-10-01239</span>
              <span>(주)위메이드 대표이사 우연경</span>
              <span>TEL : 02) 7390-2022 / FAX : 02) 7390-2023</span>
            </div>

            <p class="copyright">
              &copy; <span class="this-year"></span> wemade
            </p>
    
          </div>
        </footer>


        <!--ToTopArrow-->
        <div id="to-top">
          <div class="material-icons">arrow_upward</div>
        </div>



</body>
</html>
