package dailystandups;

import java.text.SimpleDateFormat;
import java.util.Date;

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
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
        return sdf.format(date);
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPlanning() {
        return planning;
    }

    public void setPlanning(String planning) {
        this.planning = planning;
    }

    public String getBelemmeringen() {
        return belemmeringen;
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

    public void setGedaan(String gedaan) {
        this.gedaan = gedaan;
    }

    public String getNogTeDoen() {
        return nogTeDoen;
    }

    public void setNogTeDoen(String nogTeDoen) {
        this.nogTeDoen = nogTeDoen;
    }

    public String getRedenNietAf() {
        return redenNietAf;
    }

    public void setRedenNietAf(String redenNietAf) {
        this.redenNietAf = redenNietAf;
    }
}
