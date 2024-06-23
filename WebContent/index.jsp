<!DOCTYPE html>
<html lang="it" dir="ltr">

<head>
<script type="text/javascript" src="JS/scripts.js"></script>
  <link rel="shortcut icon" type="image/gif" href="img/logo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale = 1, width = device-width">
  <link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/light.css">

  <title>CoinVerter</title>
</head>

<body onresize="switchSuite()" onload="switchSuite()">
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

  <!-- <script>
    function switchLogo() {
      var logo = document.getElementById('logo');
      var logoSrc = window.innerWidth <= 850 ? 'img/logo.png' : 'img/logoName.png';
      logo.src = logoSrc;
    }
    window.addEventListener('load', switchLogo);
    window.addEventListener('resize', switchLogo);
    
    function Ricerca(){
    	let filtro = document.getElementById("inputbar").value;
    	sessionStorage.setItem("filter",filtro);	 
  </script> -->
  
  <jsp:include page='header.jsp'>
  		<jsp:param name = "PageTitle" value="index"/>
  </jsp:include>

  <!-- <header id="header-block">
    <section>
      <div id="container">
        <div id="logoBox"><img id="logo" src='' alt=""></div>
        <div id="collection">
          <div id="shop"><a href="Shop"> SHOP </a></div>
        </div>
        <div class="searchContainer">
          <img id="searchIcon" src="img/icon/iconSearch.png" alt="">
          <button id="searchBtn">
            <img id="searchIconBtn" src="img/icon/iconSearch.png" alt="" isOpenSearchbar>
          </button>
          <input type="text" id="input" name="searchBox" placeholder="Search...">
          implementare lmodo per inviare la ricerca
        </div>
        <div id="toggle">
          <div id="loginButton" class="cartContainer" onclick="checkLogin(user)">
            <div class="position">
              <img class="icon" src="img/icon/iconUser.png" alt="">
              implementare lo switch dell'icona quando l'utente è loggato
              <span class="caption">LOGIN</span>
            </div>
          </div>
          <div class="cartContainer">
            <div class="position">
              <div class="badge yellow"> 0 </div>
              <a href="cart.html"><img class="icon" src="img/icon/iconCart.png" alt=""></a>
              <span class="caption">CART</span>
            </div>
          </div>
          <div class="cartContainer" isOpenSidebar>
            <div class="position">
              <img class="icon" src="img/icon/iconWallet.png" alt="">
              <span class="caption">WALLET</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  </header> -->
	
 <!--  <div class="searchbar" hidden>
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
  </div> -->

  <!-- <script>
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
      const closeSearchbar = document.querySelector(".searchbar .sBtn");
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



    /*
    checkLogin(obj){
      if(obj == null)window.location.replace("Coinverter/login.jsp");
    }
    */
  </script> -->

  <main class="bgPage">
    <div class="bg">
      <div class="flexContainer">
        <div class="flexbox" >
         	b1
        </div>
        <div class="flexbox">
          b2
        </div>
        <div class="flexbox">
          b3
        </div>
        <div class="flexbox">
          b4
        </div>
      </div>
    </div>
  </main>
  <div class="toTop">
      <a href="#" class="topBtn">
        <img src="img/icon/up.png" alt="">
      </a>
  </div>
  
<jsp:include page="footer.html"/>


  
</body>
</html>