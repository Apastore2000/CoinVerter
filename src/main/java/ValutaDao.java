
import java.sql.SQLException;
import java.util.Collection;

public interface ValutaDao {
	
	public void doSave(ValutaBean product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public ValutaBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ValutaBean> doRetrieveAll(String order) throws SQLException;

}



