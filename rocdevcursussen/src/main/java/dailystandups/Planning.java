package dailystandups;

import org.apache.commons.lang3.StringEscapeUtils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

/**
 * Created by Piet de Vries on 15-02-18.
 *
 */
public class Planning {

    private StandUpUser user;
    private Date date;
    private String planning;
    private String belemmeringen;
    private boolean afgerond;
    private String gedaan;
    private String nogTeDoen;
    private String redenNietAf;

    public Planning() {
    }

    public StandUpUser getUser() {
        return user;
    }

    public void setUser(StandUpUser user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public String getDateFormat() {

        try {
            Date datePlus = new Date(date.getTime() + 1000 * 60 * 60);
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
            return sdf.format(datePlus);
        } catch (Exception e) {
            return "null";
        }

    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPlanning() {
        return planning;
    }

    public String getPlanningEsc() {
        return StringEscapeUtils.escapeHtml4(planning);
    }

    public void setPlanning(String planning) {
        this.planning = planning;
    }

    public String getBelemmeringen() {
        return belemmeringen;
    }

    public String getBelemmeringenEsc() {
        return StringEscapeUtils.escapeHtml4(belemmeringen);
    }

    public void setBelemmeringen(String belemmeringen) {
        this.belemmeringen = belemmeringen;
    }

    public boolean isAfgerond() {
        return afgerond;
    }

    public void setAfgerond(boolean afgerond) {
        this.afgerond = afgerond;
    }

    public String getGedaan() {
        return gedaan;
    }

    public String getGedaanEsc() {
        return StringEscapeUtils.escapeHtml4(gedaan);
    }

    public void setGedaan(String gedaan) {
        this.gedaan = gedaan;
    }

    public String getNogTeDoen() {
        return nogTeDoen;
    }

    public String getNogTeDoenEsc() {
        return StringEscapeUtils.escapeHtml4(nogTeDoen);
    }

    public void setNogTeDoen(String nogTeDoen) {
        this.nogTeDoen = nogTeDoen;
    }

    public String getRedenNietAf() {
        return redenNietAf;
    }

    public String getRedenNietAfEsc() {
        return StringEscapeUtils.escapeHtml4(redenNietAf);
    }

    public void setRedenNietAf(String redenNietAf) {
        this.redenNietAf = redenNietAf;
    }

    public String getAfgerondString() {
        if (isAfgerond()) {
            return "Ja";
        } else {
            return "Nee";
        }
    }
}
