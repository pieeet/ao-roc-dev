package jspcursus.eindtoets.sebastianjakupovitch;

public class Auto {
    private String img, merk, model;
    private int prijs;
    
    public Auto(String img, String merk, String model, int prijs){
        this.img = img;
        this.merk = merk;
        this.model = model;
        this.prijs = prijs;
    }

    public String getImg() {
        return img;
    }

    public String getMerk() {
        return merk;
    }
    
    public String getModel() {
        return model;
    }

    public int getPrijs() {
        return prijs;
    }
    
    
}
