package dailystandups;

import org.apache.commons.lang3.StringEscapeUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Piet de Vries on 09-03-18.
 *
 */
public class PlanningV2 {
    private StandUpUser user;

    private Date entryDate;
    private Ticket[] tickets;
    private String[] ticketIds;
    private String belemmeringen;
    private boolean isAfgerond;
    private String gedaan;
    private String nogTeDoen;
    private String redenNietAf;


    public PlanningV2() {
    }
    public PlanningV2(StandUpUser user, Date entryDate,
                      String belemmeringen) {
        this.user = user;
        this.entryDate = entryDate;
        this.tickets = tickets;
        this.belemmeringen = belemmeringen;
    }

    public void setUser(StandUpUser user) {
        this.user = user;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public void setTickets(Ticket[] tickets) {
        this.tickets = tickets;
    }

    public void setBelemmeringen(String belemmeringen) {
        this.belemmeringen = belemmeringen;
    }

    public StandUpUser getUser() {
        return user;
    }

    public Date getEntryDate() {
        return entryDate;
    }
    public String getEntryDateFormat() {

        try {
            Date datePlus = new Date(entryDate.getTime() + 1000 * 60 * 60);
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
            return sdf.format(datePlus);
        } catch (Exception e) {
            return "null";
        }

    }

    public Ticket[] getTickets() {
        return tickets;
    }

    public String getBelemmeringen() {
        return belemmeringen;
    }
    public String getBelemmeringenEsc() {
        return StringEscapeUtils.escapeHtml4(belemmeringen);
    }

    public String getGedaan() {
        return gedaan;
    }
    public String getGedaanEsc() {
        return StringEscapeUtils.escapeHtml4(gedaan);
    }

    public String getNogTeDoen() {
        return nogTeDoen;
    }
    public String getNogTeDoenEsc() {
        return StringEscapeUtils.escapeHtml4(nogTeDoen);
    }

    public String getRedenNietAf() {
        return redenNietAf;
    }
    public String getRedenNietAfRsc() {
        return StringEscapeUtils.escapeHtml4(redenNietAf);
    }

    public void setGedaan(String gedaan) {
        this.gedaan = gedaan;
    }

    public void setNogTeDoen(String nogTeDoen) {
        this.nogTeDoen = nogTeDoen;
    }

    public void setRedenNietAf(String redenNietAf) {
        this.redenNietAf = redenNietAf;
    }

    public String[] getTicketIds() {
        return ticketIds;
    }

    public void setTicketIds(String[] ticketIds) {
        this.ticketIds = ticketIds;
    }

    public boolean isAfgerond() {
        return isAfgerond;
    }

    public void setAfgerond(boolean afgerond) {
        isAfgerond = afgerond;
    }
}
