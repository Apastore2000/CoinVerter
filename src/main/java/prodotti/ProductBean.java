package prodotti;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int code;
	String name;
	int price;
	Integer quantity;
	ProductType tipo;

	public ProductBean() {
		code = -1;
		name = "";
		quantity = 0;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getTipo() {
		return tipo.toString();
	}

	public void setTipo(ProductType tipo) {
		this.tipo = tipo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		if(tipo.equals(ProductType.valuta)) this.quantity = null;
		else this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "ProductBean [code=" + code + ", name=" + name + ", price=" + price + ", quantity=" + quantity
				+ ", tipo=" + tipo + "]";
	}

	

	
}
