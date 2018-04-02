package dailystandups.model;

import org.apache.commons.lang3.StringEscapeUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Piet de Vries on 09-03-18.
 *
 */
public class Planning {
    private StandUpUser user;
    private Date entryDate;
    private Ticket[] tickets;
    private long[] ticketIds;
    private String belemmeringen;
    private String redenNietAf;

    //i.v.m. eerdere versie
    private String planning;


    public Planning() {
    }
    public Planning(StandUpUser user, Date entryDate,
                    String belemmeringen) {
        this.user = user;
        this.entryDate = entryDate;
        this.tickets = tickets;
        this.belemmeringen = belemmeringen;
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

    public String getRedenNietAf() {
        return redenNietAf;
    }
    public String getRedenNietAfEsc() {
        return StringEscapeUtils.escapeHtml4(redenNietAf);
    }

    public void setRedenNietAf(String redenNietAf) {
        this.redenNietAf = redenNietAf;
    }

    public long[] getTicketIds() {
        return ticketIds;
    }

    public void setTicketIds(long[] ticketIds) {
        this.ticketIds = ticketIds;
    }

    public long getId() {
        return entryDate.getTime();
    }

}
