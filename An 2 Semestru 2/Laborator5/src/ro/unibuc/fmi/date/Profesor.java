/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.unibuc.fmi.date;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Scanner;

/**
 *
 */
public class Profesor extends Persoana
{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private int vechime;
    private String titlu, catedra;

    public int getVechime()
    {
        return vechime;
    }

    public void setVechime(int vechime)
    {
        this.vechime = vechime;
    }

    public String getTitlu()
    {
        return titlu;
    }

    public void setTitlu(String titlu)
    {
        this.titlu = titlu;
    }

    public String getCatedra()
    {
        return catedra;
    }

    public void setCatedra(String catedra)
    {
        this.catedra = catedra;
    }

    @Override
    public String toString()
    {
        return "Profesor{" + super.toString() + ", " + "vechime=" + vechime + ", titlu=" + titlu + ", catedra=" + catedra + '}';
    }

    @Override
    public void readFromScanner(Scanner scan)
    {
        super.readFromScanner(scan);
        titlu = scan.next();
        vechime = scan.nextInt();
        catedra = scan.next();
    }

    @Override
    public void writeToStream(OutputStream output)
    {
        PrintWriter out = new PrintWriter(output);
        out.print("p,");
        out.flush();
        super.writeToStream(output);
        out.print(",");
        out.print(titlu);
        out.print(",");
        out.print(vechime);
        out.print(",");
        out.print(catedra);
        out.flush();
    }
}
