package prodotti;

import java.io.Serializable;
import java.sql.Blob;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int code;
	String name;
	float price;
	Integer quantity;
	ProductType tipo;
	Blob foto;
	boolean available;

	public ProductBean() {
		price = -1;
		quantity = -1; 
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


	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	public String getType() {
		return tipo.toString();
	}

	public int setType(String tipo) {
		for(ProductType prod : ProductType.values()) {
			if(tipo.equals(prod.toString()))this.tipo = ProductType.valueOf(tipo);
			return 0;
		}
		return -1;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
		
	}

	

	public Blob getFoto() {
		return foto;
	}

	public void setFoto(Blob foto) {
		this.foto = foto;
	}
	
	
	

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	@Override
	public String toString() {
		return "ProductBean [code=" + code + ", name=" + name + ", price=" + price + ", quantity=" + quantity
				+ ", tipo=" + tipo + "]";
	}

	

	
}
