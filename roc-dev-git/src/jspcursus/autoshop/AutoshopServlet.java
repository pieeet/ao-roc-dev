package jspcursus.autoshop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class AutoshopServlet extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		if (req.getParameter("merk") == null) {
			resp.sendRedirect("jsp_deel_3");
		} else {
			try {
				ArrayList<Auto> lijst = new AutoLijst().getLijst();
				String merk = "alle";
				int minPrijs = 0;
				int maxPrijs = Integer.MAX_VALUE;
				if (req.getParameter("merk") != null
						&& !req.getParameter("merk").equals("")) {
					merk = req.getParameter("merk");
				}
				if (!req.getParameter("minprijs").equals("")) {
					try {
						minPrijs = Integer.parseInt(req
								.getParameter("minprijs"));
					} catch (NumberFormatException | NullPointerException e) {
					}
				}
				if (!req.getParameter("maxprijs").equals("")) {
					try {
						maxPrijs = Integer.parseInt(req
								.getParameter("maxprijs"));
					} catch (NumberFormatException | NullPointerException e) {
					}
				}
				PrintWriter out = resp.getWriter();
				if (req.getParameter("merk") != null) {
					if (merk.equals("alle")) {
						for (Auto auto : lijst) {
							if (auto.getPrijs() > minPrijs
									&& auto.getPrijs() < maxPrijs) {
								out.println(maakAutoDiv(auto));
							}
						}
					} else {
						for (Auto auto : lijst) {
							if (auto.getPrijs() > minPrijs
									&& auto.getPrijs() < maxPrijs
									&& auto.getMerk().equals(merk)) {
								out.println(maakAutoDiv(auto));
							}
						}
					}
				}
				out.close();
			} catch (Exception e) {
				resp.sendRedirect("jsp_deel_3");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}

	private String maakAutoDiv(Auto auto) {
		String div = "<div class=\"autokader\">\n";
		div += "<img src=\"" + auto.getFoto() + "\" alt=\"" + auto.getMerk()
				+ " " + auto.getType() + "\">\n";
		div += "<p class=\"merktype\">" + auto.getMerk() + " " + auto.getType()
				+ "</p>\n";
		div += "<p class=\"prijs\">&euro; " + auto.getPrijsFormat() + "</p>\n";
		div += "</div>\n";
		return div;
	}

}
