package dailystandups.model;

import org.apache.commons.lang3.StringEscapeUtils;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/**
 * Created by Piet de Vries on 15-02-18.
 *
 */
public class StandUpUser {

    private String email;
    private Groep groep;
    private String naam;
    private long laatstePlanningId;
    private Planning huidigePlanning;

    public int getCohort() {
        return groep.getCohort();
    }

    public long getLaatstePlanningId() {
        return laatstePlanningId;
    }

    public Planning getHuidigePlanning() {
        return huidigePlanning;
    }

    public void setHuidigePlanning(Planning huidigePlanning) {
        this.huidigePlanning = huidigePlanning;
    }

    public void setLaatstePlanningId(long laatstePlanningId) {
        this.laatstePlanningId = laatstePlanningId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGroep() {
        return groep.getNaam();
    }
    public String getGroepEsc() {
        return StringEscapeUtils.escapeHtml4(groep.getNaam());
    }

    public String getNaam() {
        return naam;
    }
    public String getNaamEsc() {
        return StringEscapeUtils.escapeHtml4(naam);
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    public StandUpUser(@Nonnull String email, String naam, @Nullable Groep groep) {
        this.email = email;
        this.groep = groep;
        this.naam = naam;
    }
}
