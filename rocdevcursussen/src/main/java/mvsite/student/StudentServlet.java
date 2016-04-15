package mvsite.student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.EntityNotFoundException;


@SuppressWarnings("serial")
public class StudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {


        StudentIO io = new StudentIO();


        //nieuwe portfolio toevoegen
        if (req.getParameter("nieuwe_student_knop") != null) {
            String email = req.getUserPrincipal().toString();
            String voornaam = req.getParameter("nieuwe_student_voornaam");
            String tussenvoegsels = req.getParameter("nieuwe_student_tussenvoegsels");
            String achternaam = req.getParameter("nieuwe_student_achternaam");
            int cohort = Integer.parseInt(req.getParameter("cohort"));
            String webpage = req.getParameter("nieuwe_student_portfolio");
            Student student;
            String boodschap = "";
            int level = 0;
            student = new Student(voornaam, tussenvoegsels, achternaam, level, webpage, cohort, email);
            boodschap = "Je portfolio is toegevoegd";
            io.voegStudentToe(student);
            req.setAttribute("boodschap", boodschap);
        } else if (req.getParameter("wijzig_url_knop") != null) {
            String email = req.getUserPrincipal().toString();
            ;
            Student student = null;
            try {
                student = io.getStudent(email);
            } catch (EntityNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            String webpage = req.getParameter("nieuwe_student_portfolio");
            student.setWebpage(webpage);
            io.voegStudentToe(student);
            String boodschap = "Je portfolio is gewijzigd";
            req.setAttribute("boodschap", boodschap);
        }

        ArrayList<Student> studentLijst = io.getStudentenLijst();
        req.setAttribute("studentlijst", studentLijst);
        String portfoliosHtml = "";
        if (studentLijst.isEmpty()) {
            portfoliosHtml += "<p>Wees de eerste die een portfolio publiceert!</p>";
        } else {
            for (Student s : studentLijst) {
                portfoliosHtml += "<a href=\"" + s.getWebpage() + "\" target=\"_blank\">" +
                        "<div class=\"studentkader\">" +
                        "<img src=\"" + s.getAvatar() + "\">" +
                        "<p class=\"naamstudent\">" + s.getHeleNaam() + "<br>" +
                        "cohort: " + s.getCohort() + "</p>" +
                        "</div>" +
                        "</a>";
            }
        }
        req.setAttribute("portfolios", portfoliosHtml);
        RequestDispatcher disp = getServletContext().getRequestDispatcher("/studenten2.jsp");
        disp.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }


}
