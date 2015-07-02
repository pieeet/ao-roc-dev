package mvsite.student;

import java.util.ArrayList;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;

public class StudentIO {
	private DatastoreService datastore;
	
	public StudentIO() {
		datastore = DatastoreServiceFactory.getDatastoreService();
	}
	
	public void voegStudentToe(Student student ) {
		Entity ent = new Entity("Student", student.getEmail());
		ent.setProperty("voornaam", student.getVoornaam());
		ent.setProperty("tussenvoegsels", student.getTussenvoegsels());
		ent.setProperty("achternaam", student.getAchternaam());
		ent.setProperty("level", student.getLevel());
		ent.setProperty("webpage", student.getWebpage());
		ent.setProperty("cohort", student.getCohort());
		ent.setProperty("email", student.getEmail());
		datastore.put(ent);
	}
	
	public Student getStudent(String email) throws EntityNotFoundException {
		Student student = new Student();
		Key k = KeyFactory.createKey("Student", email);
		Entity e = null;
		
		e = datastore.get(k);
		
		student.setVoornaam((String) e.getProperty("voornaam"));
		student.setTussenvoegsels((String) e.getProperty("tussenvoegsels"));
		student.setAchternaam((String) e.getProperty("achternaam"));
		long lvl = (long) e.getProperty("level");
		student.setLevel((int) lvl);
		student.setWebpage((String) e.getProperty("webpage"));
		long coh = (long) e.getProperty("cohort");
		student.setCohort((int) coh);
		student.setEmail((String) e.getProperty("email"));
		return student;
	}
	
	public ArrayList<Student> getStudentenLijst() {
		ArrayList<Student> lijst = new ArrayList<Student>();
		Query q = new Query("Student").addSort("cohort", SortDirection.DESCENDING);
		PreparedQuery pq = datastore.prepare(q);
		
		for (Entity e: pq.asIterable()) {
			
			String voornaam = (String) e.getProperty("voornaam");
			String tussenvoegsels = (String) e.getProperty("tussenvoegsels");
			String achternaam = (String) e.getProperty("achternaam");
			long lvl = (long) e.getProperty("level");
			int level = (int) lvl;
			long coh = (long) e.getProperty("cohort");
			int cohort = (int) coh;
			String webpage = (String) e.getProperty("webpage");
			String email = (String) e.getProperty("email");
			Student student = new Student(voornaam, tussenvoegsels, achternaam, 
					level, webpage, cohort, email);
			lijst.add(student);
		}
		return lijst;
	}
	
	public void verwijderStudent(Student student) {
		Key k = KeyFactory.createKey("Student", student.getEmail());
		datastore.delete(k);
	}
}
