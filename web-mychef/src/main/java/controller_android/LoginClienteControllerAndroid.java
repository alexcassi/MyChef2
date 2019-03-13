package controller_android;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import business.LoginManager;
import modello.Cliente;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginClienteControllerAndroid")
public class LoginClienteControllerAndroid extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginClienteControllerAndroid() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = new String(request.getParameter("email"));
		String password = new String(request.getParameter("password"));
		Cliente c = LoginManager.loginCliente(email, password);
		ObjectMapper om = new ObjectMapper();
		if (c != null) {
			response.setContentType("application/json");
			response.getWriter().append(om.writeValueAsString(c));
		} else {
			response.getWriter().append("Login fallito");
		}

	}

}
