<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,prodotti.ProductBean"%>


<%
	HttpSession sessione = request.getSession();
	ArrayList<ProductBean> prodotti = (ArrayList<ProductBean>)sessione.getAttribute("prd");
	

	if(prodotti==null || prodotti.isEmpty()){
		response.sendRedirect(request.getContextPath()+"/ProdottiAD");
		return;
	}
%>


<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/gif" href="img/logo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale = 1, width = device-width">
  <link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/light.css">
  <script src="JS/scripts.js"></script>

<title>Insert title here</title>
</head>


<body onload="consoleText(['Hi, Admin.', 'Choose what you want to do'], 'text', ['tomato', 'rebeccapurple'])" onresize="brutta()">
   <jsp:include page='adminHeader.jsp'></jsp:include>
 
  <main class="bgPage">
    <div class="bg">
      <section>
        <div class="container">
            <!-- items -->
			<%for(ProductBean p : prodotti){%>
            <div class="itemContainer">
              <div class="cart-item">
                <div class="row">
                  <div class="imgContainer center-item">
                    <img id="pImg" src="img/icon/iconUser.png" alt="">
                  </div>
                  
                  <h5><%=p.getCode()%></h5><h5><%=p.getName()%></h5><h5><%=p.getQuantity()%></h5><h5><%=p.getPrice()%></h5><h5><%=p.getType()%></h5>
                  <div class="right">
                  <div class="dataContainer center-item">
                  	<div class="modifyBtn">
                  		<img src="img/icon/iconTrash.png" alt="" class="remove-item">
                  	</div>
                  	<div class="modifyBtn">
                  		<img src="img/icon/iconTrash.png" alt="" class="remove-item">
                  	</div>
                  </div>
                 </div>
                </div>
              </div>
            </div>
			 <% }%>
          </div>
      </section>
    </div>
    <script src="app.js"></script>
  </main>
</body>
</html>