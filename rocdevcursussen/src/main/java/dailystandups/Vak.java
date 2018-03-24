package dailystandups;

import javax.annotation.Nullable;

/**
 * Created by Piet de Vries on 08-03-18.
 *
 */
public class Vak {

    private String naam;
    private String docent;
    private long id;


    public Vak(String naam, @Nullable String docent) {
        this.naam = naam;
        this.docent = docent;
    }

    public Vak(String naam, String docent, long id) {
        this(naam, docent);
        this.id = id;
    }

    public String getNaam() {
        return naam;
    }

    public String getDocent() {
        return docent;
    }

    public long getId() {
        return id;
    }
}
