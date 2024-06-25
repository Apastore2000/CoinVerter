package utenti;

import java.io.IOException;
import java.sql.SQLException;

import prodotti.ProductBean;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManageAccountServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String attività = request.getParameter("activity");
		User user = new User();
		String email = request.getParameter("email");
		String nome = request.getParameter("name");
		String cognome = request.getParameter("surname");
		String password = request.getParameter("password");
		String admin = request.getParameter("admin");
		UsersDaoDataSource source = new UsersDaoDataSource();
		
		if(attività != null) {
			switch(attività) {
				case "modify": 
				
					try {
						user = source.doRetrieveByEmail(email);
						if(!user.isAdmin()) user.setAdmin(true);
							else user.setAdmin(false);
						
						source.doUpdate(user);
						
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				
				case "remove":
					try {
						if(email != null)source.doDelete(email);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				break;
			}//switch
		}
	}
}