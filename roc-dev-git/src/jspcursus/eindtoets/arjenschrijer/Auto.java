package jspcursus.eindtoets.arjenschrijer;

/**
*
* @author LAPTOP
*/
public class Auto {
String foto;
String model_code;
String merk;
String prijs;
// Accolade weggehaald

public Auto(String foto, String model_code, String merk, String prijs){ //Kleine letter veranderd in hoofdletter
this.foto = foto;
this.model_code = model_code;
this.merk = merk;
this.prijs = prijs;
}

public String getFoto(){
   return foto;
}
public String getModel_code(){
   return model_code;
}
public String getMerk(){
   return merk;
}
public String getPrijs(){
   return prijs;
}
}
