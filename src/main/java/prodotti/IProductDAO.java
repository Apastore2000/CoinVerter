package prodotti;

import java.sql.SQLException;
import java.util.Collection;

public interface IProductDAO<T> {
	public void doSave(T product) throws SQLException;

	public boolean doRemove(int code) throws SQLException;
	
	public void doUpdate(T product) throws SQLException;

	public T doRetrieveByKey(int code) throws SQLException;
	
	public Collection<T> doRetrieveAll(String order) throws SQLException;
	
}
