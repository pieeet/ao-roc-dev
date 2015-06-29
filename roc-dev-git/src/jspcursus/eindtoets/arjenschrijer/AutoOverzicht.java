package jspcursus.eindtoets.arjenschrijer;

import java.util.ArrayList;
/**
 *
 * @author LAPTOP
 */
public class AutoOverzicht {
    String html;
    
    private ArrayList<Auto> autolijst;
       
    public AutoOverzicht() {
        autolijst = new ArrayList<Auto>(); 
    }
    
    public void voegAutoToe(Auto a) {
        autolijst.add(new Auto ("Audi A1.jpg","a1","audi","23000"));  // kleine naar hoofdletter gewijzigd x 3
        autolijst.add(new Auto ("Audi A3.jpg","a3","audi","23000"));
        autolijst.add(new Auto ("Audi R8.jpg","r8","audi","123000"));
    }
    
    public void html(String html){
        html="";       
    }
    
    public ArrayList<Auto> zoekAutoOpPrijs(int min_prijs, int max_prijs) {
        return null;
    }    
    
    public ArrayList<Auto> zoekAutoOpMerk(String merk) {
        return null;
    }
     
    public ArrayList<Auto> getAutolijst() {
        return null;
    }

    /* uitgecommentaardvanwege compile fouten
    private static class auto extends Auto {

       
    	public auto(String lamborghiniVenenojpg, String lamborghini_Veneno, String _liter, String _pk, String zwart, String _kgs) {
        }

        private auto(String audi_A1jpg, String a1, String audi, String string) {
            throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        }
    } */
}
