package prodotti;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * form onSubmit="Ricerca"
 * input type text
 * submit button
 * 
 * 
 * */


@WebServlet("/Ricerca")
public class RicercaServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession sessione = request.getSession();
			ArrayList<ProductBean> prodotti = new ArrayList<ProductBean>();
			String filtro= request.getParameter("filter");
			if(filtro == null)	sessione.setAttribute("filter", "");
			else sessione.setAttribute("filter", filtro);
			
			
		
			if(sessione.getAttribute("products") == null) {
				ProductDaoDataSource source = new ProductDaoDataSource();
				try {
					prodotti =(ArrayList<ProductBean>) source.doRetrieveAll("");
				} catch (SQLException e) {}	
			}
			
		
		response.sendRedirect("http://localhost/CoinVerter/shop.jsp");
		}
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
		}
}