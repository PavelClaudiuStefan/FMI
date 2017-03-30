/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package magazinapp;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Student
 */
public class Factura implements Serializable{
    ArrayList<ProdusCumparat> listaProduse = new ArrayList<ProdusCumparat>();
    String numeCumparator;
    int id;
    static int lastIdUsed = 0;

      public Factura(ArrayList<ProdusCumparat> listaProduse , String nume) {
        genereazaId();
        this.id = lastIdUsed + 1;
        this.listaProduse = listaProduse;
        this.numeCumparator = nume;
    }

    public String getNume () {
        return numeCumparator;
    }
    public int getId() {
        return id;
    }

    public ArrayList<ProdusCumparat> getListaProduse() {
        return listaProduse;
    }

    public String getNumeCumparator() {
        return numeCumparator;
    }

    public void setListaProduse(ArrayList<ProdusCumparat> listaProduse) {
        this.listaProduse = listaProduse;
    }

    public void setNumeCumparator(String numeCumparator) {
        this.numeCumparator = numeCumparator;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    @Override
    public String toString () {
        String rez = id +". ";
        for(ProdusCumparat p : listaProduse) {
           rez += p +", ";
        }
        
        return rez;
    }
    
    public static void genereazaId () {
        lastIdUsed++;
    }
    
    public void adaugaProdusNou(ProdusCumparat prod) {
        listaProduse.add(prod);
    }
    
    public void eliminareProdus(int pozitie) {
        listaProduse.remove(pozitie);
    }

}
