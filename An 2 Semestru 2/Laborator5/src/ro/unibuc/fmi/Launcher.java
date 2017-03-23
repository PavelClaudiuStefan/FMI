package ro.unibuc.fmi;

import java.io.IOException;
import java.util.Scanner;

import ro.unibuc.fmi.bazadedate.BazaDeDate;
import ro.unibuc.fmi.date.Persoana;
import ro.unibuc.fmi.date.Profesor;
import ro.unibuc.fmi.date.Student;

public class Launcher
{

    public static void main(String[] args) throws IOException, ClassNotFoundException
    {

        BazaDeDate bd = new BazaDeDate();
        // Pentru testare, de-comentati aici:
        // addMockData(bd);
        // bd.afisarePersoane();
        // // FACETI SALVAREA
        // bd.clear();
        // // FACETI INCARCAREA
        // bd.afisarePersoane();

        while (executaMeniu(bd))
            ;
    }

    public static boolean executaMeniu(BazaDeDate bd)
    {
        System.out.println("1. Adaugare persoana de la tastatura");
        System.out.println("2. Stergere persoanele din baza de date");
        System.out.println("3. Afisare persoane");
        System.out.println("4. Salvare in fisier");
        System.out.println("5. Incarcare din fisier");
        System.out.println("6. Cauta o persoana");
        System.out.println("7. Sterge o persoana");
        System.out.println("8. Iesire");
        Scanner scanner = new Scanner(System.in);
        String next = scanner.next();
        int optiune = Integer.parseInt(next);
        switch (optiune)
        {
        case 1:
            bd.adaugaPersoana(citestePersoana());
            return true;
        case 2:
            bd.clear();
            return true;
        case 3:
            bd.afisarePersoane();
            return true;
        case 4:
            System.out.println("Tastati numele fisierului:");
            // bd.salvarePersoane(new File(scanner.next()));
            return true;
        case 5:
            System.out.println("Tastati numele fisierului:");
            // bd.incarcarePersoane(new File(scanner.next()));
            return true;
        case 6:
            return true;
        case 7:
            return true;
        case 8:
            return false;
        default:
            System.out.println("Alegeti o optiune de la 1 la 6");
            return true;
        }
    }

    public static void addMockData(BazaDeDate bd)
    {
        Student stud;
        Profesor prof;

        stud = new Student();
        stud.setAnDeStudiu(2);
        stud.setFacultate("FacultateStudent");
        stud.setNume("NumeStudent");
        stud.setPrenume("PrenumeStudent");
        stud.setVarsta(22);
        bd.adaugaPersoana(stud);

        prof = new Profesor();
        prof.setCatedra("CatedraProfesor");
        prof.setNume("NumeProfesor");
        prof.setPrenume("PrenumeProfesor");
        prof.setTitlu("TitluProfesor");
        prof.setVarsta(56);
        prof.setVechime(26);
        bd.adaugaPersoana(prof);
    }

    public static Persoana citestePersoana()
    {
        // TODO
        return null;
    }

}
