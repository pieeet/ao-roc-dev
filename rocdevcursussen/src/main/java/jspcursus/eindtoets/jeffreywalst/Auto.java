package jspcursus.eindtoets.jeffreywalst;


/**
 *
 * @author Jeffrey
 */
public class Auto {
   private String merk,type;
   private int prijs;

    public Auto(String merk, String type, int prijs) {
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
   
   public String getPlaatjes() {      // beetje omslachtig ;-) zie methode hieronder?
        String pre = "<img class='auto' src='images/";
        String post = ".jpg'>";
        switch (type) {
           case "A1":
               return pre + "audi_a1" + post;
           case "A3":
               return pre + "audi_a3" + post;
           case "R8":
               return pre + "audi_r8" + post;
           case "Enzo":
               return pre + "ferrari_enzo" + post;
           case "Testarossa":
               return pre + "ferrari_testarossa" + post;
           case "500":
               return pre + "fiat_500" + post;
           case "Bravo":
               return pre + "fiat_bravo" + post;
           case "Punto":
               return pre + "fiat_punto" + post;
           case "Fiesta":
               return pre + "ford_fiesta" + post;
           case "Focus":
               return pre + "ford_focus" + post;
           case "Mondeo":
               return pre + "ford_mondeo" + post;   
           case "Ghibli":
               return pre + "maserati_ghibli" + post;
           case "Quattroporte":
               return pre + "maserati_quattroporte" + post;
           case "Astra":
               return pre + "opel_astra" + post;
           case "Corsa":
               return pre + "opel_corsa" + post;
           case "Mokka":
               return pre + "opel_mokka" + post;
           case "Cayenne":
               return pre + "porsche_cayenne" + post;
           case "Panamera":
               return pre + "porsche_panamera" + post;
           case "911":
               return pre + "porsche_911" + post;
           default:
               return "";
       }
    }
   
   //alternatief PdV
   public String getPlaatje() {
	   String plaatje = "<img class='auto' src='images/" + this.getMerk().toLowerCase() + 
			   "_" + this.getType().toLowerCase() + ".jpg'>";
	   return plaatje;
   }


}
