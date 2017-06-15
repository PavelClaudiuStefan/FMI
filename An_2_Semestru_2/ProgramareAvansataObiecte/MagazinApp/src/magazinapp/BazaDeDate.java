/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package magazinapp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

/**
 *
 * @author Student
 */
public class BazaDeDate {
    
    ArrayList<Factura> facturi = new ArrayList<Factura>();

    public void salvare() throws IOException
    {
        
        try (
            FileOutputStream fao = new FileOutputStream(new File("date.txt"));
            ObjectOutputStream oos= new ObjectOutputStream(fao)
        ){

            for(Factura f : facturi) {
                oos.writeObject(f);
            }
            
            oos.writeObject(new EOFMarker());
            
        }

        
    }

    public void incarcarePersoane(File file) throws IOException, ClassNotFoundException
    {
        facturi = new ArrayList<>();
        try (
            FileInputStream fis = new FileInputStream(file);
            ObjectInputStream ois= new ObjectInputStream(fis);      

        ){
            Object ob;
            do {
                ob = ois.readObject();
                if(ob instanceof Factura) {
                    facturi.add((Factura)ob);
                }
            } while(ob instanceof Factura);
        }
    }
    
    public void adaugareFactura(Factura fac) {
        facturi.add(fac);
    }
}
