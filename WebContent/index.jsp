<!DOCTYPE html>
<html lang="it" dir="ltr">
<%@ page import="coin.Carrello" %>
<%Carrello c = new Carrello(); 
	request.getSession().setAttribute("cart", c);
%>

<head>
<script type="text/javascript" src="JS/scripts.js"></script>
  <link rel="shortcut icon" type="image/gif" href="img/logo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale = 1, width = device-width">
  <link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/light.css">

  <title>CoinVerter</title>
</head>

<body onresize="switchSuite()" onload="switchSuite()">


  
  <jsp:include page='header.jsp'>
  		<jsp:param name = "PageTitle" value="index"/>
  </jsp:include>

 

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