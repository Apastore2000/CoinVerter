package prodotti;

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

public class ProductDaoDataSource implements IProductDAO<ProductBean> {

	private String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE CODE = ?";
	
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/CoinVerter");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "prodotto";

	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertNewSQL = "INSERT INTO " + ProductDaoDataSource.TABLE_NAME
				+ " (nome, prezzo, quantità, tipo, foto) VALUES (?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();    
			preparedStatement = connection.prepareStatement(insertNewSQL);
			preparedStatement.setString(1, product.getName());
			preparedStatement.setFloat(2, product.getPrice());
			preparedStatement.setInt(3, product.getQuantity());
			//preparedStatement.setEnum che non esiste...
			preparedStatement.setString(4, insertNewSQL);
			preparedStatement.setString(5, product.getName());
			preparedStatement.executeUpdate();
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

	
	
	@Override
	public void doUpdate(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean oldBean = new ProductBean();

		String updateSQL = "UPDATE " + ProductDaoDataSource.TABLE_NAME + 
		" SET nome = ?,quantità = ?, tipo = ?, prezzo = ?, foto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, product.getCode());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				oldBean.setCode(rs.getInt("ID_prodotto"));
				oldBean.setName(rs.getString("nome"));
				oldBean.setType(rs.getString("tipo"));
				oldBean.setFoto(rs.getBlob("foto"));
				oldBean.setPrice((float)rs.getDouble("prezzo"));
				
				
			preparedStatement = connection.prepareStatement(updateSQL);
			if(product.getName()== null) {preparedStatement.setString(1, oldBean.getName());}
			else preparedStatement.setString(1, product.getName());
			
			if(product.getType()== null) {preparedStatement.setString(1, oldBean.getType());}
			else preparedStatement.setString(1, product.getType());
			
			if(product.getPrice()< 0) {preparedStatement.setFloat(1, oldBean.getPrice());}
			else preparedStatement.setFloat(1, product.getPrice());
			
			if(product.getFoto()== null) {preparedStatement.setBlob(1, oldBean.getFoto());}
			else preparedStatement.setBlob(1, product.getFoto());
			
			
			
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
		




	@Override
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		//String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE CODE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("ID_prodotto"));
				bean.setName(rs.getString("nome"));
				bean.setType(rs.getString("tipo"));
				bean.setFoto(rs.getBlob("foto"));
				bean.setPrice((float)rs.getDouble("prezzo"));
			
			
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
	public synchronized boolean doRemove(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "UPDATE " + ProductDaoDataSource.TABLE_NAME + " SET disponibile = 'false' WHERE CODE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

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
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setString(1, bean.getName());
				preparedStatement.setFloat(2, bean.getPrice());
				preparedStatement.setInt(3, bean.getQuantity());
				//preparedStatement.setEnum che non esiste...
				preparedStatement.setString(4, bean.getType().toString());
				preparedStatement.setString(5, bean.getName());
				products.add(bean);
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
		return products;
	}

}