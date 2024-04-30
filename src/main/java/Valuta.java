public abstract class Valuta {

	private String nome;
	private float tassoCambio;
	
	public Valuta(String nome, float tassoCambio) {
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

}
