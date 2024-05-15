package coin;

import prodotti.ProductBean;
import java.util.ArrayList;
import java.util.List;
//carrello dovrà essere in grado di contenere sia le valute che le carte
// rendi generico usando T extends Product (va sviluppata l'interfaccia product)


public class Carrello {

	private List<ProductBean> products;
	
	public Carrello() {
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();
	}
	
	public void addProduct(ProductBean product) {
		products.add(product);
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
}
