import java.io.Serializable;

public abstract class PrepagataBean implements Serializable{
	private String nome;
	private float prezzo;
	
	private static final long serialVersionUID = 1L;
	
	public PrepagataBean(String nome, float prezzo) {
		this.nome = nome;
		this.prezzo = prezzo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}

	@Override
	public String toString() {
		return "Prepagata [nome=" + nome + ", prezzo=" + prezzo + "]";
	}

	

}
