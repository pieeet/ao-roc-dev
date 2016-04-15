package mvsite.student;

import java.util.ArrayList;


//voor oude ninja level beoordeling
public class StudentLijst {
    ArrayList<Student> lijst;

    public StudentLijst() {
        lijst = new ArrayList<Student>();

        lijst.add(new Student("Kevin", "", "Lutgert", 2, "http://kevin-lutgert.appspot.com/"));
        lijst.add(new Student("Ajay", "", "Singh", 1));
        lijst.add(new Student("Casper", "", "Baltus", 0));
        lijst.add(new Student("Arjen", "", "Schrijer", 0));
        lijst.add(new Student("Donny", "", "Smit", 0));
        lijst.add(new Student("Emiel", "", "Pothoff", 0));
        lijst.add(new Student("Erwin", "", "Wernars", 1));
        lijst.add(new Student("Gilliano", "", "Herkul", 1));
        lijst.add(new Student("Jochem", "", "Tan", 1));
        lijst.add(new Student("Kevin", "", "Fleur", 1));
        lijst.add(new Student("Marjorie", "", "Claus", 0));
        lijst.add(new Student("Max", "van der", "Vlugt", 0));
        lijst.add(new Student("Michel", "", "Abdad", 1));
        lijst.add(new Student("Natasha", "", "Luyer", 2, "http://natasha-auto.appspot.com/"));
        lijst.add(new Student("Levi", "", "Boon", 2, "http://protean-smile-608.appspot.com/"));
        lijst.add(new Student("Marvin", "van", "Bakkum", 2, "http://marvin.keezbv.nl/topgear/"));
        lijst.add(new Student("Jari", "van", "Wijk", 1));
        lijst.add(new Student("Jesha", "", "Kuizenga", 1));
        lijst.add(new Student("Jeffrey", "", "Walst", 2, "http://aojeffreyw.appspot.com/"));
        lijst.add(new Student("Matthijs", "de", "Vos", 2, "http://matthijs-de-vos.appspot.com"));
        lijst.add(new Student("Pascal", "van", "Egmond", 1));
        lijst.add(new Student("Raid", "", "Bojaada", 1));
        lijst.add(new Student("Sebastian", "", "Jakupovitch", 2, "http://sebastian-jakupovic.appspot.com"));
        lijst.add(new Student("Thomas", "", "Brouwer", 0));
        lijst.add(new Student("Tim", "", "Everwijn", 1));
        lijst.add(new Student("Vincent", "de", "Vlaam", 0));
        lijst.add(new Student("Rhenusone", "", "Rosalia", 2, "http://mimetic-asset-617.appspot.com/"));
    }

    public ArrayList<Student> getLijst() {
        return lijst;
    }


}
