package dailystandups.model;

/**
 * Created by Piet de Vries on 2019-06-21.
 */
public enum Groep {

    MMVAO5A(
         "MMVAO5A",
         2015,
         "AO"
    ),
    MMVAO6A(
            "MMVAO6A",
            2016,
            "AO"
    ),
    MMVAO6C(
            "MMVAO6C",
            2016,
            "AO"
    ),
    MMVAO7A(
            "MMVAO7A",
            2017,
            "AO"
    ),
    MMVAO7B(
            "MMVAO7B",
            2017,
            "AO"
    ),
    MMVAO8A(
            "MMVAO8A",
            2018,
            "AO"
    ),
    MMVAO8B(
            "MMVAO8B",
            2018,
            "AO"
    ),
    MMVAO8C(
            "MMVAO8C",
            2018,
            "AO"
    ),
    MMVAO9A(
            "MMVAO9A",
            2019,
            "AO"
    ),
    MMVAO9B(
            "MMVAO9B",
            2019,
            "AO"
    ),
    MMVAO9C(
            "MMVAO9C",
            2019,
            "AO"
    );


    private String naam;
    private int cohort;
    private String opleiding;

    Groep(String naam, int cohort, String opleiding) {
        this.naam = naam;
        this.cohort = cohort;
        this.opleiding = opleiding;
    }

    public String getNaam() {
        return naam;
    }

    public int getCohort() {
        return cohort;
    }

    public String getOpleiding() {
        return opleiding;
    }
}
