package prodotti;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.omg.CORBA.Request;

import utenti.User;

public class ProductDaoDataSource implements IProductDAO<ProductBean> {

	private String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE ID_prodotto = ?";
	
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/coinverter");

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
			preparedStatement.setDouble(2, product.getPrice());
			preparedStatement.setInt(3, product.getQuantity());
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
			
			if(product.getPrice()< 0) {preparedStatement.setDouble(1, oldBean.getPrice());}
			else preparedStatement.setDouble(1, product.getPrice());
			
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

		//String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE ID_prodotto = ?";

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

		String deleteSQL = "UPDATE " + ProductDaoDataSource.TABLE_NAME + " SET disponibile = 'false' WHERE ID_prodotto = ?";

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

	
	
	
	
	  @Override public ArrayList<ProductBean> doRetrieveByName(String name) throws
	  SQLException { Connection connection = null; PreparedStatement
	  preparedStatement = null;
	  
	  ArrayList<ProductBean> beanz = new ArrayList<ProductBean>();
	  
	  String selectNameSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME +
	  " WHERE nome LIKE ?";
	  
	  
	  try { connection = ds.getConnection(); preparedStatement =
	  connection.prepareStatement(selectNameSQL); preparedStatement.setString(1,"%" + name + "%");
	  
	  ResultSet rs = preparedStatement.executeQuery();
	  
	  while (rs.next()) { ProductBean bean = new ProductBean();
	  bean.setCode(rs.getInt("ID_prodotto")); bean.setName(rs.getString("nome"));
	  bean.setType(rs.getString("tipo")); bean.setFoto(rs.getBlob("foto"));
	  bean.setPrice((float)rs.getDouble("prezzo")); beanz.add(bean);
	  
	  }
	  
	  } finally { try { if (preparedStatement != null) preparedStatement.close(); }
	  finally { if (connection != null) connection.close(); } } return beanz; }
	 
	
	
	
	@Override
	public ArrayList<ProductBean> doRetrieveByCategory(String cat) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> beanz = new ArrayList<ProductBean>();

		String selectNameSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE tipo = ?";

		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectNameSQL);
			preparedStatement.setString(1, cat);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getInt("ID_prodotto"));
				bean.setName(rs.getString("nome"));
				bean.setType(rs.getString("tipo"));
				bean.setFoto(rs.getBlob("foto"));
				bean.setPrice((float)rs.getDouble("prezzo"));
				beanz.add(bean);
			
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
		return beanz;
	}



	@Override
	public synchronized ArrayList<ProductBean> doRetrieveAvailable() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE disponibile = TRUE";
		connection = ds.getConnection();
		try {
		
		
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				String tp = rs.getString("tipo");
				if(tp.equals("ricarica")) bean.setQuantity(rs.getInt("quantità"));
				
				bean.setCode(rs.getInt("ID_prodotto"));
				bean.setType(tp);
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getFloat("prezzo"));
				bean.setFoto(rs.getBlob("foto"));
				bean.setAvailable(rs.getBoolean("disponibile"));
				
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

	@Override
	public synchronized ArrayList<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME;
		connection = ds.getConnection();
		try {
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY ?";
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, order);
		}else {
			preparedStatement = connection.prepareStatement(selectSQL);
		}

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				String tp = rs.getString("tipo");
				
				if(tp.equals("ricarica"))bean.setQuantity(rs.getInt("quantità"));
				
				bean.setCode(rs.getInt("ID_prodotto"));
				
				bean.setType(tp);
				
			
				bean.setName(rs.getString("nome"));
				
				bean.setPrice(rs.getFloat("prezzo"));
				bean.setFoto(rs.getBlob("foto"));
				bean.setAvailable(rs.getBoolean("disponibile"));
				
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

	@Override
	public void /*Dubai*/doBuy(ArrayList<ProductBean> products,User u) throws SQLException {
		String Ordinesql = "INSERT INTO ordine(data_acquisto, email) VALUES(?,?)";
		String Prodottisql = "INSERT INTO acquisto(ID_ordine,q_acquisto,nome,tipo,prezzo) VALUES(?,?,?,?,?)";
		String RecoverWallet = "SELECT nome,valore FROM valuta WHERE email = ?";
		String Wallet1sql = "INSERT INTO valuta(email,nome,valore) VALUES(?,?,?)";
		String Wallet2sql = "UPDATE valuta SET nome = ? ,valore = ? WHERE email = ?";
		ArrayList<ProductBean> catalogati = new ArrayList<ProductBean>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		connection = ds.getConnection();
		try {
			//creo l'ordine
			preparedStatement = connection.prepareStatement(Ordinesql,Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setDate(1, Date.valueOf(java.time.LocalDate.now()));
			preparedStatement.setString(2, u.getEmail());
			preparedStatement.execute();
			ResultSet id = preparedStatement.getGeneratedKeys();
			int generatedId = -1;
			if (id.next()) {generatedId = id.getInt(1); }
			else System.out.println("ProductDaoDataSource + ERRORE KEY");
			System.out.println("ProductDaoDataSource: Ordine eseguito +" + generatedId);
			preparedStatement.close();
					
			//aggiungo i prodotti acquistati all'ordine
			preparedStatement = connection.prepareStatement(Prodottisql);
			preparedStatement.setInt(1, generatedId);
			HashMap<String,Double> portafoglio = u.getPortafoglio();
			HashMap<String,Double> dbData = new HashMap<String, Double>();
			for(ProductBean p: products) {
				String currentProduct = p.getName();
				System.out.println("ProductDaoDataSource: PRECatalogati +" + p.getName());
				if(!catalogati.contains(p)) {
					catalogati.add(p);
					System.out.println("ProductDaoDataSource: Catalogati +" + p.getName());
					int i = 0; 
					for(ProductBean f: products) if(f.getName().equals(currentProduct))i++;
					System.out.println("ProductDaoDataSource: i + " +i);
					preparedStatement.setInt(2, i);
					preparedStatement.setString(3, currentProduct);
					preparedStatement.setString(4, p.getType());
					preparedStatement.setDouble(5, (p.getPrice()*i));
					preparedStatement.addBatch();
				}
			}
			preparedStatement.executeBatch();
			System.out.println("ProductDaoDataSource: Batch ORdine eseguita");
			
			//salvo il portafoglio
			
			preparedStatement = connection.prepareStatement(RecoverWallet);
			preparedStatement.setString(1,u.getEmail());
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) dbData.put(rs.getString("nome"), rs.getDouble("valore"));
			    
			
			for(Map.Entry<String, Double> v: portafoglio.entrySet()) {
				 if (!dbData.containsKey(v.getKey())) {
					 preparedStatement = connection.prepareStatement(Wallet1sql);
					 preparedStatement.setString(1,u.getEmail());
					preparedStatement.setString(2,v.getKey());
					preparedStatement.setDouble(3,v.getValue());
				 }else {
					 preparedStatement = connection.prepareStatement(Wallet2sql);
					 preparedStatement.setString(1, v.getKey());
					preparedStatement.setDouble(2, v.getValue());
					preparedStatement.setString(3, u.getEmail());
				 }
				
				preparedStatement.addBatch();
			}
			preparedStatement.executeBatch();
			System.out.println("ProductDaoDataSource: Batch  wallet eseguita");
			
			
			
		}finally {
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