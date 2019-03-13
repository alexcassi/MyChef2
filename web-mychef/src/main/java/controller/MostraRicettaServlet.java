package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.RicettaManager;
import modello.Ricetta;

/**
 * Servlet implementation class LeggiRicettaService
 */
@WebServlet("/MostraRicettaServlet")
public class MostraRicettaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MostraRicettaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Ricetta r = RicettaManager.findRicetta(Integer.valueOf(request.getParameter("id_ricetta")));
		request.setAttribute("ricetta", r);
		request.getRequestDispatcher("mostra_ricetta.jsp").forward(request, response);
	}

}
