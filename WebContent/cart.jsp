<!DOCTYPE html>
<html lang="it" dir="ltr"> 
<%@ page import="coin.Carrello,java.util.ArrayList,prodotti.ProductBean,java.text.DecimalFormat" %>
<%
	double totale = 0.00;
	DecimalFormat df = new DecimalFormat("#.##");

	Carrello c = (Carrello)request.getSession().getAttribute("cart"); 
	ArrayList<ProductBean> prodotti = new ArrayList<ProductBean>();
	if(c != null) prodotti = c.getProducts();
	if(c == null) c = new Carrello(); 
	
	%>
<head>
  <link rel="shortcut icon" type="image/gif" href="img/logo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale = 1, width = device-width">
  <link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/light.css">
  <%if(prodotti.size()<=3){%>
  	<link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/cartLow.css">
  <%}else{%>
  	<link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/cartHigh.css">
  <%} %>
	
  <title>CoinVerter</title>
</head>

<body onresize="switchLogo()" onload="switchLogo()">

	<jsp:include page='header.jsp'>
  		<jsp:param name = "PageTitle" value="cart"/>
  </jsp:include>
  
  <main class="bgPage">
    <div class="bg">
      <section>
        <div class="container">
          <div class="cartHeaderContainer">
            <a class="btnBack" href="shop.jsp">               
              <div id="btnBackContainer"><img src="img/icon/iconBack.png"><span class="btnBack-txt">SHOP</span></div>
            </a>
            <h2 id="title" class="cartHeader">IL MIO CARRELLO</h2>
          </div>
          <div class="cart">
          <%if(c.getCount()==0){ %>
            <!-- empty cart placeholder -->
            <div class="cart">
            <div class="itemContainer" id="empty-cart-message">
              <div class="cart-item">
                <div class="row">
                  <div class="imgContainer center-item">
                    <h5>Il tuo carrello � vuoto</h5>
                  </div>
                  <div class="dataContainer center-item">
                    <h5>Non ci sono articoli nel tuo carrello. Torna al negozio e aggiungi alcuni!</h5>
                  </div>
                </div>
              </div>
            </div>
           </div>
			  <%}else{ 
			  	for(ProductBean b : prodotti){
			 		totale += b.getPrice();%>
            <!-- items -->

            <div class="itemContainer">
              <div class="cart-item">
                <div class="row">
                  <div class="imgContainer center-item">
                    <img id="pImg" src="img/logo.png" alt="">
                  </div>
                  <h5 class="itemName"><%=b.getName()%></h5>
                  <h5>&#128; <span id="price"><%=df.format(b.getPrice())%></span></h5>
                  <div class="last">
                    <div class="dataContainer center-item">
                      <div class="modifyBtn">
                        <a href="CartServlet?id=<%=b.getCode()%>&action=remove"><img src="img/icon/iconTrash.png" alt="" class="removeItem"></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <%} %>

            <div class="itemContainer">
              <div class="cart-item">
                <div class="row">
                  <div class="generiContainer">
                    <h5>Total:</h5>
                  </div>
                  <div class="generiContainer status">
                    <h5>&#128; <span id="totalPrice"><%=df.format(totale)%></span></h5>
                  </div>
                </div>
              </div>
              <div class="CheckOutContainer">
                <a href="Checkout" type="button" class="checkOutBtn">Check Out</a>
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