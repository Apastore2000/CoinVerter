CREATE DATABASE IF NOT EXISTS CoinVerter;
USE CoinVerter;

CREATE TABLE prodotto(
	ID_prodotto INT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
   	prezzo DOUBLE NOT NULL,
    quantità INT,
    tipo ENUM('valuta', 'carta'),
	foto MEDIUMBLOB
);

CREATE TABLE utente(
	email VARCHAR(50) NOT NULL PRIMARY KEY CHECK (Email LIKE '%@%'),
	pwd VARBINARY(50) NOT NULL;
	nome VARCHAR(25) NOT NULL,
	cognome VARCHAR(25) NOT NULL,
	isAdmin BOOLEAN NOT NULL
);

CREATE TABLE ordine(
	ID_ordine INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_acquisto DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    FOREIGN KEY(email) REFERENCES utente(Email) ON UPDATE CASCADE
);

CREATE TABLE acquista(
	Email VARCHAR(50) NOT NULL,
	ID_prodotto INT NOT NULL,
	PRIMARY KEY(Email,ID_prodotto), 
    FOREIGN KEY(Email) REFERENCES utente(Email) ON UPDATE CASCADE,
	FOREIGN KEY(ID_brano) REFERENCES prodotto(ID_brano) ON UPDATE CASCADE
);

CREATE TABLE contiene(
	ID_ordine INT NOT NULL,
	ID_prodotto INT NOT NULL,
	prezzo DOUBLE,
	PRIMARY KEY(ID_ordine,ID_prodotto), 
    FOREIGN KEY(ID_ordine) REFERENCES ordine(ID_ordine),
	FOREIGN KEY(ID_prodotto) REFERENCES prodotto(ID_prodotto) 
);




