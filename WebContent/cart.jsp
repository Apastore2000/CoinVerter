<!DOCTYPE html>
<html lang="it" dir="ltr"> 

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
	
	<jsp:include page='header.jsp'>
  		<jsp:param name = "PageTitle" value="cart"/>
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
    <div class="bg">
      <section>
        <div class="container">
          <div class="cartHeaderContainer">
            <a class="btnBack" href="shop.html">               
              <div id="btnBackContainer"><img src="img/icon/iconBack.png"><span class="btnBack-txt">BACK TO SHOP</span></div>
            </a>
            <h2 id="title" class="cartHeader">My shopping cart</h2>
          </div>
          <div class="cart">
            <!-- empty cart placeholder -->
            <div class="itemContainer" id="empty-cart-message" style="display: none;">
              <div class="cart-item">
                <div class="row">
                  <div class="imgContainer center-item">
                    <img src="img/product/empty.png" alt="">
                    <h5>Il tuo carrello è vuoto</h5>
                  </div>
                  <div class="dataContainer center-item">
                    <h5>Non ci sono articoli nel tuo carrello. Torna al negozio e aggiungi alcuni!</h5>
                  </div>
                </div>
              </div>
            </div>

            <!-- items -->

            <div class="itemContainer">
              <div class="cart-item">
                <div class="row">
                  <div class="imgContainer center-item">
                    <img src="img/icon/iconUser.png" alt="">
                    <h5>iPhone 11 128GB Black( $1219 )</h5>
                  </div>
                  <div class="dataContainer center-item">
                    <div class="input-group number-spinner">
                      <button id="left" id="phone-minus" class="btn btn-default"><img id="iconQta"
                          src="img/icon/iconSubtract.png" alt=""></button>
                      <input id="phone-number" type="number" min="0" class="form-control" value="1">
                      <button id="right" id="phone-plus" class="btn btn-default"><img id="iconQta"
                          src="img/icon/iconPlus.png" alt=""></button>
                    </div>
                    <h5>$<span id="phone-total">1219</span></h5>
                    <img src="img/icon/iconTrash.png" alt="" class="remove-item">
                  </div>
                </div>
              </div>
            </div>

            <div class="itemContainer">
              <div class="cart-item">
                <div class="row">
                  <div class="generiContainer">
                    <h5>Subtotal: </h5>
                    <h5>shipping:</h5>
                    <h5>Total:</h5>
                  </div>
                  <div class="generiContainer status">
                    <h5>$<span id="sub-total">1,278</span></h5>
                    <h5>$<span id="tax-amount">0</span></h5>
                    <h5>$<span id="total-price">1,278</span></h5>
                  </div>
                </div>
              </div>
              <div class="CheckOutContainer">
                <button type="button" class="btn check-out">Check Out</button>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    <script src="app.js"></script>
  </main>

	<jsp:include page= "footer.html"></jsp:include>
  
  <script type="text/javascript" src="JS/scripts.js"></script>
</body>

</html>