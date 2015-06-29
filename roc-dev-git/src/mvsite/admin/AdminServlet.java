package mvsite.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.EntityNotFoundException;

import mvsite.student.*;


@SuppressWarnings("serial")
public class AdminServlet extends HttpServlet {
	String[] administrators = {
			"pdevries@roc-dev.com",
			"janjaap@roc-dev.com",
			"tvanbeuningen@roc-dev.com",
			"test@example.com"
			};
	StudentIO io = new StudentIO();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//geen parameters
		req.setAttribute("admins", administrators);

		if (req.getParameter("zoek_gebruiker_knop") != null) {
			String email = req.getParameter("email_gebruiker");
			//System.out.println(email);
			Student student = null;
			try {
				student = io.getStudent(email);
				//System.out.println(student.getEmail());
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.setAttribute("student", student);
		} else if (req.getParameter("wijzig_student_knop") != null) {
			String email = req.getParameter("wijzig_student_email");
			Student student = null;
			try {
				student = io.getStudent(email);
				//System.out.println(student.getHeleNaam());
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String voornaam = req.getParameter("wijzig_student_voornaam");
			student.setVoornaam(voornaam);
			String tussenvoegsels = req.getParameter("wijzig_student_tussenvoegsels");
			student.setTussenvoegsels(tussenvoegsels);
			String achternaam = req.getParameter("wijzig_student_achternaam");
			student.setAchternaam(achternaam);
			String heleNaam = "";
			if (tussenvoegsels.equals("")) {
				heleNaam = voornaam + " " + achternaam;
			} else {
				heleNaam = voornaam + " " + tussenvoegsels + " " + achternaam;
			}
			student.setHeleNaam(heleNaam);
			int cohort = Integer.parseInt(req.getParameter("wijzig_student_cohort"));
			student.setCohort(cohort);
			String webpage = req.getParameter("wijzig_student_portfolio");
			student.setWebpage(webpage);
			int level = Integer.parseInt(req.getParameter("wijzig_student_level"));
			student.setLevel(level);
			io.voegStudentToe(student);
		}
		ArrayList<Student> studenten = io.getStudentenLijst();
		req.setAttribute("studentlijst", studenten);
		
		RequestDispatcher disp = getServletContext().getRequestDispatcher("/admin.jsp");
		disp.forward(req, resp);
	}
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
}
