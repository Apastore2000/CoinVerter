package prodotti;

import java.sql.SQLException;
import java.util.ArrayList;


public interface IProductDAO<T> {
	public void doSave(T product) throws SQLException;

	public boolean doRemove(int code) throws SQLException;
	
	public void doUpdate(T product) throws SQLException;

	public T doRetrieveByKey(int code) throws SQLException;
	
	//public ArrayList<T> doRetrieveByName(String name) throws SQLException;
	
	public ArrayList<T> doRetrieveAvailable() throws SQLException;
	
	public ArrayList<T> doRetrieveAll(String order) throws SQLException;

	public ArrayList<T> doRetrieveByCategory(String cat) throws SQLException;
	
	public void doBuy(ArrayList<T> products,String email) throws SQLException;
	
	
	
}
