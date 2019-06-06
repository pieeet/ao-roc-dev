package dailystandups.model;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import javax.annotation.Nullable;

/**
 * Created by Piet de Vries on 26-03-18.
 *
 */
public class ProjectTicket extends Ticket {

    private static final String CODE_TICKET = "PROJ";

    private String beschrijvingTicket;
    private String projectNaam;
    private String approved;

    public ProjectTicket() {}


    public ProjectTicket(long vakId, int aantalUren, String beschrijving, String project) {
        super(vakId, CODE_TICKET, aantalUren);
        this.beschrijvingTicket = beschrijving;
        this.projectNaam = project;
        this.approved = "pending";
    }

    public ProjectTicket(long id, long vakId, int aantalUren, long isAfgerond, String beschrijving, String project,
                         @Nullable String approved) {
        super(id, vakId, CODE_TICKET, aantalUren, isAfgerond);
        this.beschrijvingTicket = beschrijving;
        this.projectNaam = project;
        this.approved = approved;
    }

    public String getBeschrijvingTicket() {
        return beschrijvingTicket;
    }

    public String getBeschrijvingTicketEsc() {
        return StringEscapeUtils.escapeHtml4(beschrijvingTicket);
    }

    public void setBeschrijvingTicket(String beschrijvingTicket) {
        this.beschrijvingTicket = beschrijvingTicket;
    }

    public String getProjectNaam() {
        return projectNaam;
    }

    public String getProjectNaamEsc() {
        return StringEscapeUtils.escapeHtml4(projectNaam);
    }

    public void setProjectNaam(String projectNaam) {
        this.projectNaam = projectNaam;
    }

    public String getApproved() {
        return approved;
    }

    @Override
    public String getCodeTicket() {
        return CODE_TICKET;
    }

    @Override
    public String getTicketRegel() {
        return StringEscapeUtils.escapeHtml4(projectNaam) + " - " +
                StringEscapeUtils.escapeHtml4(beschrijvingTicket) + " - " + getAantalUren() + " punten";
    }
}
