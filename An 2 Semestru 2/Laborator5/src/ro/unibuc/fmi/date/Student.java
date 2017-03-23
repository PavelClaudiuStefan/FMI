/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.unibuc.fmi.date;


/**
 *
 */
public class Student extends Persoana
{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private int anDeStudiu;
    private String facultate;

    public int getAnDeStudiu()
    {
        return anDeStudiu;
    }

    public void setAnDeStudiu(int anDeStudiu)
    {
        this.anDeStudiu = anDeStudiu;
    }

    public String getFacultate()
    {
        return facultate;
    }

    public void setFacultate(String facultate)
    {
        this.facultate = facultate;
    }

    @Override
    public String toString()
    {
        return "Student{" + super.toString() + ", " + "anDeStudiu=" + anDeStudiu + ", facultate=" + facultate + '}';
    }

}
