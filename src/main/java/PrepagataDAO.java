
import java.sql.SQLException;
import java.util.Collection;

public interface PrepagataDAO {
	
	public void doSave(PrepagataBean product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public PrepagataBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<PrepagataBean> doRetrieveAll(String order) throws SQLException;

}

