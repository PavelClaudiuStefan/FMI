/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.unibuc.fmi.date;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.Scanner;

/**
 *
 */
public class Persoana implements Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private String nume, prenume;
    private int varsta;

    public String getNume()
    {
        return nume;
    }

    public void setNume(String nume)
    {
        this.nume = nume;
    }

    public String getPrenume()
    {
        return prenume;
    }

    public void setPrenume(String prenume)
    {
        this.prenume = prenume;
    }

    public int getVarsta()
    {
        return varsta;
    }

    public void setVarsta(int varsta)
    {
        this.varsta = varsta;
    }

    @Override
    public String toString()
    {
        return "nume=" + nume + ", prenume=" + prenume + ", varsta=" + varsta;
    }

    public void readFromScanner(Scanner scan)
    {
        nume = scan.next();
        prenume = scan.next();
        varsta = scan.nextInt();
    }

    public void writeToStream(OutputStream output)
    {
        PrintWriter out = new PrintWriter(output);
        out.print(nume);
        out.print(",");
        out.print(prenume);
        out.print(",");
        out.print(varsta);
        out.flush();
    }

}
