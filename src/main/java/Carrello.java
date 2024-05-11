
import java.util.ArrayList;
import java.util.List;
//carrello dovrà essere in grado di contenere sia le valute che le carte
// rendi generico usando T extends Product (va sviluppata l'interfaccia product)


public class Carrello {

	private List<T extends product> products;
	
	public Carrello() {
		products = new ArrayList<Object>();
	}
	
	public void addProduct(Object product) {
		products.add(product);
	}
	
	public void deleteProduct(Object product) {
		for(Object prod : products) {
			if(prod.getCode() == product.getCode()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public List<T> getProducts() {
		return  products;
	}
}
