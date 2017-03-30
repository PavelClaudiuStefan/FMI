/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package magazinapp;

/**
 *
 * @author Student
 */
public class ProdusCumparat {
    Produs p;
    int cantitate;
    
    public ProdusCumparat(int cantitate , Produs p) {
        this.cantitate = cantitate;
        this.p = p;
    }
    
    public Produs getProdus () {
        return p;
    }
    
    public int getCantiate() {
        return cantitate;
    }
    
    public void setProdus (Produs p) {
        this.p = p;
    }
    
    public void setCantitate (int cantitate) {
        this.cantitate = cantitate;
    }
    
    public String toString () {
        return " ( " +p.getNume() + " " + p.getPret() + cantitate + ") " ;
    }
}
