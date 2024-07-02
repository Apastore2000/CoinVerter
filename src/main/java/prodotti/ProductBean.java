package prodotti;

import java.io.Serializable;
import java.sql.Blob;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	String ProductType[]= {"valuta","crypto","moneta","ricarica"};
	
	int code;
	String name;
	double price;
	Integer quantity;
	String tipo;
	Blob foto;
	boolean available;
	

	
	public ProductBean() {
		code = -1;
		name = "";
		price = -1;
		quantity = -1;
		tipo = "";
		foto = null;
		available = true;
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


	public double getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	public String getType() {
		return tipo;
	}
	



	public void setType(String tipo) {
		for(String t : ProductType)if(tipo.equals(t)) {this.tipo = tipo; break;}	
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
		return "[code=" + code + ", name=" + name + ", price=" + price + ", quantity=" + quantity
				+ ", tipo=" + tipo +", available=" + available + "]";
	}

	
	
	
}
