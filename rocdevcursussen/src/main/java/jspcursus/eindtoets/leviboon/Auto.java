package jspcursus.eindtoets.leviboon;

/**
*
* @author Levi
*/
public class Auto {
   String merk, model;
   int prijs;
    
   public Auto(String merk, String model, int prijs) {
       this.merk = merk;
       this.model = model;
       this.prijs = prijs;
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
   public String getPlaatje() {                //nogal omslachtig zie alt methode
       String pre = "<img src=\"image/";
       String post = "\"width=\"175px\" height=\"125px\" align=\"middle\">"; //stijl hoort in css
       if (model.equals("a1")) {
           return pre + "audi_a1.jpg" + post;
       } else if (model.equals("a3")) {
           return pre + "audi_a3.jpg" + post;
       } else if (model.equals("r8")) {
           return pre + "audi_r8.jpg" + post;
       } else if (model.equals("enzo")) {
           return pre + "ferrari_enzo.jpg" + post;
       } else if (model.equals("testarossa")) {
           return pre + "ferrari_testarossa.jpg" + post;
       } else if (model.equals("500")) {
           return pre + "fiat_500.jpg" + post;
       } else if (model.equals("bravo")) {
           return pre + "fiat_bravo.jpg" + post;
       } else if (model.equals("punto")) {
           return pre + "fiat_punto.jpg" + post;
       } else if (model.equals("fiesta")) {
           return pre + "ford_fiesta.jpg" + post;
       } else if (model.equals("focus")) {
           return pre + "ford_focus.jpg" + post;
       } else if (model.equals("mondeo")) {
           return pre + "ford_mondeo.jpg" + post;
       } else if (model.equals("ghibli")) {
           return pre + "maserati_ghibli.jpg" + post;
       } else if (model.equals("quattroporte")) {
           return pre + "maserati_quattroporte.jpg" + post;
       } else if (model.equals("astra")) {
           return pre + "opel_astra.jpg" + post;
       } else if (model.equals("corsa")) {
           return pre + "opel_corsa.jpg" + post;
       } else if (model.equals("mokka")) {
           return pre + "opel_mokka.jpg" + post;
       } else if (model.equals("cayenne")) {
           return pre + "porsche_cayenne.jpg" + post;
       } else if (model.equals("panamera")) {
           return pre + "porsche_panamera.jpg" + post;
       } else if (model.equals("911")) {
           return pre + "porsche_911.jpg" + post;
       } else {
           return "";
       }
   }
   
   //alternatief PdV
   public String getPlaatje2() {
	   String plaatje = "<img class='auto' src='images/" + this.getMerk().toLowerCase() + 
			   "_" + this.getModel().toLowerCase() + ".jpg'>";
	   return plaatje;
   }
   
}
