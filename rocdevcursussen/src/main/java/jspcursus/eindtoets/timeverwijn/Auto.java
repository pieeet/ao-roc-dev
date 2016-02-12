package jspcursus.eindtoets.timeverwijn;

public class Auto {
    private String merk, type;
    private int prijs;
    
    public Auto(String merk, String type, int prijs){
        this.merk = merk;
        this.type = type;
        this.prijs = prijs;
    }
    
    public String getMerk(){
        return merk;
    }
    
    public String getType(){
        return type;
    }
    
    public int getPrijs(){
        return prijs;
    }
    
}
