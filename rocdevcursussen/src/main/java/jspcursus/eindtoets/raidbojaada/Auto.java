package jspcursus.eindtoets.raidbojaada;

public class Auto {
    private String merk;
    private String type;
    private int prijs;
    private String plaatje;
    
    public Auto(String merk, String type, int prijs, String plaatje){
        this.merk = merk;
        this.type = type;
        this.prijs = prijs;
        this.plaatje = plaatje;
    }

    public String getMerk() {
        return merk;
    }

    public String getType() {
        return type;
    }

    public int getPrijs() {
        return prijs;
    }
    
    public String getPlaatje(){
        return plaatje;
    }
}
