package ro.unibuc.fmi.bazadedate;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import ro.unibuc.fmi.date.Persoana;

public class BazaDeDate
{

    private List<Persoana> persoane;

    public BazaDeDate()
    {
        persoane = new ArrayList<Persoana>();
    }

    public void adaugaPersoana(Persoana persoana)
    {
        persoane.add(persoana);
    }

    public Persoana findPersoana(String nume)
    {

        return null;
    }

    public void salvarePersoane(File file) throws IOException
    {
        
        try (
            FileOutputStream fao = new FileOutputStream(file);
            ObjectOutputStream oos= new ObjectOutputStream(fao)
        ){

            for(Persoana p : persoane) {
                p.setVarsta(~p.getVarsta());
                oos.writeObject(p);
            }
            
            oos.writeObject(new EOFMarker());
            
        }

        
    }

    public void afisarePersoane()
    {
        for (Persoana pers : persoane)
        {
            System.out.println(pers);
        }
    }

    public void incarcarePersoane(File file) throws IOException, ClassNotFoundException
    {
        try (
            
            FileInputStream fis = new FileInputStream(file);
            ObjectInputStream ois= new ObjectInputStream(fis);      

        ){
            Object ob;
            do {
                ob = ois.readObject();
                if(ob instanceof Persoana) {
                    //Salvare persoana intr-un array
                    System.out.println("ceva");
                }
            } while(ob instanceof Persoana);
        }
    }

    public void clear()
    {
        System.out.println("DB Clear");
        persoane.clear();
    }

}
