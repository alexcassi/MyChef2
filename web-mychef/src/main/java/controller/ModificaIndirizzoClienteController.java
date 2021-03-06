package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.SignUpClienteManager;
import business.UtenteManager;
import modello.Cliente;

/**
 * Servlet implementation class RicettaController
 */
@WebServlet("/ModificaIndirizzoClienteController")
public class ModificaIndirizzoClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificaIndirizzoClienteController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		String comune = new String(request.getParameter("comune"));
		String indirizzo = new String(request.getParameter("indirizzo"));
		String provincia = new String(request.getParameter("provincia"));

		String email = new String(request.getParameter("cliente_email"));

		try {
			
			SignUpClienteManager.modificaIndirizzoCliente(email, comune, indirizzo, provincia);
			// rimette nella sessione il cliente col campo aggiornato riprendendolo dal db
			Cliente c = UtenteManager.findCliente(email);
			if (c != null) {
				request.getSession().setAttribute("cliente", c);
				response.sendRedirect(response.encodeRedirectURL("profilo_cliente.jsp"));
			} else {
				request.setAttribute("message", "cliente non ritrovato nel database ");
				request.getRequestDispatcher("/messaggio_errore.jsp").forward(request, response);
			}

		} catch (Exception e) {
			
			e.printStackTrace();
			response.getWriter().append("Errore interno. Riprovare. Se persiste contattarci");
		}
		
	}

}
