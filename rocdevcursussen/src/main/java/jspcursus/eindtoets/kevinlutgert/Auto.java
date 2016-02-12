package jspcursus.eindtoets.kevinlutgert;

public class Auto {
    String url;
    String merk;
    String type;
    int prijs;
    

    public Auto(String merk,String type, int prijs ) {
        this.merk = merk;
        this.type = type;
        this.prijs = prijs;
    }

    public String getMerk() {
        return merk;
    }

    public void setMerk(String merk) {
        this.merk = merk;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPrijs() {
        return prijs;
    }

    public void setPrijs(int prijs) {
        this.prijs = prijs;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
           public String getImage(){
 String pre="<img src='images/";
 String post=".jpg'>";
 
 return pre+getMerk()+"_"+getType()+post;
 }
    
}

