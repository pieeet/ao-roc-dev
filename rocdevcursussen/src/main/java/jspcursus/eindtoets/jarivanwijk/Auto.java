package jspcursus.eindtoets.jarivanwijk;

public class Auto {
    
    private String merk, type, img;
    private int prijs;
    
    public Auto(String merk, String type, int prijs, String img){
        
        this.merk = merk;
        this.type = type;
        this.prijs = prijs;
        this.img = img;
        
    }
    
    public String getMerk(){
        return merk;
    }
    
    public String getType(){
        return type;
    }
    
    public String getImg(){
        return img;
    }
    
    public int getPrijs(){
        return prijs;
    }
}
