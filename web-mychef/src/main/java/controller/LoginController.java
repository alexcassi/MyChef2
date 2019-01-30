package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.LoginManager;
import modello.Chef;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = new String(request.getParameter("email"));
		String password = new String(request.getParameter("password"));
		request.getSession().removeAttribute("errorMessage");
		Chef c = LoginManager.login(email, password);
		if (c != null) {
			request.getSession().setAttribute("chef", c);
			request.getRequestDispatcher("/profilo_chef.jsp?email=" + email).forward(request, response);
		} else {
			request.getSession().setAttribute("errorMessage", "Email o password errati.");
			request.getRequestDispatcher("/login.jsp").include(request, response);
		}

	}

}
