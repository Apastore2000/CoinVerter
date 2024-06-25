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
  <%if(prodotti.size()<=3 || prodotti.size()<=5){%>
  <link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/shop.css">
  <%} %>
  <title>CoinVerter</title>
</head>

<body id="" onresize="switchSuite()" onload="switchSuite()">
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
  		<jsp:param name = "PageTitle" value="shop"/>
  </jsp:include>
  
  

  

  
  <main class="bgPage">
  <div class="bgshop">
   	 <section>
      <div class="menuBar">
        <header>
          <h4>CATEGORIE</h4>
          <img id="closeBtn" class="icon" src="img/icon/iconX.png" alt="">
        </header>

        <div class="category">
          <div class="categoryItem">
            <a class="selectionMenu">
              <img class="categoryIcon" src="img/icon/iconCurrency.png" alt="">Valute
            </a>
          </div>
          <div class="categoryItem">
            <a class="selectionMenu">
              <img class="categoryIcon" src="img/icon/iconCrypto.png" alt="">Cryptovalute
            </a>
          </div>
          <div class="categoryItem">
            <a class="subMenuBtn">
              <img class="categoryIcon" src="img/icon/iconCard.png" alt="">Card
              <img class="dropdown" src="img/icon/right.png" alt="">
            </a>
            <div class="subMenu">
              <a class="subItem" href="">Carte</a>
              <a class="subItem" href="">Ricariche</a>
              <a class="subItem" href="">Gift Card</a>
            </div>
          </div>
           <!--<div class="megaPezza"></div>-->
        </div>
      </div>
    </section>
    
    
    <div class="bgShop">
      <section class="shop">
      	
          <div class="headerShopContainer">
            <div class="menuBtn">
          		<img src="img/icon/iconUser.png" alt="">
        	</div>
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
           

          </div>
        
      </section>
       </div>

  </main>

  <script>
    const subMenu = document.querySelector('.sub-menu ul').hide();
    subMenu.addEventListener(".sub-menu a").click(function () {
      subMenu(this).parent(".sub-menu").children("ul").slideToggle("100");
      subMenu(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
    });
  </script>

  <jsp:include page='footer.html'></jsp:include>
  
  <!--Jquery-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script>
    $(document).ready(function () {
      // expand/collapse menuBar
      $('.menuBtn').click(function () {
        $('.menuBar').addClass('active');
        $('.menuBtn').css("visibility", "hidden");
      });

      //close
      $('#closeBtn').click(function () {
        $('.menuBar').removeClass('active');
        $('.menuBtn').css("visibility", "visible");
      })

      //subMenu
      $('.subMenuBtn').click(function () {
        $(this).next('.subMenu').slideToggle();
        $(this).find('.dropdown').toggleClass('rotate');
      });
    });
  </script>
  
</body>

</html>