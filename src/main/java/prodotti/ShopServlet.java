package prodotti;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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


@WebServlet("/Shop")
public class ShopServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession sessione = request.getSession();
			String filtro = (String) request.getParameter("filter");
			System.out.print(filtro);
			ArrayList<ProductBean> prodotti = new ArrayList<ProductBean>();
			ProductDaoDataSource source = new ProductDaoDataSource();
			
			try {
				if(filtro != null && filtro.length() != 0) {
					prodotti = source.doRetrieveByName(filtro);
				}else {
					prodotti = source.doRetrieveAll("");
				}
			} catch (SQLException e) {
			e.printStackTrace();
			}finally {
			
			sessione.setAttribute("products", prodotti);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/shop.jsp");
	        dispatcher.forward(request, response);
			}
		}
		
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
		}
}