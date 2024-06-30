package coin;

import java.io.IOException;
import prodotti.ProductBean;
import utenti.User;

import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessione = request.getSession();
		User utente =(User) sessione.getAttribute("user");
		if(utente == null){
		response.sendRedirect("login.jsp");
		return;
		}
		Carrello c = (Carrello)sessione.getAttribute("cart");
		ArrayList<ProductBean> prodotti = c.getProducts();
		for(ProductBean p : prodotti) {
			if(p.getTipo().equals("valuta") ||p.getTipo().equals("crypto")) {
				utente.ricaricaPortafoglio(p.getName(), p.getPrice());
			}
		}
	
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
