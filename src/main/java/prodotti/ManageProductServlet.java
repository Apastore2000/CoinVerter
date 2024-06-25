package prodotti;

import java.io.IOException;
import java.sql.SQLException;

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
		float prezzo = Float.parseFloat(request.getParameter("price"));
		int quantità = Integer.parseInt("quantity");
		boolean disponibile = Boolean.parseBoolean("available");
		String tipo = request.getParameter("type");
		ProductDaoDataSource source = new ProductDaoDataSource();
		
		if(attività != null) {
			switch(attività) {
				case "modify": 
				
					try {
						prodotto = source.doRetrieveByKey(id);
						if(nome != null && !nome.equals("")) prodotto.setName(nome);
						
						if(tipo != null) prodotto.setType(tipo);
					
						if(prezzo != -1) prodotto.setPrice(prezzo);
						
						prodotto.setAvailable(disponibile);
						
						//introdurre cambio foto
						
						if(prodotto.tipo == ProductType.carta && quantità > 0) prodotto.setQuantity(quantità);
						else prodotto.setQuantity(-1);
						
						source.doUpdate(prodotto);
						
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				case "add":
					try {	
						if(id > 0) prodotto.setCode(id);
						
						if(nome != null && !nome.equals("")) prodotto.setName(nome);
						
						if(tipo != null) prodotto.setType(tipo);
					
						if(prezzo != -1) prodotto.setPrice(prezzo);
						
						prodotto.setAvailable(disponibile);
						
						//introdurre cambio foto
						
						if(prodotto.tipo == ProductType.carta && quantità > 0) prodotto.setQuantity(quantità);
						else prodotto.setQuantity(-1);
						
						source.doSave(prodotto);
					
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
					
				case "remove":
					try {
						if(id > 0)source.doRemove(id);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				break;
			}//switch
		}
	}
}