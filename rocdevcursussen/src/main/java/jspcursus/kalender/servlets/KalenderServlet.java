package jspcursus.kalender.servlets;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspcursus.kalender.*;

@SuppressWarnings("serial")
public class KalenderServlet extends HttpServlet {
	
	private final String DISPATCH_URL = "/AO/JSP_Java_DB/MVC_JQ.jsp";
	private final String ATTRIBUTE_NAME_KAMER = "kamers";
	
	Admin admin;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		admin = new Admin();
		ArrayList<String> kamers = admin.getKamerNamenLijst();
		req.setAttribute(ATTRIBUTE_NAME_KAMER, kamers);

		// geen parameters
		RequestDispatcher disp = getServletContext().getRequestDispatcher(
				DISPATCH_URL);
		try {
			disp.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}

}
