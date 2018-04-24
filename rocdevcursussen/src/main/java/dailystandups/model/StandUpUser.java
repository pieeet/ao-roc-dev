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
    private String groep;
    private String naam;
    private long laatstePlanningId;
    private int cohort;
    private Planning huidigePlanning;

    public int getCohort() {
        return cohort;
    }

    public void setCohort(int cohort) {
        this.cohort = cohort;
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
        return groep;
    }
    public String getGroepEsc() {
        return StringEscapeUtils.escapeHtml4(groep);
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

    public StandUpUser(@Nonnull String email, String naam, @Nullable String groep) {
        this.email = email;
        this.groep = groep;
        if (groep != null) {
            switch (groep) {
                case "MMVAO5A":
                    this.cohort = 2015;
                    break;
                case "MMVAO6A":
                case "MMVAO6C":
                    this.cohort = 2016;
                    break;
                case "MMVAO7A":
                case "MMVAO7B":
                    this.cohort = 2017;
                    break;
                default:
                    this.cohort = -1;
            }
        }
        this.naam = naam;
    }
}
