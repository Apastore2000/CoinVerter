package utenti;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import prodotti.ProductBean;
import prodotti.ProductDaoDataSource;


public class UsersDaoDataSource implements IUsersDAO<User> {

	private static DataSource ds;
	private static final String TABLE_NAME = "utente";

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/coinverter");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	

	@Override
	public synchronized void doSave(User utente) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		

		String insertSQL = "INSERT INTO " + UsersDaoDataSource.TABLE_NAME
				+ " (email, pwd, nome, cognome, isAdmin) VALUES (?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(3, utente.getNome());
			preparedStatement.setString(4, utente.getCognome());
			preparedStatement.setString(1, utente.getEmail());
			preparedStatement.setString(2, utente.getPwd());
			preparedStatement.setBoolean(5, utente.isAdmin());

			preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) connection.close();
			}
		}
	}

	
	@Override
	public synchronized boolean doDelete(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + UsersDaoDataSource.TABLE_NAME + " WHERE email = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, email);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized Collection<User> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<User> users = new LinkedList<User>();

		String selectSQL = "SELECT * FROM " + UsersDaoDataSource.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				User bean = new User();

				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setEmail(rs.getString("email"));
				bean.setPwd(rs.getString("pwd"));
				bean.setAdmin(rs.getBoolean("isAdmin"));
				users.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return users;
	}

	
	@Override
	public User doRetrieveByName(String name) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		User bean = new User();

		String selectSQL = "SELECT * FROM " + UsersDaoDataSource.TABLE_NAME + " WHERE nome = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, name);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setEmail(rs.getString("email"));
				bean.setPwd(rs.getString("pwd"));
				bean.setAdmin(rs.getBoolean("isAdmin"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	
	}


	public User doRetrieveByEmail(String mail) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		User bean = new User();

		String selectSQL = "SELECT * FROM " + UsersDaoDataSource.TABLE_NAME + " WHERE email = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, mail);

			ResultSet rs = preparedStatement.executeQuery();
			if(!rs.isBeforeFirst()) bean = null;
			else {
				while (rs.next()) {
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setEmail(rs.getString("email"));
				bean.setPwd(rs.getString("pwd"));
				bean.setAdmin(rs.getBoolean("isAdmin"));
			}
			}			
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	
	}
	
	
	
	
	@Override
	public void doUpdate(User user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		User oldUser = new User();

		String updateSQL = "UPDATE " + UsersDaoDataSource.TABLE_NAME + 
		" SET email = ?,pwd = ?, nome = ?, cognome = ?, isAdmin = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, user.getEmail());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				oldUser.setEmail("email");
				oldUser.setNome(rs.getString("nome"));
				oldUser.setCognome(rs.getString("cognome"));
				oldUser.setPwd("pwd");
				oldUser.setAdmin(false);
				
				
			preparedStatement = connection.prepareStatement(updateSQL);
			if(user.getNome()== null) preparedStatement.setString(1, oldUser.getNome());
			else preparedStatement.setString(1, user.getNome());
			
			if(user.getCognome()== null) preparedStatement.setString(1, oldUser.getCognome());
			else preparedStatement.setString(1, user.getCognome());
			
			if(user.getPwd() == oldUser.getPwd()) preparedStatement.setString(1, oldUser.getPwd());
			else preparedStatement.setString(1, user.getPwd());
			
			if(user.isAdmin() == oldUser.isAdmin()) preparedStatement.setBoolean(1, oldUser.isAdmin());
			else preparedStatement.setBoolean(1, user.isAdmin());
			
			
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	
	}
		

	
	

}