package jspcursus.eindtoets.raidbojaada;

import java.util.*;

public class AutoOverzicht {
    public ArrayList<Auto> lijst = new ArrayList<>();;
    
    public AutoOverzicht() {
         Auto Audia1 = new Auto("Audi", "A1", 23000, "audi_a1.jpg");
         lijst.add(Audia1);
         Auto Audia3 = new Auto("Audi", "A3", 23000, "audi_a3.jpg");
         lijst.add(Audia3);
         Auto Audir8 = new Auto("Audi", "R8", 123000, "audi_r8.jpg");
         lijst.add(Audir8);
         Auto FerrariEnzo = new Auto("Ferrari", "Enzo", 200000, "ferrari_enzo.jpg");
         lijst.add(FerrariEnzo);
         Auto FerrariTestarossa = new Auto("Ferrari", "Testarossa", 209000, "ferrari_testarossa.jpg");
         lijst.add(FerrariTestarossa);
         Auto Fiat500 = new Auto("Fiat", "500", 12000, "fiat_500.jpg");
         lijst.add(Fiat500);
         Auto FiatBravo = new Auto("Fiat", "Bravo", 23000, "fiat_bravo.jpg");
         lijst.add(FiatBravo);
         Auto FiatPunto = new Auto("Fiat", "Punto", 16000, "fiat_punto.jpg");
         lijst.add(FiatPunto);
         Auto FordFiesta = new Auto("Ford", "Fiesta", 14000, "ford_fiesta.jpg");
         lijst.add(FordFiesta);
         Auto FordFocus = new Auto("Ford", "Focus", 25000, "ford_focus.jpg");
         lijst.add(FordFocus);
         Auto FordMondeo = new Auto("Ford", "Mondeo", 28000, "ford_mondeo.jpg");
         lijst.add(FordMondeo);
         Auto MasseratiGhibli = new Auto("Maserati", "ghibli", 120000, "maserati_ghibli.jpg");
         lijst.add(MasseratiGhibli);
         Auto MaseratiQuattroporte = new Auto("Maserati", "quattroporte", 160000, "maserati_quattroporte.jpg");
         lijst.add(MaseratiQuattroporte);
         Auto OpelAstra = new Auto("Opel", "astra", 22000, "opel_astra.jpg");
         lijst.add(OpelAstra);
         Auto OpelCorsa = new Auto("Opel", "corsa", 14000, "opel_corsa.jpg");
         lijst.add(OpelCorsa);
         Auto OpelMokka = new Auto("Opel", "mokka", 11000, "opel_mokka.jpg");
         lijst.add(OpelMokka);
         Auto PorscheCayenne = new Auto("Porsche", "cayenne", 85000, "porsche_cayenne.jpg");
         lijst.add(PorscheCayenne);
         Auto PorschePanamera = new Auto("Porsche", "panamera", 120000, "porsche_panamera.jpg");
         lijst.add(PorschePanamera);
         Auto Porsche911 = new Auto("Porsche", "911", 126000, "porsche_911.jpg");
         lijst.add(Porsche911);
    }
    
    public ArrayList<Auto> getLijst() {
        return lijst;
    }
}