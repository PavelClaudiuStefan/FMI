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
public class Produs {
    String nume;
    float pret;
    
    public Produs (String nume , float pret) {
        this.pret = pret;
        this.nume = nume;
    }
    
    public String getNume() {
        return nume;
    }
    
    public float getPret () {
        return pret;
    }
    
    public void setNume(String nume) {
        this.nume = nume;
    }
    
    public void setPret(float pret) {
        this.pret = pret;
    }
}
