package utenti;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			UsersDaoDataSource d = new UsersDaoDataSource();
			User u = new User();
						
		
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String admin = request.getParameter("admin");
			
			List<String> errors = new ArrayList<>();
        	RequestDispatcher dispatcherToLoginPage = request.getRequestDispatcher("login.jsp");
        	if(nome == null || nome.trim().isEmpty()) errors.add("Il campo nome non può essere vuoto!");
        	else u.setNome(nome);
        	
        	
            if(cognome == null || cognome.trim().isEmpty()) errors.add("Il campo cognome non può essere vuoto!");
            else u.setCognome(cognome);
			
            if(email == null || email.trim().isEmpty()) errors.add("Il campo email non può essere vuoto!");
            else u.setEmail(email);
            
            if(password == null || password.trim().isEmpty()) errors.add("Il campo password non può essere vuoto!");
            else {
            	
            	u.setPwd(Encrypter.hashPassword(password));
            }
            
            if(admin == "admin") u.setAdmin(true);
            else u.setAdmin(false);

            
            
            if (!errors.isEmpty()) {
            	try {
					d.doSave(u);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }
            
            response.sendRedirect("/Login");
            
	}
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
