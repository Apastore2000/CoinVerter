<%@ page import="prodotti.ProductBean" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/gif" href="img/logo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale = 1, width = device-width">
  <link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/light.css">
	
  <title>CoinVerter Modifica Prodotti</title>
<%ProductBean prod = new ProductBean(); %>
</head>
<body class="bgPage">
    <div class="modifyPage">
    <form class="modify">
        <label class="label" for="numero">Numero non editabile:</label>
        <input class="input" type="text" id="numero" name="numero" value="<%=prod.getCode()%>" readonly><br>
        <label class="label" for="nome">Nome:</label>
        <input class="input" type="text" id="nome" name="nome" value="<%=prod.getCode()%>"><br>
        <label class="label" for="valore">Valore numerico:</label>
        <input class="input" type="number" id="valore" name="valore" value="<%=prod.getCode()%>"><br>
        <label class="label" for="stringa">Altra stringa editabile:</label>
        <select id="stringa" name="stringa">
            <option value="valuta" <%if(prod.getType().equals("valuta"))%>selected<%%>  >Valuta</option>
            <option value="crypto"<%if(prod.getType().equals("valuta"))%>selected<%%>  >Cryptovaluta</option>
            <option value="ricarica"<%if(prod.getType().equals("valuta"))%>selected<%%>  >Ricarica Card</option>
            <option value="moneta" <%if(prod.getType().equals("valuta"))%>selected<%%>  >Valuta di gioco</option>
        </select>
        <label class="label" for="si-no">Si/No:</label><br>
        <input class="input" type="radio" id="si" name="si-no" value="si"> <label for="si">Si</label>
        <input class="input" type="radio" id="no" name="si-no" value="no"> <label for="no">No</label><br>
        <input class="input" type="submit" value="Invia">
    </form>
    </div>    
</body>
</html>