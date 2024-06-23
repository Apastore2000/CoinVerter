<!DOCTYPE html>
<html lang="it" dir="ltr">
<%@ page import="java.util.ArrayList,prodotti.ProductBean" %>
<%
	HttpSession sessione = request.getSession();
	ArrayList<ProductBean> prodotti = (ArrayList<ProductBean>)sessione.getAttribute("products");
	if(prodotti==null || prodotti.isEmpty()){
		response.sendRedirect(request.getContextPath()+"/Shop");
		return;
	}
%>

<head>
  <link rel="shortcut icon" type="image/gif" href="img/logo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale = 1, width = device-width">
  <link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/light.css">

  <title>CoinVerter</title>
</head>

<body onresize="switchLogo()" onload="switchLogo()">
  <!--  <script type="text/javascript">
        var setTheme = localStorage.getItem('theme')
        console.log('theme:', setTheme)

        if (setTheme == null){
          swapStyle('CSS/light.css')
  
        }else{
          swapStyle(setTheme)
        }
  
        function swapStyle(sheet){
          document.getElementById('mystylesheet').href = sheet
          localStorage.setItem('theme', sheet)
        }
    </script>-->

  <!--Header-->

  <script>
    function switchLogo() {
      var logo = document.getElementById('logo');
      var logoSrc = window.innerWidth <= 850 ? 'img/logo.png' : 'img/logoName.png';
      logo.src = logoSrc;
    }
    window.addEventListener('load', switchLogo);
    window.addEventListener('resize', switchLogo);
  </script>
	
	<jsp:include page='header.jsp'>
  		<jsp:param name = "PageTitle" value="shop"/>
  </jsp:include>
  
  

  <div class="searchbar" hidden>
    <div class="searchbarOverlay"></div>
    <div class="searchbarContent">
      <div class="searchbarBody">
        <input type="text" id="inputbar" name="searchBox" placeholder="Search...">
        <button class="sBtn" id="close"><img class="icon" src="img/icon/iconX.png" alt=""></button>
      </div>
      <button class="sBtn"><img class="icon" src="img/icon/iconSearch.png" alt=""></button>
    </div>
  </div>

  <div class="sidebar" hidden>
    <div class="sidebarOverlay"></div>
    <div class="sidebarContent">
      <div class="sidebarHeader">
        <h4>WALLET</h4>
        <img class="icon" src="img/icon/iconX.png" alt="">
      </div>
      <div class="sidebarBody">

      </div>
    </div>
  </div>

  <script>
    function openSidebar() {
      const isSidebar = document.querySelector("[isOpenSidebar]");
      const sidebar = document.querySelector(".sidebar");
      const sidebarOverlay = document.querySelector(".sidebarOverlay");
      const closeSidebar = document.querySelector(".sidebarHeader .icon");

      isSidebar.addEventListener("click", (e) => {
        console.log("Clicked sidebar toggle");
        if (sidebar.classList.contains("show")) {
          sidebar.classList.remove("show");
          sidebar.classList.add("hidden");
        }
        else {
          sidebar.classList.add("show");
          sidebar.classList.remove("hidden");
        }
      });

      sidebarOverlay.addEventListener("click", (e) => {
        console.log("Clicked sidebar overlay");
        sidebar.classList.remove("show");
        sidebar.classList.add("hidden");
      });

      closeSidebar.addEventListener("click", (e) => {
        console.log("Clicked close sidebar button");
        sidebar.classList.remove("show");
        sidebar.classList.add("hidden");
      });
    }
    openSidebar();
  </script>

  <script>
    function openSearchbar() {
      const isSearchbar = document.querySelector("[isOpenSearchbar]");
      const searchbar = document.querySelector(".searchbar");
      const searchbarOverlay = document.querySelector(".searchbarOverlay");
      const closeSearchbar = document.querySelector(".searchbar .btn");
      //const btn =  document.querySelector("#searchBtn");

      isSearchbar.addEventListener("click", (e) => {
        console.log("Clicked sidebar toggle");
        if (searchbar.classList.contains("show")) {
          searchbar.classList.remove("show");
          searchbar.classList.add("hidden");
          //btn.classList.add("show");
          //btn.classList.remove("hidden");
        }
        else {
          searchbar.classList.add("show");
          searchbar.classList.remove("hidden");
          //btn.classList.remove("show");
          //btn.classList.add("hidden");
        }
      });

      searchbarOverlay.addEventListener("click", (e) => {
        console.log("Clicked searchbar overlay");
        searchbar.classList.remove("show");
        searchbar.classList.add("hidden");
        //btn.classList.add("show");
        //btn.classList.remove("hidden");
      });

      closeSearchbar.addEventListener("click", (e) => {
        console.log("Clicked close searchbar button");
        searchbar.classList.remove("show");
        searchbar.classList.add("hidden");
        //btn.classList.add("show");
        //btn.classList.remove("hidden");
      });

    }
    openSearchbar();

    function closeSearchbar() {
      const searchbar = document.querySelector(".searchbar");
      //const btn =  document.querySelector("#searchBtn");
      searchbar.classList.remove("show");
      searchbar.classList.add("hidden");
      //btn.classList.add("hidden");
    }
    function checkWindowWidth() {
      const searchbar = document.querySelector(".searchbar");
      if (window.innerWidth > 850 && searchbar.classList.contains("show")) {
        closeSearchbar();
      }
    }
    window.addEventListener("resize", checkWindowWidth);
    checkWindowWidth();
  </script>

  <main class="bgPage">
     <!--<nav class='animated bounceInDown'>
        <ul>
          <li class='sub-menu'><a href="">Valute<div class='fa fa-caret-down right'></div></a>
            <ul>
              <li><a href='#settings'>Fisica</a></li>
              <li><a href='#settings'>Digitale</a></li>
            </ul>
          </li>
          <li class='sub-menu'><a href='#message'>carte<div class='fa fa-caret-down right'></div></a>
            <ul>
              <li><a href='#settings'>Card</a></li>
              <li><a href='#settings'>Gift Card</a></li>
            </ul>
          </li>
        </ul>
      </nav>-->
      <section class="shop">
          <div class="headerShopContainer">
            <h2>
              Our <span>products</span>
            </h2>
          </div>
          
          <div class="shopRow">
			<% 
			if(prodotti.isEmpty()){%>
				<h1>ARRAYLIST PRODOTTI VUOTO</h1>	
			<%}
			for(ProductBean p : prodotti){ %>
            <div class="shopItem">
              <div class="itemBox">
                <div class="optionContainer">
                  <div class="options">
                    <a href="" class="option">
                      Aggiungi al carrello
                    </a>
                  </div>
                </div>
                <div class="imgShopContainer">
                  <img src="img/icon/iconUser.png" alt="">
                </div>
                <div class="detailBox">
                  <h5>
                    <%= p.getName() %>
                  </h5>
                  <h6>
                    <%= p.getPrice() %>
                  </h6>
                </div>
              </div>
            </div>
            <%}%>
              <%-- <div class="shopItem">
                <div class="itemBox">
                  <div class="optionContainer">
                    <div class="options">
                      <a href="" class="option">
                        Add To Cart
                      </a>
                    </div>
                  </div>
                  <div class="imgShopContainer">
                    <img src="img/icon/iconUser.png" alt="">
                  </div>
                  <div class="detailBox">
                    <h5>
                      <%prodotti.get(0).getName(); %>
                    </h5>
                    <h6>
                      <%prodotti.get(0).getPrice(); %>
                    </h6>
                  </div>
                </div>
              </div>
			--%>
            <div class="shopItem">
              <div class="itemBox">
                <div class="optionContainer">
                  <div class="options">
                    <a href="" class="option">
                      Add To Cart
                    </a>
                  </div>
                </div>
                <div class="imgShopContainer">
                  <img src="img/icon/iconUser.png" alt="">
                </div>
                <div class="detailBox">
                  <h5>
                    Women's Dress
                  </h5>
                  <h6>
                    $68
                  </h6>
                </div>
              </div>
            </div>

			<%--
              <div class="shopItem">
                <div class="itemBox">
                  <div class="optionContainer">
                    <div class="options">
                      <a href="" class="option">
                        Add To Cart
                      </a>
                    </div>
                  </div>
                  <div class="imgShopContainer">
                    <img src="img/icon/iconUser.png" alt="">
                  </div>
                  <div class="detailBox">
                    <h5>
                      Women's Dress
                    </h5>
                    <h6>
                      $68
                    </h6>
                  </div>
                </div>
              </div> --%>

          </div>
      </section>

  </main>

  <script>
    const subMenu = document.querySelector('.sub-menu ul').hide();
    subMenu.addEventListener(".sub-menu a").click(function () {
      subMenu(this).parent(".sub-menu").children("ul").slideToggle("100");
      subMenu(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
    });
  </script>

  <footer>
    <div class="footerContainer">
      <div class="footerFlexbox">
        <img id="footerLogo" src="img/logoName.png" alt="">
      </div>
      <div class="footerFlexbox">
        <div class="menu">
          <ul>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </div>
      </div>
      <div class="footerFlexbox">
        <div class="social">
          <a href="" target="_blank"><img src="img/social/insta.png" alt=""></a>
          <a href="" target="_blank"><img src="img/social/x.png" alt=""></a>
          <a href="" target="_blank"><img src="img/social/youtube.png" alt=""></a>
          <a href="" target="_blank"><img src="img/social/linkedin.png" alt=""></a>
        </div>
      </div>
    </div>
    <div class="toTop">
      <a href="index.jsp" class="topBtn">
        <img src="img/up.png" alt="">
      </a>
    </div>
  </footer>
</body>

</html>