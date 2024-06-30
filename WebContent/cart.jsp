<!DOCTYPE html>
<html lang="it" dir="ltr"> 
<%@ page import="coin.Carrello" %>
<%
	Carrello c = (Carrello)request.getSession().getAttribute("cart"); 
	if(c == null) c = new Carrello(); %>
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
          <%if(c.getCount()==0){ %>
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
			<%}else{ %>
            <!-- items -->

            <div class="itemContainer">
              <div class="cart-item">
                <div class="row">
                  <div class="imgContainer center-item">
                    <img id="pImg" src="img/logo.png" alt="">
                  </div>
                    <h5 class="itemName">iPhone 11 128GB Black( $1219 )</h5>
                  <div class="right">
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
            <%} %>
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