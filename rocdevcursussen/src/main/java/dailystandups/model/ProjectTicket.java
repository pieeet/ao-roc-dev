package dailystandups.model;

/**
 * Created by Piet de Vries on 26-03-18.
 *
 */
public class ProjectTicket extends Ticket {

    private static final String CODE_TICKET = "PROJ";

    private String beschrijvingTicket;
    private String projectNaam;


    public ProjectTicket(String beschrijving) {
        this.beschrijvingTicket = beschrijving;
    }

    public ProjectTicket(long vakId, int aantalUren, String beschrijving, String project) {
        super(vakId, CODE_TICKET, aantalUren);
        this.beschrijvingTicket = beschrijving;
        this.projectNaam = project;
    }

    public ProjectTicket(long id, long vakId, int aantalUren, long isAfgerond, String beschrijving, String project) {
        super(id, vakId, CODE_TICKET, aantalUren, isAfgerond);
        this.beschrijvingTicket = beschrijving;
        this.projectNaam = project;
    }

    public String getBeschrijvingTicket() {
        return beschrijvingTicket;
    }

    public void setBeschrijvingTicket(String beschrijvingTicket) {
        this.beschrijvingTicket = beschrijvingTicket;
    }

    public String getProjectNaam() {
        return projectNaam;
    }

    public void setProjectNaam(String projectNaam) {
        this.projectNaam = projectNaam;
    }

    @Override
    public String getCodeTicket() {
        return CODE_TICKET;
    }

    @Override
    public String getTicketRegel() {
        return projectNaam + " - " + beschrijvingTicket + " - " + getAantalUren() + " punten";
    }
}