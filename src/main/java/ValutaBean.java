import java.io.Serializable;

public abstract class ValutaBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String nome;
	private float tassoCambio;
	
	public ValutaBean(String nome, float tassoCambio) {
		this.nome = nome;
		this.tassoCambio = tassoCambio;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public float getTassoCambio() {
		return tassoCambio;
	}

	public void setTassoCambio(float tassoCambio) {
		this.tassoCambio = tassoCambio;
	}
	
	public float convertiValuta(float eur) {
		return eur * tassoCambio;
	}

	@Override
	public String toString() {
		return "Valuta [nome=" + nome + ", tassoCambio=" + tassoCambio + "]";
	}

	
	
}
