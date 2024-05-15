package utenti;

public class User {

	private String nome,cognome,email;
	private byte[] pwd;
	private boolean isAdmin = false;
	
	
	
	public User() {}

	public User(String nome, String cognome, String email, byte[] pwd, boolean isAdmin) {
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		System.arraycopy(pwd, 0,this.pwd, 0,pwd.length);
		this.isAdmin = isAdmin;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public byte[] getPwd() {
		return pwd;
	}

	public void setPwd(byte[] pwd) {
		System.arraycopy(pwd, 0,this.pwd, 0,pwd.length);
	}

	// la possibilità di rendere un account admin è da discutere
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	
	
	
	
}
	
