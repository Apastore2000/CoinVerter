package utenti;

import java.util.HashMap;


public class User {

	private String nome,cognome,email,pwd;
	private boolean isAdmin = false;
	HashMap<String, Double> portafoglio;
	// ProductBean[] portafoglio; 
	
	
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	// la possibilità di rendere un account admin è da discutere
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	
	public HashMap<String, Double> getPortafoglio() {
		return portafoglio;
	}
	
	public void ricaricaPortafoglio(String valuta,double f) {
		portafoglio.putIfAbsent(valuta, (double) 0);
		portafoglio.put(valuta, portafoglio.get(valuta) + f);
		
	}
	
	
}
	
