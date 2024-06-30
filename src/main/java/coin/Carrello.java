package coin;

import prodotti.ProductBean;
import java.util.ArrayList;

//carrello dovrà essere in grado di contenere sia le valute che le carte
// rendi generico usando T extends Product (va sviluppata l'interfaccia product)


public class Carrello {

	private ArrayList<ProductBean> products;
	private int count;
	
	public Carrello() {
		products = new ArrayList<ProductBean>();
		count = 0;
	}
	
	public void addProduct(ProductBean product) {
		products.add(product);
		count += 1;
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				products.remove(prod);
				count -= 1;
				break;
			}
		}
 	}
	public int getCount(){
		return count;
	}
	
	public ArrayList<ProductBean> getProducts() {
		return products;
	}
}
