package prodotti;

import java.io.IOException;
import prodotti.ProductBean;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManageProductServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String attività = request.getParameter("activity");
		ProductBean prodotto = new ProductBean();
		int id =Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("name");
		double prezzo = Double.parseDouble(request.getParameter("price"));
		int quantità = Integer.parseInt("quantity");
		
		if(attività != null) {
			if(attività == "add") {
				
				
			}
		}
	}
}