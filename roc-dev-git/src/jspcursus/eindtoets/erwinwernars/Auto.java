package jspcursus.eindtoets.erwinwernars;

public class Auto {
    private  String  model, merk, picture;
    private int prijs;
    public Auto(String picture, String model, String merk, int prijs){
        this.picture = picture;
        this.model = model;
        this.merk = merk;
        this.prijs = prijs;
    }
     public String getPicture(){
        return picture;
    }
    public String getModel(){
        return model;
    }
    public String getMerk(){
        return merk;
    }
    public int getPrijs(){
        return prijs;
    }
}