<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="utenti.User,coin.Carrello,prodotti.ProductBean"%>
 
<%
	String name = request.getParameter("PageTitle");
	String ref = new String();
	String link = new String();
	User user = (User)session.getAttribute("user");
	ProductBean p = new ProductBean();
	Carrello cart = new Carrello();
	cart.addProduct(p);
	
	switch(name){
	case "shop":
	case "cart":
		ref = "index.jsp";
		link = "HOME";		
		break;
	case "index": 
		ref = "Shop";
		link = "SHOP";
		break;
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="JS/scripts.js"></script>
<meta charset="UTF-8">
	
<title>Insert title here</title>
</head>
<body>

	<header id="header-block">
    <section>
      <div id="container">
        <div id="logoBox"><img id="logo" src='img/logoName.png' alt=""></div>
        <div id="collection">
          <div id="ref"><a href=<%=ref%>> <%=link%></a></div>
        </div>
        <div class="searchContainer">
          <img id="searchIcon" src="img/icon/iconSearch.png" alt="" onclick="Ricerca('big')">
          <button id="searchBtn" >
            <img id="searchIconBtn" onclick="openSearchbar(this.id)" src="img/icon/iconSearch.png" alt="" isOpenSearchbar>
          </button>
          <input type="text" id="input" name="searchBox" placeholder="Search...">
          <!--implementare lmodo per inviare la ricerca-->
        </div>
        
        <div id="toggle">
        <%if(user == null){ %>
          <div id="loginButton" class="cartContainer" onclick="checkLogin(user)">
            <div class="position">
              <img class="icon" src="img/icon/iconUser.png" alt="">
              <span class="caption">LOGIN</span>
            </div>
         </div>
         
          <div class="cartContainer">
           <div class="position">
             <img class="icon" src="img/icon/iconUser.png" alt="">
             <span class="caption">ADMIN</span>
           </div>
         </div>
            
        <%}else if(user != null && !user.isAdmin()){ %>
         <div id="loginButton" class="cartContainer" onclick="checkLogin(user)">
            <div class="position">
              <img class="icon" src="img/icon/iconUserLog.png" alt="">
              <span class="caption">LOGOUT</span>
            </div>
         </div>
               
        <%}else if (user != null && user.isAdmin()){ %>
         <div id="loginButton" class="cartContainer" onclick="checkLogin(user)">
            <div class="position">
              <img class="icon" src="img/icon/iconUserLog.png" alt="">
              <span class="caption">LOGOUT</span>
            </div>
         </div>
         
         <div class="cartContainer">
           <div class="position">
             <img class="icon" src="img/icon/iconUser.png" alt="">
             <span class="caption">ADMIN</span>
           </div>
         </div>
        <%} %>
          
          <div class="cartContainer">
            <div class="position">
              <div class="badge yellow"><%cart.getCount(); %>  </div>
              <a href="cart.jsp"><img class="icon" src="img/icon/iconCart.png" alt=""></a>
              <span class="caption">CART</span>
            </div>
          </div>
          
          <div class="cartContainer" onClick="openSidebar(this.id)" id="isOpenSidebar">
            <div class="position">
              <img class="icon" src="img/icon/iconWallet.png" alt="">
              <span class="caption">WALLET</span>
            </div>
          </div>
          
        </div>
      </div>
    </section>
  </header>
  
   <div id="sorciobarra" class="searchbar"  hidden>
    <div id="sorcioover" class="searchbarOverlay" onclick="openSearchbar(this.id)"></div>
    <div class="searchbarContent">
      <div class="searchbarBody">
        <input type="text" id="inputbar" name="searchBox" placeholder="Search...">
        <button onclick="openSearchbar(this.id)" class="sBtn" id="close"><img class="icon" src="img/icon/iconX.png" alt=""></button>
      </div>
      <button onclick="Ricerca('small')" class="sBtn"><img class="icon" src="img/icon/iconSearch.png" alt=""></button>
    </div>
  </div>

  <div id="sideb"  class="sidebar" hidden>
    <div id="sideover" onclick="openSidebar(this.id)" class="sidebarOverlay"></div>
    <div class="sidebarContent">
      <div class="sidebarHeader">
        <h4>WALLET</h4>
        <img onclick="openSidebar(this.id)" id="sidex" class="icon" src="img/icon/iconX.png" alt="">
      </div>
      <div class="sidebarBody">

      </div>
    </div>
  </div>


</body>
</html>