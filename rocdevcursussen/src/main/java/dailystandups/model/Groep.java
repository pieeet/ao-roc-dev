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
    ),
    MMVAO9D("MMVAO9D",
            2019,
            "AO"
    ),
    MMVAO0A("MMVAO0A",
            2020,
            "AO"
            ),
    MMVAO0B("MMVAO0B",
            2020,
            "AO"
    ),
    MMVAO0C("MMVAO0C",
            2020,
            "AO"
    ),
    MMVAO0D(
            "MMVAO0D",
            2020,
            "AO"
    ),
    MMVAO1A(
            "MMVAO1A",
            2021,
            "AO"
    ),
    MMVAO1B(
            "MMVAO1B",
            2021,
            "AO"
    ),
    MMVAO1C("MMVAO1C",
            2021,
            "AO"),

    MMVAO1D("MMVAO1D",
            2021,
            "AO"),
    MMVSDO2A(
            "MMVSDO2A",
            2022,
            "AO"),
    MMVSDO2B(
            "MMVSDO2B",
            2022,
            "AO"),
    MMVSDO2C(
            "MMVSDO2C",
            2022,
            "AO"),
    MMVSDO2D(
            "MMVSDO2D",
            2022,
            "AO");







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
