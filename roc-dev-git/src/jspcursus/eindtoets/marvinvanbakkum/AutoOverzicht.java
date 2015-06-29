package jspcursus.eindtoets.marvinvanbakkum;

import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author janjaap
 */
public class AutoOverzicht {
    private ArrayList<Auto> autolijst;

    public AutoOverzicht() {
        autolijst = new ArrayList<Auto>(); 
    }

    public void voegAutoToe(Auto a) {
        autolijst.add(a);
    }

    public ArrayList<Auto> zoekAutoOpPrijs(int min_prijs, int max_prijs) {
        ArrayList<Auto> zoeklijst = new ArrayList<Auto>();

        for( Auto auto : autolijst ) {
            if( auto.getPrijs() >= min_prijs && auto.getPrijs() <= max_prijs ) {
                zoeklijst.add(auto);
            }
        }
        return zoeklijst;
    }
    
    public ArrayList<Auto> zoekAutoOpMinPrijs(int min_prijs) {
        ArrayList<Auto> zoeklijst = new ArrayList<Auto>();

        for( Auto auto : autolijst ) {
            if( auto.getPrijs() >= min_prijs) {
                zoeklijst.add(auto);
            }
        }
        return zoeklijst;
    }
    
    public ArrayList<Auto> zoekAutoOpMaxPrijs(int max_prijs) {
        ArrayList<Auto> zoeklijst = new ArrayList<Auto>();

        for( Auto auto : autolijst ) {
            if(auto.getPrijs() <= max_prijs ) {
                zoeklijst.add(auto);
            }
        }
        return zoeklijst;
    }

    public ArrayList<Auto> zoekAutoOpMerk(String merk) {
        ArrayList<Auto> zoeklijst = new ArrayList<Auto>();

        for( Auto auto : autolijst ) {
            if( auto.getMerk().equalsIgnoreCase(merk) ) {
                zoeklijst.add(auto);
            }
        }
        return zoeklijst;
    }
    
    public ArrayList<Auto> getAutolijst() {

        return autolijst;
    }
    
    public ArrayList<String> getMerken() {
        ArrayList<String> merken = new ArrayList<String>();

        for( Auto auto : autolijst ) {
            boolean exists = false;
            for( String merk : merken ) {
                if( auto.getMerk().equalsIgnoreCase(merk) ) {
                    exists = true;
                }
            }
            if(!exists) {
                merken.add(auto.getMerk());
            }
        }
        return merken;
    }
}
