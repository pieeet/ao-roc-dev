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
	Admin admin;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		admin = new Admin();
		ArrayList<String> kamers = admin.getKamerNamenLijst();
		req.setAttribute("kamers", kamers);
		boolean eventHandlers = false;
		
		if(eventHandlers){
			// evt. event handlers
		} else {
			
			//geen parameters
			RequestDispatcher disp = getServletContext()
				    .getRequestDispatcher("/AO/JSP_Java_DB/MVC_JQ.jsp");
			try {
				disp.forward(req, resp);
			} catch (ServletException e) {
				e.printStackTrace();
			}
		}
	
			
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	

}
